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
    public partial class FoodDetail : System.Web.UI.Page
    {
        FoodRepository foodRepository = new FoodRepository();
        public Food food;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["foodID"] != null)
            {
                int foodID = int.Parse(Request.QueryString["foodID"].ToString());
                food = foodRepository.FindBy(foodID);
            }
        }



    }
}