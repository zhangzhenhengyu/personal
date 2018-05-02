using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LazyEating.Model
{
    public class CartRecord
    {
        public int UserID { get; set; }
        public int FoodID
        {
            get { return Food.FoodID; }
            set { this.Food.FoodID = value; }
        }
        public string FoodName
        {
            get { return Food.FoodName; }
            set { this.Food.FoodName = value; }
        }
        public int Count { get; set; }
        public decimal UnitPrice { get; set; }

        public Food Food { get; set; }
        public CartRecord() 
        {
            this.Food = new Food();
        }
        public CartRecord(int userID,Food food, int count = 1)
        {
            this.Food = food;
            this.UnitPrice = food.Price;
            this.Count = count;
        }
    }
}
