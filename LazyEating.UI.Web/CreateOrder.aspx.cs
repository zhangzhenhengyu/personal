using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LazyEating.Model;
using LazyEating.Repository;

namespace LazyEating.UI.Web
{
    public partial class CreateOrder : System.Web.UI.Page
    {

        FoodRepository foodRepository = new FoodRepository();
        UserRepository userRepository = new UserRepository();
        CartRepository cartRepository = new CartRepository();
        OrderRepository orderRepository = new OrderRepository();

        public User loginUser;

        protected void Page_Load(object sender, EventArgs e)
        {
            // 用户没有登录
            if (Session["loginUserName"] == null)
                return;

            // 用户已登录
            
            // 初始化登录用户
            loginUser = userRepository.FindBy(Session["loginUserName"].ToString());
            // 查看用户购物车
            loginUser.CartRecords = cartRepository.FindBy(loginUser.UserID).ToList();

            // 输出用户的基本信息
            if (!this.IsPostBack)
            { 
                txtAddress.Text = loginUser.Addess;
                txtPhone.Text = loginUser.Phone;
                txtRealName.Text = loginUser.RealName;
            }

            // 显示用户购物车的内容
            lvwCarts.DataSource = loginUser.CartRecords;
            lvwCarts.DataBind();

        }

        protected void lvwCarts_OnItemCommand(object sender, ListViewCommandEventArgs e)
        {
            ListViewDataItem dataItem = (ListViewDataItem)e.Item;
            int foodID = int.Parse(lvwCarts.DataKeys[dataItem.DisplayIndex].Value.ToString());
            Food checkFood = ((List<CartRecord>)loginUser.CartRecords).Find(food => food.FoodID == foodID).Food;

            if (String.Equals(e.CommandName, "CountAdd"))
            {
                this.AddFoodToCart(checkFood);
            }
            if (String.Equals(e.CommandName, "CountSub"))
            {
                this.SubFoodToCart(checkFood);
            }
        }

        private void AddFoodToCart(Food food)
        {
            loginUser.AddToCart(food);
            lvwCarts.DataBind();
            cartRepository.Add(loginUser.UserID, food.FoodID, food.Price);
        }

        private void SubFoodToCart(Food food)
        {
            loginUser.SubToCart(food);
            lvwCarts.DataBind();
            cartRepository.Delete(loginUser.UserID, food.FoodID);
        }

        protected void btnCreateOrder_Click(object sender, EventArgs e)
        {
            if (loginUser.CanCreateOrder)
            {
                try
                {
                    Order order = loginUser.CreateOrder();
                    order.Address = txtAddress.Text;
                    order.Phone = txtPhone.Text;
                    order.RealName = txtRealName.Text;
                    int orderID = orderRepository.Add(order);
                    cartRepository.Clear(loginUser.UserID);
                    Response.Redirect("Payment.aspx?OrderID=" + orderID);
                }
                catch(Exception ex)
                {
                    Message.Text = "提交订单失败！<br/>" + ex.Message;
                }
            }
            else
            {
                Response.Write("<Script Language='JavaScript'>window.alert('" + "购物车里还没有美食，<br />赶紧去商城逛逛吧！" + "');</script>");
            }

        }

    }
}