using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Pluralsight.ShapeStore.Objects;

namespace Pluralsight.ShapeStore
{
    public partial class Cart1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //grab shopping cart from application session
            ShoppingCart cart = Session.Contents["cart"] as ShoppingCart;

            //not created yet?
            if (cart == null)
            {
                cart = new ShoppingCart();
            }

            //did they add a new item?
            if (!IsPostBack && Request.QueryString["itemid"] != null)
            {
                cart.Items.Add(new ShoppingCartItem() { ProductId = Request.QueryString["itemid"], ProductName=Request.QueryString["name"], DateAdded = DateTime.Now, Quantity = 1, PriceWhenAdded = float.Parse(Request.QueryString["price"]) });

                Session.Contents["cart"] = cart;
            }

            //load table from cart
            gvCart.DataSource = cart.Items;
            gvCart.DataBind();
        }

        protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //get cart from application session
            ShoppingCart cart = Session.Contents["cart"] as ShoppingCart;

            //identify item to delete
            int index = Convert.ToInt32(e.CommandArgument);

            cart.Items.RemoveAt(index);

            //update cart
            Session.Contents["cart"] = cart;

            //rebind grid view
            gvCart.DataSource = cart.Items;
            gvCart.DataBind();
        }
    }
}