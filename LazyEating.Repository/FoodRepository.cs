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
    public class FoodRepository 
    {
        private string ConnectionString;

        public FoodRepository()
        {
            this.ConnectionString = ConfigurationManager.ConnectionStrings["LazyEatingConnectionString"].ConnectionString;
        }

        /// <summary>
        ///  添加一个菜品
        /// </summary>
        /// <param name="food">菜品对象</param>
        /// <returns>返回所添加的菜品ID</returns>
        public int Add(Food food)
        {
            int newFoodID = 0;
            string insertSql = "INSERT INTO LE_Food (FoodName,FoodTypeID,Price,PicUrl,Describe)" +
                " VALUES (@foodName,@foodTypeID,@price,@picUrl,@describe)" +
                " SELECT @@IDENTITY";
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = insertSql;
                
                command.Parameters.Add("@foodName", SqlDbType.Char, 30).Value = food.FoodName;
                command.Parameters.Add("@foodTypeID", SqlDbType.Int).Value = food.FoodTypeID;
                command.Parameters.Add("@price", SqlDbType.Decimal).Value = food.Price;
                command.Parameters.Add("@picUrl", SqlDbType.Text).Value = food.PicUrl == null ? "" : food.PicUrl;
                command.Parameters.Add("@describe", SqlDbType.Text).Value = food.Describe == null ? "" : food.Describe;

                connection.Open();
                newFoodID = int.Parse(command.ExecuteScalar().ToString());
                connection.Close();
            }
            return newFoodID;
        }

        /// <summary>
        /// 修改某个菜品信息
        /// </summary>
        /// <param name="food">菜品ID</param>
        public int Save(Food food)
        {
            int count = 0;
            string insertSql = "UPDATE LE_Food SET"+
               " [FoodName] = @foodName"+
               ",[FoodTypeID] = @foodTypeID"+
               ",[Price] = @price"+
               //",[PicUrl] = @picUrl"+
               ",[Describe] = @describe"+
               " WHERE [FoodID] = @foodID";
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = insertSql;

                command.Parameters.Add("@foodID", SqlDbType.Int).Value = food.FoodID;
                command.Parameters.Add("@foodName", SqlDbType.Char, 30).Value = food.FoodName;
                command.Parameters.Add("@foodTypeID", SqlDbType.Int).Value = food.FoodTypeID;
                command.Parameters.Add("@price", SqlDbType.Decimal).Value = food.Price;
                //command.Parameters.Add("@picUrl", SqlDbType.Text).Value = food.PicUrl;
                command.Parameters.Add("@describe", SqlDbType.Text).Value = food.Describe;

                connection.Open();
                count = command.ExecuteNonQuery();
                connection.Close();
            }
            return count;
        }
        
        /// <summary>
        /// 查找全部菜品
        /// </summary>
        /// <returns>返回所有菜品数据集合</returns>
        public IEnumerable<Food> FindAll()
        {
            IList<Food> foods = new List<Food>();
            /*string selectSql = "SELECT FoodID,FoodName,LE_FoodType.FoodTypeID,LE_FoodType.FoodTypeName,Price,PicUrl,SalesVolume,AddDate,Describe" +
                " FROM LE_Food JOIN LE_FoodType " +
                " ON LE_Food.FoodTypeID = LE_FoodType.FoodTypeID";*/

            string selectSql = "select * from v_LE_Food";

            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = selectSql;
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    Food food;
                    while (reader.Read())
                    {
                        food = new Food();

                        food.FoodID = int.Parse(reader["FoodID"].ToString());
                        food.FoodName = reader["FoodName"].ToString().Trim();
                        food.FoodType.FoodTypeID = int.Parse(reader["FoodTypeID"].ToString());
                        food.FoodType.FoodTypeName = reader["FoodTypeName"].ToString().Trim();
                        food.Price = decimal.Parse(reader["Price"].ToString());
                        food.PicUrl = reader["PicUrl"].ToString().Trim();
                        food.SalesVolume = int.Parse(reader["SalesVolume"].ToString());
                        food.AddDate = DateTime.Parse(reader["AddDate"].ToString());
                        food.Describe = reader["Describe"].ToString().Trim();

                        foods.Add(food);
                    }
                }
            }
            return foods;
        }
        /// <summary>
        /// 查找某个类型的菜品
        /// </summary>
        /// <param name="foodTypeID">菜品类型ID</param>
        /// <returns>返回此类型菜品数据集合</returns>
        public List<Food> FindByTypeID(int foodTypeID)
        {
            List<Food> foods = new List<Food>();
            string selectSql = "select * from v_LE_Food where FoodTypeID = " + foodTypeID;

            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = selectSql;
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    Food food;
                    while (reader.Read())
                    {
                        food = new Food();

                        food.FoodID = int.Parse(reader["FoodID"].ToString());
                        food.FoodName = reader["FoodName"].ToString().Trim();
                        food.FoodType.FoodTypeID = int.Parse(reader["FoodTypeID"].ToString());
                        food.FoodType.FoodTypeName = reader["FoodTypeName"].ToString().Trim();
                        food.Price = decimal.Parse(reader["Price"].ToString());
                        food.PicUrl = reader["PicUrl"].ToString().Trim();
                        food.SalesVolume = int.Parse(reader["SalesVolume"].ToString());
                        food.AddDate = DateTime.Parse(reader["AddDate"].ToString());
                        food.Describe = reader["Describe"].ToString().Trim();

                        foods.Add(food);
                    }
                }
            }
            return foods;
        }
        
        /// <summary>
        /// 查找某个菜品
        /// </summary>
        /// <param name="foodID">菜品ID</param>
        /// <returns>返回此菜品数据</returns>
        public Food FindBy( int foodID)
        {
            Food food = new Food();
            /*string selectSql = "SELECT FoodID,FoodName,LE_FoodType.FoodTypeID,LE_FoodType.FoodTypeName,Price,PicUrl,SalesVolume,AddDate,Describe " +
                "  FROM LE_Food JOIN LE_FoodType " +
                "  ON LE_Food.FoodTypeID = LE_FoodType.FoodTypeID " +
                "  WHERE LE_Food.FoodID = " + foodID;*/
            string selectSql = "select * from v_LE_Food where FoodID = " + foodID;

            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = selectSql;
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        food.FoodID = int.Parse(reader["FoodID"].ToString());
                        food.FoodName = reader["FoodName"].ToString();
                        food.FoodType.FoodTypeID = int.Parse(reader["FoodTypeID"].ToString());
                        food.FoodType.FoodTypeName = reader["FoodTypeName"].ToString();
                        food.Price = decimal.Parse(reader["Price"].ToString());
                        food.PicUrl = reader["PicUrl"].ToString();
                        food.SalesVolume = int.Parse(reader["SalesVolume"].ToString());
                        food.AddDate = DateTime.Parse(reader["AddDate"].ToString());
                        food.Describe = reader["Describe"].ToString();
                    }
                }
            }
            return food;
        }

        // 删除某个菜品
        public void Delete(int foodID)
        {
            string deleteSql = "DELETE FROM LE_Food WHERE FoodID = " + foodID;
            SqlHelper.ExecQueryString(ConnectionString, deleteSql);
        }
        
        // 删除某个菜品
        public void Delete(Food food)
        {
            string deleteSql = "DELETE FROM LE_Food WHERE FoodID = " + food.FoodID;
            SqlHelper.ExecQueryString(ConnectionString, deleteSql);
        }
        
        /// <summary>
        /// 查找全部菜品类型
        /// </summary>
        /// <returns>返回菜品类型数据集合</returns>
        public IEnumerable<FoodType> FindAllType()
        {
            IList<FoodType> foodTypes = new List<FoodType>();

            string selectSql = "SELECT * FROM LE_FoodType ORDER BY FoodTypeID asc";

            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = selectSql;
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    FoodType foodType;
                    while (reader.Read())
                    {
                        foodType = new FoodType();

                        foodType.FoodTypeID = int.Parse(reader["FoodTypeID"].ToString());
                        foodType.FoodTypeName = reader["FoodTypeName"].ToString().Trim();

                        foodTypes.Add(foodType);
                    }
                }
            }
            return foodTypes;
        }

    }
}
