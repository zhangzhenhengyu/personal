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
    public partial class Index : System.Web.UI.MasterPage
    {
        private UserRepository userRepository = new UserRepository();

        public User loginUser;

        bool loginSuccess { get { return Session["loginUserName"] != null; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!loginSuccess)
            {
                divLoginYes.Visible = false;
                divLoginNO.Visible = true;
            }
            else
            {
                loginUser = userRepository.FindBy(Session["loginUserName"].ToString());
                Session["loginUserID"] = loginUser.UserID;
                divLoginYes.Visible = true;
                divLoginNO.Visible = false;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUserName.Text!=null&& txtPassword.Text!=null)
            {
                string userName = txtUserName.Text;
                string password = txtPassword.Text;
                txtUserName.Text = null;
                txtPassword.Text = null;

                if (UserRepository.CheckLogin(userName, password, 2))
                {
                    loginUser = userRepository.FindBy(userName);
                    Session["loginUserName"] = userName;
                    Session["loginUserID"] = loginUser.UserID;
                    divLoginYes.Visible = true;
                    divLoginNO.Visible = false;
                }
                Response.Redirect(Request.Url.ToString());
                //else
                //{ 
                //    return("用户名或密码错误")
                //}
            }
            else
                Response.Write("<script>alert('用户名或密码为空')</script>");
        }

        protected void lbtnEsc_Click(object sender, EventArgs e)
        {
            Session.Clear();
            divLoginYes.Visible = false;
            divLoginNO.Visible = true;
            Response.Redirect(Request.Url.ToString());
        }
    }
}