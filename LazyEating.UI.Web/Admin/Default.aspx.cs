using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LazyEating.UI.Web.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminName"] == null)
            {
                //Response.Write("<script language='javascript'>window.showModelessDialog('Login.aspx')</script>");
                //Response.Redirect("~/Admin/Login.aspx");
                //Server.Transfer("~/Admin/Login.aspx", false);
            }
        }
    }
}