using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LazyEating.Model
{
    public class User
    {
        public int UserID { get; set; }
        public string UserName{ get; set; }
        public int UserTypeID 
        {
            get { return this.UserType.UserTypeID; }
            set { this.UserType.UserTypeID = value; }
        }
        public string Password { get; set; }
        public string Addess{ get; set; }
        public string Sex{ get; set; }
        public string RealName{ get; set; }
        public string Phone{ get; set; }

        public bool CanCreateOrder
        {
            get { return (this.CartRecords.Count > 0); }
        }

        // 扩展属性
        public UserType UserType{ get; set; }
        public IList<CartRecord> CartRecords { get; set; }
        public IList<Order> Orders { get; set; }

        // 构造函数
        public User() 
        {
            this.UserType = new UserType();
            this.CartRecords = new List<CartRecord>();
            this.Orders = new List<Order>();
        }
        public User
            (string name, UserType UserType, string address, string sex, string realName, string phone)
        {
            this.UserName = name;
            this.UserType = UserType;
            this.Addess = address;
            this.Sex = sex;
            this.RealName = realName;
            this.Phone = phone;
        }


        //public void CreateOrder()
        //{
        //    if (this.CanCreateOrder)
        //    {
        //        List<OrderDetail> orderDetails = new List<OrderDetail>();
        //        {
        //            foreach (CartRecord cartRecord in this.CartRecords)
        //            {
        //                orderDetails.Add(new OrderDetail(this.UserID, cartRecord.FoodID, cartRecord.Count, cartRecord.UnitPrice));
        //            }
        //        }
        //        Order order = new Order();
        //    }
        //    else 
        //    { }
        //}

        public decimal GetCartTotle
        {
            get
            {
                if (!this.CanCreateOrder)
                    return 0;
                else
                {
                    decimal totle = 0;
                    foreach (CartRecord cartRecord in this.CartRecords)
                    {
                        totle += cartRecord.UnitPrice * cartRecord.Count;
                    }
                    return totle;
                }
            }
        }

        // 在购物车中查找商品
        // 如果有，返回 下标
        // 如果没有，返回 -1
        public int FindFoodInCart(int foodID)
        {
            int i;
            for (i = 0; i < this.CartRecords.Count; i++)
            {
                if (foodID == CartRecords[i].Food.FoodID)
                    break;
            }

            // 购物车中没有在此商品
            if (i == CartRecords.Count)
            {
                i = -1;
            }

            return i;
        }

        public void AddToCart(Food food)
        {
            int i = this.FindFoodInCart(food.FoodID);
            if (i == -1)
            {
                this.CartRecords.Add(new CartRecord(this.UserID,food));
            }
            else
            {
                this.CartRecords[i].Count++;
            }

        }

        public void SubToCart(Food food)
        {
            int i = this.FindFoodInCart(food.FoodID);
            if (i != -1)
            {
                if (this.CartRecords[i].Count > 1)
                {
                    this.CartRecords[i].Count--;
                }
                else
                {
                    this.CartRecords.RemoveAt(i);
                }

            }
        }

        public Order CreateOrder()
        {
            Order order = new Order();
            order.UserID = this.UserID;
            order.RealName = this.RealName;
            order.Address = this.Addess;
            order.Phone = this.Phone;
            order.Totle = this.GetCartTotle;
            order.OrderState = OrderState.未付款;

            OrderDetail orderDetail;
            foreach (CartRecord cartRecord in this.CartRecords)
            {
                orderDetail = new OrderDetail();
                orderDetail.FoodID = cartRecord.FoodID;
                orderDetail.Quatity = cartRecord.Count;
                orderDetail.UnitPrice = cartRecord.UnitPrice;
                orderDetail.Food = cartRecord.Food;
                order.OrderDetails.Add(orderDetail);
            }
            this.Orders.Add(order);
            return order;
        }

    }
}
