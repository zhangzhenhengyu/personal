using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LazyEating.UI.Web
{
    public partial class WebLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Sub_Click(object sender, EventArgs e)
        {
            string userName = Request["user"].ToString();
            string password = Request["pwd"].ToString();

            Response.Write("<script>alert('恭喜你:" + userName + "，登陆成功！')</script>");
        }
    }
}