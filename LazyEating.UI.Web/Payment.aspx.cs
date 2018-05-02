using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LazyEating.Repository;
using LazyEating.Model;

namespace LazyEating.UI.Web
{
    public partial class Payment : System.Web.UI.Page
    {
        User loginUser;

        UserRepository userRepository = new UserRepository();
        OrderRepository orderRepository = new OrderRepository();

        public Order order = new Order();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginUserName"] == null)
                return;

            loginUser = userRepository.FindBy(Session["loginUserName"].ToString());
            order = orderRepository.FindByID(int.Parse(Request.QueryString["OrderID"].ToString()));
        }

        protected void btnPayment_Click(object sender, EventArgs e)
        {
            order.OrderState = OrderState.已付款;
            orderRepository.Save(order);
            Message.Text = "支付成功";
            Response.Write("<Script Language='JavaScript'>window.alert('" + "支付成功" + "');</script>");

        }
    }
}