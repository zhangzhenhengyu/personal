using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LazyEating.UI.Web.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["adminName"] != null)
            {
                string adminName = Request.Form["adminName"].ToString();
                string adminPassword = Request.Form["adminPassword"].ToString();
                if (LazyEating.Repository.UserRepository.CheckLogin(adminName, adminPassword, 1))
                {
                    Session["adminName"] = adminName;
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    lblInformation.InnerHtml = "用户名或密码错误！";
                }
            }
        }
    }
}