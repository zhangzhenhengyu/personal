using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using LazyEating.Model;

namespace LazyEating.Repository
{
    public class CartRepository 
    {
        private string ConnectionString;

        public CartRepository()
        {
            this.ConnectionString = ConfigurationManager.ConnectionStrings["LazyEatingConnectionString"].ConnectionString;
        }

        // 查找某个用户的购物车
        public IEnumerable<CartRecord> FindBy(int userID)
        {
            string selectSql = "SELECT UserID,[Count],UnitPrice " +
                ",FoodTypeName,LE_FoodType.FoodTypeID " +
                ",LE_Food.FoodID,FoodName,[Price],PicUrl,SalesVolume,AddDate,Describe " +
                " FROM LE_CartRecord , LE_Food , LE_FoodType  " +
                " WHERE LE_Food.FoodID=LE_CartRecord.FoodID " +
                " AND LE_Food.FoodTypeID = LE_FoodType.FoodTypeID " +
                " AND UserID = " + userID;

            IList<CartRecord> cartRecords = new List<CartRecord>();

            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = selectSql;
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    CartRecord cartRecord;
                    while (reader.Read())
                    {
                        cartRecord = new CartRecord();
                        cartRecord.UserID = int.Parse(reader["UserID"].ToString());
                        cartRecord.Count = int.Parse(reader["Count"].ToString());
                        cartRecord.UnitPrice = decimal.Parse(reader["UnitPrice"].ToString());
                        cartRecord.FoodID = int.Parse(reader["FoodID"].ToString());
                        cartRecord.Food.FoodID = int.Parse(reader["FoodID"].ToString());
                        cartRecord.Food.FoodName = reader["FoodName"].ToString().Trim();
                        cartRecord.Food.Price = decimal.Parse(reader["Price"].ToString());
                        cartRecord.Food.PicUrl = reader["PicUrl"].ToString().Trim();
                        cartRecord.Food.SalesVolume = int.Parse(reader["SalesVolume"].ToString());
                        cartRecord.Food.AddDate = DateTime.Parse(reader["AddDate"].ToString());
                        cartRecord.Food.Describe = reader["Describe"].ToString().Trim();
                        cartRecord.Food.FoodType.FoodTypeID = int.Parse(reader["FoodTypeID"].ToString());
                        cartRecord.Food.FoodType.FoodTypeName = reader["FoodTypeName"].ToString().Trim();


                        cartRecords.Add(cartRecord);
                    }
                }
            }
            return cartRecords;
        }

        // 用户向购物车中添加了一件菜品
        public void Add(int userID, int foodID, decimal unitPrice)
        {
            string insertSql = "if " +
                " exists( select 1 from LE_CartRecord where UserID=@userID AND FoodID=@foodID ) " +
                " update LE_CartRecord set Count=Count+1 where UserID=@userID AND FoodID=@foodID " +
                " else " +
                " insert into LE_CartRecord([UserID],[FoodID],[Count],[UnitPrice]) " +
                " values(@userID,@foodID,1,@unitPrice)";

            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = insertSql;

                command.Parameters.Add("@userID", SqlDbType.Int).Value = userID;
                command.Parameters.Add("@foodID", SqlDbType.Int).Value = foodID;
                command.Parameters.Add("@unitPrice", SqlDbType.Decimal).Value = unitPrice;

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        // 用户将购物车中某件菜品删除
        public void Delete(int userID, int foodID)
        {
            string deleteSql = "if " +
                " exists( select 1 from LE_CartRecord where UserID=@userID AND FoodID=@foodID AND Count>1 ) " +
                " update LE_CartRecord set Count=Count-1 where UserID=@userID AND FoodID=@foodID " +
                " else " +
                " DELETE FROM LE_CartRecord " +
                " where UserID=@userID AND FoodID=@foodID";

            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = deleteSql;

                command.Parameters.Add("@userID", SqlDbType.Int).Value = userID;
                command.Parameters.Add("@foodID", SqlDbType.Int).Value = foodID;

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        public void Clear(int userID)
        {
            string clearSql = "DELETE FROM LE_CartRecord WHERE UserID = " + userID;
            SqlHelper.ExecQueryString(ConnectionString, clearSql);        
        }
    }
}
