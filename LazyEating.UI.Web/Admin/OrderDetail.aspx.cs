using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LazyEating.Model;
using LazyEating.Repository;

namespace LazyEating.UI.Web.Admin
{
    public partial class OrderDetail : System.Web.UI.Page
    {
        OrderRepository orderRepository = new OrderRepository();

        public Order order;

        List<Food> GoodsList = new List<Food>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["OrderID"] != null)
            {
                order = orderRepository.FindByID(int.Parse(Request.QueryString["OrderID"].ToString()));
                lvwGoodsDetail.DataSource = order.OrderDetails;
                lvwGoodsDetail.DataBind();

            }
        }
    }
}