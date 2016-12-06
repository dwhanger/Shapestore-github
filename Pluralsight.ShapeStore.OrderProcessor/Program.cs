using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

using Amazon.SQS;
using Amazon.SQS.Model;
using Newtonsoft.Json;
using Pluralsight.ShapeStore.Objects;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace Pluralsight.ShapeStore.OrderProcessor
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("** Shapestore - Receive/Delete From Queue **");

            ConsoleKeyInfo cki = new ConsoleKeyInfo();

            //get the queue name
            string sqsQueueNameString = ConfigurationManager.AppSettings["SQSQueueName"];

            Amazon.SQS.AmazonSQSConfig cfg = new Amazon.SQS.AmazonSQSConfig();
            cfg.ServiceURL = sqsQueueNameString;
            cfg.RegionEndpoint = Amazon.RegionEndpoint.USWest2;

            //create client object
            AmazonSQSClient client = new AmazonSQSClient("AKIAIXPBRGE44CGK657A", "R6jykIYQK0eiMR1sjBex3UNwzH2Q65mQW0x4DTh8", cfg);

            //loop continually
            do
            {
                while (Console.KeyAvailable == false)
                {
                    //call private polling function
                    PollQueue(client);

                    Thread.Sleep(10000); // Loop until input is entered.
                }
                cki = Console.ReadKey(true);


            } while (cki.Key != ConsoleKey.X); // stop processing if admin presses "x"

            Console.WriteLine("Shutting down ...");
            
        }

        private static void PollQueue(AmazonSQSClient client)
        {
            //connect to queue and process records
            Console.WriteLine("Polling queue ...");

            //get the queue name
            string sqsQueueNameString = ConfigurationManager.AppSettings["SQSQueueName"];

            ReceiveMessageRequest request = new ReceiveMessageRequest();
            request.AttributeName = new List<string>() { "All" };
            request.MaxNumberOfMessages = 10;
            request.QueueUrl = sqsQueueNameString;

            //create object to hold results
            List<Message> queueMessages = new List<Message>();

            //receive message(s), if any            
            ReceiveMessageResponse response = client.ReceiveMessage(request);

            if (response.ReceiveMessageResult.Message.Count != 0)
            {
                //get list of queue messages
                queueMessages = response.ReceiveMessageResult.Message;
                Console.WriteLine("Queue messages received; count is " + queueMessages.Count.ToString());

                //loop through each message that comes back
                foreach(Message m in queueMessages)
                {
                    //add to database
                    ShoppingCart cart = JsonConvert.DeserializeObject<ShoppingCart>(m.Body);

                    InsertOrder(cart);
                }
                
                //delete all the messages
                DeleteMessages(client, queueMessages);
            }
        }


        private static void InsertOrder(ShoppingCart cart)
        {
            //generate order ID
            string orderId = System.Guid.NewGuid().ToString();

            //connection string for MySQL
            string connString = ConfigurationManager.ConnectionStrings["StoreSqlDb"].ConnectionString;

            //connect to MySQL
            using (MySqlConnection conn = new MySqlConnection(connString))
            {
                conn.Open();

                //add parent order record
                string commString = "INSERT INTO orders (OrderId, CustomerId, CCNumber, CCExpiration, CCType) VALUES (@OrderId, @CustomerId, @CCNumber, @CCExpiration, @CCType)";

                using (MySqlCommand comm = new MySqlCommand(commString, conn))
                {
                    comm.Parameters.AddWithValue("@OrderId", orderId);
                    comm.Parameters.AddWithValue("@CustomerId", cart.CustomerId);
                    comm.Parameters.AddWithValue("@CCNumber", cart.CcNumber);
                    comm.Parameters.AddWithValue("@CCExpiration", cart.CcExpiration);
                    comm.Parameters.AddWithValue("@CCType", cart.CcType);

                    comm.ExecuteNonQuery();
                }

                //add individual order item records

                string comm2String = "INSERT INTO orderitems (OrderItemId, OrderId, ItemId, UnitPrice) VALUES (@OrderItemId, @OrderId, @ItemId, @UnitPrice)";

                using (MySqlCommand comm2 = new MySqlCommand(comm2String, conn))
                {
                    foreach (ShoppingCartItem item in cart.Items)
                    {
                        comm2.Parameters.Clear();

                        comm2.Parameters.AddWithValue("@OrderItemId", System.Guid.NewGuid().ToString());
                        comm2.Parameters.AddWithValue("@OrderId", orderId);
                        comm2.Parameters.AddWithValue("@ItemId", item.ProductId);
                        comm2.Parameters.AddWithValue("@UnitPrice", item.PriceWhenAdded);

                        comm2.ExecuteNonQuery();
                    }
                }

            }

        }

        private static void DeleteMessages(AmazonSQSClient client, List<Message> queueMessages)
        {
            //get the queue name
            string sqsQueueNameString = ConfigurationManager.AppSettings["SQSQueueName"];

            //delete message(s)
            DeleteMessageBatchRequest batchRequest = new DeleteMessageBatchRequest();
            batchRequest.QueueUrl = sqsQueueNameString;
            batchRequest.Entries = new List<DeleteMessageBatchRequestEntry>();
            foreach (Message m in queueMessages)
            {
                DeleteMessageBatchRequestEntry r = new DeleteMessageBatchRequestEntry();
                r.ReceiptHandle = m.ReceiptHandle;
                r.Id = m.MessageId;
                batchRequest.Entries.Add(r);
            }

            DeleteMessageBatchResponse batchResponse = client.DeleteMessageBatch(batchRequest);

            Console.WriteLine("Queue message(s) deleted");
        }
    }
}
