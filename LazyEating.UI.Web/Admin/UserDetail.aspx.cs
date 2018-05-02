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
    public partial class UserDetail : System.Web.UI.Page
    {
        UserRepository userRepository = new UserRepository();
        public User user;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["userID"] != null)
            {
                int userID = int.Parse(Request.QueryString["userID"].ToString());
                user = userRepository.FindBy(userID);
            }

        }
    }
}