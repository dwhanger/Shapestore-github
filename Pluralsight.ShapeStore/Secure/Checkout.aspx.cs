using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Pluralsight.ShapeStore.Objects;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Web.Security;
using Amazon.SQS;
using Amazon.SQS.Model;
using Newtonsoft.Json;

namespace Pluralsight.ShapeStore.Secure
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowCart();

            ShowContactDetails();
        }

        private void ShowCart()
        {
            //get cart from application session
            ShoppingCart cart = Session.Contents["cart"] as ShoppingCart;

            //load table from cart
            gvCart.DataSource = cart.Items;
            gvCart.DataBind();
        }

        private void ShowContactDetails()
        {
            //get user id
            MembershipUser user = Membership.GetUser();
            string userId = user.ProviderUserKey.ToString();

            //connection string to MySQL
            string connString = ConfigurationManager.ConnectionStrings["StoreSqlDb"].ConnectionString;

            //connection to MySQL to get details from user table
            using (MySqlConnection conn = new MySqlConnection(connString))
            {
                conn.Open();
                string commString = "SELECT * FROM users WHERE UserId = @UserId";

                MySqlCommand comm = new MySqlCommand(commString, conn);
                comm.Parameters.AddWithValue("@UserId", userId);

                MySqlDataReader reader = comm.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                //set label values
                while (reader.Read())
                {
                    lblName.Text = reader["FirstName"].ToString() + " " + reader["LastName"].ToString();
                    lblAddress.Text = reader["MailingStreet"].ToString();
                    lblCity.Text = reader["MailingCity"].ToString();
                    lblState.Text = reader["MailingState"].ToString();
                    lblPostal.Text = reader["MailingPostal"].ToString();
                }
            }
        }

        protected void btnPurchase_Click(object sender, EventArgs e)
        {
            //get shopping cart
            ShoppingCart cart = Session.Contents["cart"] as ShoppingCart;

            //get user id
            MembershipUser user = Membership.GetUser();
            string userId = user.ProviderUserKey.ToString();

            //add payment info
            cart.CcType = ddlCcType.SelectedItem.Text;
            cart.CcNumber = txtCcNumber.Text;
            cart.CcExpiration = txtExpire.Text;

            //get the queue name
            string sqsQueueNameString = ConfigurationManager.AppSettings["SQSQueueName"];

            Amazon.SQS.AmazonSQSConfig cfg = new Amazon.SQS.AmazonSQSConfig();
            cfg.ServiceURL = sqsQueueNameString;
            cfg.RegionEndpoint = Amazon.RegionEndpoint.USWest2;

            //"AKIAIK3JOZ6YYNWIYVWQ", "rKOBBRaTz6ltcvJEEu4wuFblQxh/PmiU4GtnCsst" being read out of the config file 
            
            //create message for queue
            using (AmazonSQSClient client = new AmazonSQSClient(cfg))
            {
                var jsoncart = Newtonsoft.Json.JsonConvert.SerializeObject(cart);

                SendMessageRequest request = new SendMessageRequest();
                request.QueueUrl = sqsQueueNameString;
                request.MessageBody = jsoncart;

                SendMessageResponse response = client.SendMessage(request);
            }

            //clear out cart
            cart.Items.Clear();
            Session["cart"] = cart;

            //send user to confirmation page
            Response.Redirect("PaymentConfirmation.aspx");
        }

    }
}