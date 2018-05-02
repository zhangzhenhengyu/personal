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
    public partial class FoodList : System.Web.UI.Page
    {
        FoodRepository foodRepository = new FoodRepository();
        List<Food> foods;

        protected void Page_Load(object sender, EventArgs e)
        {

            // lvFood.PreRender += new EventHandler(lvFood_PreRender);
            lvFoodDataPager.PreRender += new EventHandler(lvFood_PreRender);
            foods = foodRepository.FindAll().ToList();
        }

        void lvFood_PreRender(object sender, EventArgs e)
        {
            BindData();
            // throw new NotImplementedException();
        }

        private void BindData()
        {
            lvFood.DataSource = foods;
            lvFood.DataBind();

        }

        // (object sender, ListViewDeleteEventArgs e)
        // ContactsListView_ItemDeleted
        public void lvFood_OnItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            int foodID = int.Parse(lvFood.DataKeys[e.ItemIndex].Value.ToString());
            //string foodName = lvFood.DataKeys[e.ItemIndex].Value.ToString();

            ////  Delete FoodItem Where FoodID = foodID
            ////  From SQL Server LazyEating
            foodRepository.Delete(foodID);

            ////  Delete FoodItem Where FoodID = foodID
            ////  From FoodListView
            foods.Remove(foods.Find(fd => fd.FoodID == foodID));

            //BindData();
        }

    }
}