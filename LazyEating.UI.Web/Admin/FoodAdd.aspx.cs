using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using LazyEating.Model;
using LazyEating.Repository;
using System.Drawing;

namespace LazyEating.UI.Web.Admin
{
    public partial class FoodAdd : System.Web.UI.Page
    {
        FoodRepository foodRepository = new FoodRepository();
        List<LazyEating.Model.FoodType> foodTypes;

        protected void Page_Load(object sender, EventArgs e)
        {
            foodTypes = foodRepository.FindAllType().ToList();


            if (Request.Form["txtFoodName"] == null)
            {
                // 为 ddlFoodType 绑定数据源
                ddlFoodType.DataSource = foodTypes;
                ddlFoodType.DataTextField = "FoodTypeName";
                ddlFoodType.DataValueField = "FoodTypeID";
                ddlFoodType.DataBind();
            }
            else
            { 
                OnFoodAdd();

            }
        }

        private void OnFoodAdd()
        {
            Food food = new Food();
            food.FoodName = Request.Form["txtFoodName"].ToString();
            food.Price = decimal.Parse(Request.Form["txtPrice"].ToString());
            food.Describe = Request.Form["txtDescribe"].ToString();
            food.FoodTypeID = int.Parse(ddlFoodType.SelectedItem.Value);
            if (HttpContext.Current.Request.Files.Count > 0)
            {
                food.PicUrl = SaveImgFile();
            }
            // 添加到数据库
            food.FoodID = foodRepository.Add(food);
        }

        // 保存图片到服务器，返回图片的服务器根目录的相对路径
        private string SaveImgFile()
        {
            //string savePath = "UploadFiles/FoodPics/" + DateTime.Now.ToString("yyyyMM") + "/";
            //NewFolder("../" + savePath);

            string savePath = "UploadFiles/FoodPics/";
            HttpPostedFile file = HttpContext.Current.Request.Files.Get(0);
            savePath += "Food" + DateTime.Now.ToString("yyMMddhhmmss") + file.FileName.Remove(0, file.FileName.LastIndexOf("."));

            file.SaveAs(Server.MapPath("/") + savePath);

            return savePath;
        }

        // 建立新的文件夹
        private void NewFolder(string path)
        {
            // System.DateTime.Now.ToString("yyyyMMddhhmmss")
            // string nowYearMonth = DateTime.Now.ToString("yyyyMM");

            // 判断在该路径下是否存在 path 指定的文件夹 否则将建立文件夹
            if (!Directory.Exists(HttpContext.Current.Server.MapPath(path)))
            {
                System.IO.Directory.CreateDirectory(@HttpContext.Current.Server.MapPath(path));
            }
        }

        // 定义一个产生随机数的函数
        private String GetRandomint()
        {
            Random random = new Random();

            return (random.Next(10000).ToString());
        }

    }
}