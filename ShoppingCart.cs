using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PROJECT_FINAL
{
    [Serializable]
    public class CartItem
    {
        private int productID;
        private string productName;
        private string imageUrl;
        private int quantity;
        private double price;
        private double subTotal;

        public CartItem()
        { 
        }
        public CartItem(int ProductID, string ProductName, string ImageUrl, int Quantity, double Price)
        {
            productID = ProductID;
            productName = ProductName;
            imageUrl = ImageUrl;
            quantity = Quantity;
            price = Price;
            subTotal = Quantity * Price;

        }
        public int ProductID
        {
            get { return productID;}
            set { productID = value; }
        }
        public string ProductName
        {
            get { return productName;} 
            set { productName = value; }

        }
        public string ImageUrl
        { 
            get { return imageUrl;} 
            set { imageUrl = value; } 
        }
        public int Quantity
        { 
            get { return quantity; } 
            set { quantity= value; }
        }
        public double Price
        { 
            get { return price; }
            set { price= value; } 
        }
        public double SubTotal
        {
            get { return quantity * price; }
        }
    }
    [Serializable]
    public class Cart
    {
        private DateTime dateCreated;
        private DateTime lastUpdate;
        private List<CartItem> items;

        public Cart()
        {
            if (this.items == null)
            {
                this.items = new List<CartItem>();
                this.dateCreated= DateTime.Now;
            }
        }
        public List<CartItem> Items
        { 
            get { return items; } 
            set { items = value; }
        }

        private int getItemIndexOfID(int ProductID)
        {
            int index = 0;
            foreach(CartItem item in items)
            {
                if (item.ProductID == ProductID)
                {
                    return index;
                }
                index+= 1;
            }
            return -1;
        }
        public void Insert(int ProductID,double Price,int Quantity,string ProductName,string ImageUrl)
        {
            int ItemIndex=getItemIndexOfID(ProductID);
            if(ItemIndex==-1)
            {
                CartItem NewItem= new CartItem();
                NewItem.ProductID = ProductID;
                NewItem.Quantity = Quantity;
                NewItem.Price = Price;
                NewItem.ProductName = ProductName;
                NewItem.ImageUrl = ImageUrl;
                items.Add(NewItem);
            }
            else
            {
                items[ItemIndex].Quantity += 1;
            }
            lastUpdate=DateTime.Now;
        }

        public void Update(int RowID,int ProductID,int Quantity, double Price)
        {
            CartItem Item= items[RowID];
            Item.ProductID= ProductID;
            Item.Quantity = Quantity;
            Item.Price = Price;
            lastUpdate=DateTime.Now;
        }
        public void DeleteItem(int RowID)
        {
            items.RemoveAt(RowID);
            lastUpdate=DateTime.Now;
        }
        public double Total
        {
            get
            {
                double t = 0;
                if(items==null)
                {
                    return 0;
                }
                foreach(CartItem item in items)
                {
                    t += item.SubTotal;
                }
                return t;
            }
        }
    }

}