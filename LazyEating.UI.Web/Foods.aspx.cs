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
    public partial class Foods : System.Web.UI.Page
    {

        FoodRepository foodRepository = new FoodRepository();
        UserRepository userRepository = new UserRepository();
        CartRepository cartRepository = new CartRepository();

        List<Food> foods;
        
        User loginUser;

        public decimal CartTotle
        { 
            get
            {
                if (loginUser != null)
                {
                    return loginUser.GetCartTotle;
                }
                else
                    return 0;
            }
        }

        public int id;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lvwCart.DataBind();
            }

            id = 0;
            if (Request.QueryString["id"] != null)
            { 
                id = int.Parse(Request.QueryString["id"].ToString());
            }
            if (id < 1 || id > 6)
                id = 1;
            string foodData = "food_" + id;
            if (Cache[foodData] == null)
            {
                foods = foodRepository.FindByTypeID(id).ToList();
                Cache[foodData] = foods;
            }
            else
                //用缓存绑定数据 
                foods = (List<Food>)Cache[foodData];

            lvwFoods.DataSource = foods;
            lvwFoods.DataBind();

            if (Session["loginUserName"] != null)
            {
                loginUser = userRepository.FindBy(Session["loginUserName"].ToString());
                loginUser.CartRecords = cartRepository.FindBy(loginUser.UserID).ToList();
                lvwCart.DataSource = loginUser.CartRecords;
                lvwCart.DataBind();
            }
            else
            {
                loginUser = null;
                lvwCart.DataBind();
            }

        }

        protected void lvwFoods_OnItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (loginUser == null)
            {
                Response.Write("<Script Language='JavaScript'>window.alert('" + "还没有登录哦！" + "');</script>");
            }

            else if (String.Equals(e.CommandName, "AddToList"))
            {
                // Verify that the employee ID is not already in the list. If not, add the
                // employee to the list.
                ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                int foodID = int.Parse(lvwFoods.DataKeys[dataItem.DisplayIndex].Value.ToString());
                Food checkFood = foods.Find(food => food.FoodID == foodID);
                this.AddFoodToCart(checkFood);
            }
        }


        protected void lvwCart_OnItemCommand(object sender, ListViewCommandEventArgs e)
        {
            ListViewDataItem dataItem = (ListViewDataItem)e.Item;
            int foodID = int.Parse(lvwCart.DataKeys[dataItem.DisplayIndex].Value.ToString());
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
            lvwCart.DataBind();
            cartRepository.Add(loginUser.UserID, food.FoodID, food.Price);
        }

        private void SubFoodToCart(Food food)
        {
            loginUser.SubToCart(food);
            lvwCart.DataBind();
            cartRepository.Delete(loginUser.UserID, food.FoodID);
        }

        protected void btnCreatOrder_Click(object sender, EventArgs e)
        {
            if (Session["loginUserName"] == null)
            {
                Response.Write("<Script Language='JavaScript'>window.alert('" + "亲，还没有登录哦！" + "');</script>"); 
            }
            else if(!loginUser.CanCreateOrder)
            {

                Response.Write("<Script Language='JavaScript'>window.alert('" + "购物车里还没有美食，<br />赶紧去商城逛逛吧！" + "');</script>"); 
            }
            else
            {
                Session["loginUserName"] = loginUser.UserName;
                Response.Redirect("CreateOrder.aspx");
            }
        }

    }
}