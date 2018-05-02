using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LazyEating.Model;
using LazyEating.Repository;

namespace LazyEating.UI.Web.Admin
{
    public partial class OrderList : System.Web.UI.Page
    {
        OrderRepository orderRepository = new OrderRepository();

        List<Order> orders = new List<Order>();

        protected void Page_Load(object sender, EventArgs e)
        {
            lvwOrderDataPager.PreRender += new EventHandler(lvwOrderDataPager_PreRender);
            if (Request.QueryString["orderTypeID"] != null)
            {
                int orderTypeID = int.Parse(Request.QueryString["orderTypeID"].ToString());
                if (orderTypeID == 0)
                    orders = orderRepository.FindAll().ToList();
                else
                    orders = orderRepository.FindBy((OrderState)orderTypeID).ToList();
            }
            else
            {
                orders = orderRepository.FindAll().ToList();
            }
        }

        void lvwOrderDataPager_PreRender(object sender, EventArgs e)
        {
            BindData();
            // throw new NotImplementedException();
        }

        private void BindData()
        {
            lvwOrders.DataSource = orders;
            lvwOrders.DataBind();
        }
    }
}