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
    public partial class UserList : System.Web.UI.Page
    {
        UserRepository userRepository = new UserRepository();
        List<User> users;
        protected void Page_Load(object sender, EventArgs e)
        {
            lvUserDataPager.PreRender += new EventHandler(lvUser_PreRender);
            users = userRepository.FindAll().ToList();
        }
        void lvUser_PreRender(object sender, EventArgs e)
        {
            BindData();
            // throw new NotImplementedException();
        }
        private void BindData()
        {
            lvUser.DataSource = users;
            lvUser.DataBind();

        }
        public void lvUser_OnItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            try
            {
                int userID = int.Parse(lvUser.DataKeys[e.ItemIndex].Value.ToString());

                users.Remove(users.Find(user => user.UserID == userID));
                BindData();

                userRepository.Delete(userID);
            }
            catch (Exception ex)
            {

            }

        }
    }
}