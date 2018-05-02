using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LazyEating.Model
{
    public class Food
    {
        public int FoodID { get; set; }
        public string FoodName { get; set; }
        public int FoodTypeID  
        { 
            get { return this.FoodType.FoodTypeID; }
            set { this.FoodType.FoodTypeID = value; } 
        }
        public decimal Price { get; set; }

        private string picUrl;
        public string PicUrl
        {
            get { return this.picUrl; }
            set { this.picUrl = value; }
        }
        public int SalesVolume { get; set; }
        public DateTime AddDate { get; set; }
        public string Describe { get; set; }


        // 扩展属性
        public FoodType FoodType { get; set; }

        // 构造函数
        public Food()
        {
            this.FoodType = new FoodType();
        }
        public Food(int id, string name, FoodType foodType, decimal price, string picUrl, int salesVolume, DateTime addDate, string desicribe = "暂无描述")
        {
            this.FoodID = id;
            this.FoodName = name;
            this.FoodType = foodType;
            this.Price = price;
            this.PicUrl = picUrl;
            this.SalesVolume = salesVolume;
            this.AddDate = addDate;
            this.Describe = desicribe;
        }

    }
}
