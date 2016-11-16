using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pluralsight.ShapeStore.Objects
{
    [Serializable]
    public class ShoppingCart
    {
        public string CustomerId { get; set; }
        public DateTime DateCreated { get; set; }
        public string CcType { get; set; }
        public string CcNumber { get; set; }
        public string CcExpiration { get; set; }
        public List<ShoppingCartItem> Items { get; set; }

        public ShoppingCart()
        {
            DateCreated = DateTime.Now;
            Items = new List<ShoppingCartItem>();
        }

    }

    [Serializable]
    public class ShoppingCartItem
    {
        public string ProductId { get; set; }
        public string ProductName { get; set; }
        public int Quantity { get; set; }
        public float PriceWhenAdded { get; set; }
        public DateTime DateAdded { get; set; }
    }
}
