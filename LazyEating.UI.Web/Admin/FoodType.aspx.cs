using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LazyEating.UI.Web.Admin
{
    public partial class FoodType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lvFoodType.DataSource = new LazyEating.Repository.FoodRepository().FindAllType();
            lvFoodType.DataBind();
        }
    }
}