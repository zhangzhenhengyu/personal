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
    public partial class FoodEdit : System.Web.UI.Page
    {
        FoodRepository foodRepository = new FoodRepository();
        List<LazyEating.Model.FoodType> foodTypes;
        public Food food;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                foodTypes = foodRepository.FindAllType().ToList();

                ddlFoodType.DataSource = foodTypes;
                ddlFoodType.DataTextField = "FoodTypeName";
                ddlFoodType.DataValueField = "FoodTypeID";
                ddlFoodType.DataBind();
            }
            // 初始化表单内容
            if (Request.QueryString["foodID"] != null)
            {
                int foodID = int.Parse(Request.QueryString["foodID"].ToString());
                food = foodRepository.FindBy(foodID);

                txtAddData.Text = food.AddDate.ToString();
                txtDescribe.Text = food.Describe;
                txtFoodName.Text = food.FoodName;
                txtPrice.Text = food.Price.ToString();
                txtSalesVolume.Text = food.SalesVolume.ToString();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            food = new Food();
            food.FoodID = int.Parse(Request.QueryString["foodID"]);
            food.AddDate = DateTime.Parse(txtAddData.Text);
            food.Describe = txtDescribe.Text;
            food.FoodName = txtFoodName.Text;
            food.Price = decimal.Parse(txtPrice.Text);
            food.SalesVolume = int.Parse(txtSalesVolume.Text);
            food.FoodTypeID = ddlFoodType.SelectedIndex + 1;

            if(foodRepository.Save(food)>0)
            {
                Response.Write("<script>alert('修改成功！')</script>");
            }
            else
                Response.Write("<script>alert('修改失败！')</script>");
        }
    }
}