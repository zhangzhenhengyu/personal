using System;
using LazyEating.Repository;
using LazyEating.Model;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;

namespace LazyEating.UI.Web.Admin
{
    public partial class Menu : System.Web.UI.Page
    {
        public int count = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            count = OrderRepository.FindOrderCount(OrderState.已付款);
            if (count > 0)
            {
                spanCount1.InnerHtml = "(" + count + ")";
                spanCount2.InnerHtml = "(" + count + ")";
            }
            
        }



        /// <summary>
        /// 对数据库的备份和恢复操作，Sql语句实现
        /// </summary>
        /// <param name="cmdText">实现备份或恢复的Sql语句</param>
        /// <param name="isBak">该操作是否为备份操作，是为true否，为false</param>
        private void BakReductSql(string cmdText, bool isBak)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["LazyEatingConnectionString"].ConnectionString;
            SqlCommand cmdBakRst = new SqlCommand();
            SqlConnection conn = new SqlConnection(ConnectionString);
            try
            {
                conn.Open();
                cmdBakRst.Connection = conn;
                cmdBakRst.CommandType = CommandType.Text;
                if (!isBak)     //如果是恢复操作
                {
                    string setOffline = "Alter database GroupMessage Set Offline With rollback immediate ";
                    string setOnline = " Alter database GroupMessage Set Online With Rollback immediate";
                    cmdBakRst.CommandText = setOffline + cmdText + setOnline;
                }
                else
                {
                    cmdBakRst.CommandText = cmdText;
                }
                cmdBakRst.ExecuteNonQuery();
                if (!isBak)
                {
                    Response.Write("<script>alert('恭喜你，数据成功恢复为所选文档的状态！')</script>");
                }
                else
                {
                    Response.Write("<script>alert('恭喜，你已经成功备份当前数据！')</script>");
                }
            }
            catch (SqlException sexc)
            {
                Response.Write("<script>alert('失败，可能是对数据库操作失败，原因：'" + sexc + ")</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('对不起，操作失败，可能原因：'" + ex + ")</script>");
            }
            finally
            {
                cmdBakRst.Dispose();
                conn.Close();
                conn.Dispose();
            }
        }
        ////数据库备份事件
        //protected void btnSave_Click(object sender, EventArgs e)
        //{
        //    string cmdText = @"backup database LAZYEATING to disk='E:\南方美食\LazyEating.UI.Web\App_Data\dbLAZYEATING.bak'";
        //    BakReductSql(cmdText, true);
        //}
        ////数据库还原事件
        //protected void btnRestore_Click(object sender, EventArgs e)
        //{
        //    string cmdText = @"restore database LAZYEATING from disk='E:\南方美食\LazyEating.UI.Web\App_Data\dbLAZYEATING.bak'";
        //    BakReductSql(cmdText, true);
        //}
    }
}