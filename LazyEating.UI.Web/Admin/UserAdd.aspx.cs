using LazyEating.Model;
using LazyEating.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LazyEating.UI.Web.Admin
{
    public partial class UserAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["txtUserName"] != null)
            {
                    OnRegister();
            }
        }

        private void OnRegister()
        {
            User user = new Model.User();
            user.UserName = Request.Form["txtUserName"].ToString();
            user.Password = Request.Form["txtPassword"].ToString();
            user.UserTypeID = 1;
            try
            {
                new UserRepository().Add(user);
                Session["loginUserName"] = user.UserName;
                Message.Text = "添加成功！";
            }
            catch (Exception ex)
            {
                Message.Text = "添加失败！";
            }

        }
    }
}