using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LazyEating.Model
{
    public class OrderDetail
    {
        public int OrderDetailID { get; set; }
        public int OrderID { get; set; }
        public int FoodID { get; set; }
        public int Quatity { get; set; }
        public decimal UnitPrice { get; set; }

        public Food Food { get; set; }

        public OrderDetail() 
        {
            this.Food = new Food();
        }
        public OrderDetail( int orderID,int foodID,int quatity,decimal unitPrice)
        {
            this.OrderID = orderID;
            this.FoodID = foodID;
            this.Quatity = quatity;
            this.UnitPrice = unitPrice;
            this.Food = new Food();
        }


    }
}
