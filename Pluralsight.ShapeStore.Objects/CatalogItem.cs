using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pluralsight.ShapeStore.Objects
{
    public class CatalogItem
    {
        public string itemId { get; set; }
        public string itemName { get; set; }
        public string itemCategory { get; set; }
        public string shortDescription { get; set; }
        public string longDescription { get; set; }
        public float unitPrice { get; set; }
        public float salePrice { get; set; }
        public int quantityInStock { get; set; }
        public string imageReference { get; set; }
    }
}
