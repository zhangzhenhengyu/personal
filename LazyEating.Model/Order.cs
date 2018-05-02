using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LazyEating.Model
{
    public class Order
    {
        public int OrderID { get; set; }
        public int UserID { get; set; }
        public string RealName { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public decimal Totle { get; set; }
        public DateTime DateCreate { get; set; }
        public OrderState OrderState { get; set; }
        public string OrderStateString { get { return this.OrderState.ToString(); } }

        // 扩展属性
        public IList<OrderDetail> OrderDetails { get; set; }
        
        // 构造函数
        public Order() 
        {
            this.DateCreate = DateTime.Now;
            this.OrderDetails = new List<OrderDetail>();
        }
        public Order(string realName, string address, string phone, OrderState orderState = (OrderState)1)
        {
            this.RealName = realName;
            this.Address = address;
            this.Phone = phone;
            this.OrderState = orderState;
            this.DateCreate = DateTime.Now;
            this.OrderDetails = new List<OrderDetail>();
            this.Totle = 0;
            foreach (OrderDetail orderDetail in this.OrderDetails)
            {
                this.Totle += orderDetail.UnitPrice * orderDetail.Quatity;
            }
        }

        public decimal GetTotle()
        {
            decimal totle = 0;
            foreach (OrderDetail orderDetail in this.OrderDetails)
            {
                totle += orderDetail.UnitPrice * orderDetail.Quatity;
            }
            return totle;

        }

    }

    public enum OrderState { 未付款 = 1, 已付款 = 2, 已发货, 已完成 }

}
