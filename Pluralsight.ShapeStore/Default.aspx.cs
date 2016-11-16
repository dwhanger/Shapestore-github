using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Pluralsight.ShapeStore.Objects;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace Pluralsight.ShapeStore
{
    public partial class Default1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //create catalog of items to show on the home page
            List<CatalogItem> items = GetCatalog();

            catalogList.DataSource = items;
            catalogList.DataBind();
        }

        private List<CatalogItem> GetCatalog()
        {
            List<CatalogItem> items = new List<CatalogItem>();

            //connectstring for MySQL
            string connString = ConfigurationManager.ConnectionStrings["StoreSqlDb"].ConnectionString;

            //connect to MySQL
            using (MySqlConnection conn = new MySqlConnection(connString))
            {
                conn.Open();
                string commString = "SELECT * FROM products";

                MySqlCommand comm = new MySqlCommand(commString, conn);

                MySqlDataReader reader = comm.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                //load up item collection
                while (reader.Read())
                {
                    CatalogItem item = new CatalogItem();
                    item.itemId = reader["ItemId"].ToString();
                    item.itemName = reader["ItemName"].ToString();
                    item.itemCategory = reader["ItemCategory"].ToString();
                    item.shortDescription = reader["ShortDescription"].ToString();
                    item.longDescription = reader["LongDescription"].ToString();
                    item.quantityInStock = Convert.ToInt32(reader["QuantityInStock"]);
                    item.unitPrice = (float)(reader["UnitPrice"]);
                    item.imageReference = reader["ImageReference"].ToString();

                    items.Add(item);
                }
            }

            return items;
        }
    }
}