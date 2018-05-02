using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LazyEating.Model;
using LazyEating.Repository;

namespace LazyEating.UI.Web
{
    public partial class Register1 : System.Web.UI.Page
    {
        UserRepository userRepository = new UserRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Request.Form["txtRealName"] != null)
            {
                //验证手机号
                Regex sReg = new Regex("^1[34578]\\d{9}");
                if (sReg.IsMatch(Request.Form["txtPhone"].ToString().Trim()))
                {
                    OnRegister();
                }
                else
                    Message.Text = "手机号格式不正确！";
            }
        }

        private void OnRegister()
        {
            User user = new Model.User();
            user.RealName = Request.Form["txtRealName"].ToString();
            user.UserName = Request.Form["txtUserName"].ToString();
            user.Password = Request.Form["txtPassword"].ToString();
            user.Addess = Request.Form["txtAddress"].ToString();
            user.Phone = Request.Form["txtPhone"].ToString();

            try
            {
                userRepository.Add(user);
                Session["loginUserName"] = user.UserName;
                Message.Text = "注册成功！";
            }
            catch (Exception ex)
            {
                Message.Text = "注册失败！";
            }

        }
    }
}