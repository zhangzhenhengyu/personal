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
    public class UserRepository 
    {
        private string ConnectionString;

        public UserRepository()
        {
            this.ConnectionString = ConfigurationManager.ConnectionStrings["LazyEatingConnectionString"].ConnectionString;
        }
        // 添加用户
        public int Add(User user)
        {
            int newUserID = 0;
            string insertSql = "insert into "
                + " LE_User ([UserName],[Password],[UserTypeID],[Adress],[Sex],[RealName],[Phone])"
                + " values(@userName,@password,@userTypeID,@adress,@sex,@realName,@phone)"
                + " SELECT @@IDENTITY";
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = insertSql;

                command.Parameters.Add("@userName", SqlDbType.Char, 30).Value = user.UserName;
                command.Parameters.Add("@password", SqlDbType.Char, 40).Value = user.Password;
                command.Parameters.Add("@userTypeID", SqlDbType.Int).Value = user.UserTypeID == 0 ? 2 : user.UserTypeID;
                command.Parameters.Add("@adress", SqlDbType.Text).Value = user.Addess == null ? "" : user.Addess;
                command.Parameters.Add("@sex", SqlDbType.Char, 4).Value = user.Sex == null ? "" : user.Sex;
                command.Parameters.Add("@realName", SqlDbType.Char, 30).Value = user.RealName == null ? "" : user.RealName;
                command.Parameters.Add("@phone", SqlDbType.Char, 20).Value = user.Phone == null ? "" : user.Phone;

                connection.Open();
                newUserID = int.Parse(command.ExecuteScalar().ToString());
                connection.Close();
            }
            return newUserID;
        }
        // 修改用户
        public void Save(User user)
        {
            string memberSql = "Update LE_User" +
                " set UserName = @userName" +
                ",Password = @password" +
                ",UserTypeID = @userTypeID" +
                ",Adress =@adress" +
                ",Sex = @sex" +
                ",RealName = @realName" +
                ",Phone = @phone" +
                " where userID = @userID";
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = memberSql;

                command.Parameters.Add("@userID", SqlDbType.Int).Value = user.UserID;
                command.Parameters.Add("@userName", SqlDbType.Char, 30).Value = user.UserName;
                command.Parameters.Add("@password", SqlDbType.Char, 40).Value = user.Password;
                command.Parameters.Add("@userTypeID", SqlDbType.Int).Value = user.UserTypeID;
                command.Parameters.Add("@adress", SqlDbType.Text).Value = user.Addess == null ? "" : user.Addess;
                command.Parameters.Add("@sex", SqlDbType.Char, 4).Value = user.Sex == null ? "" : user.Sex;
                command.Parameters.Add("@realName", SqlDbType.Char, 30).Value = user.RealName == null ? "" : user.RealName;
                command.Parameters.Add("@phone", SqlDbType.Char, 20).Value = user.Phone == null ? "" : user.Phone;

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }
        // Delete
        public void Delete(int userID)
        {
            string deleteSql = "DELETE FROM LE_User WHERE UserID = " + userID;
            SqlHelper.ExecQueryString(ConnectionString, deleteSql);
        }
        // 查找所有用户
        public IEnumerable<User> FindAll()
        {
            IList<User> users = new List<User>();
            string selectSql = "SELECT UserID,UserName,[Password],LE_UserType.UserTypeID,LE_UserType.UserTypeName,Adress,Sex,RealName,Phone "+
                " FROM LE_User JOIN LE_UserType "+
                " ON LE_User.UserTypeID = LE_UserType.UserTypeID";
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = selectSql;
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    User user;
                    while (reader.Read())
                    {
                        user = new User();

                        user.UserID = int.Parse(reader["userID"].ToString());
                        user.UserName = reader["userName"].ToString().Trim();
                        user.UserType.UserTypeID = int.Parse(reader["userTypeID"].ToString());
                        user.UserType.UserTypeName = reader["UserTypeName"].ToString().Trim();
                        user.Addess = reader["adress"].ToString().Trim();
                        user.Sex = reader["sex"].ToString().Trim();
                        user.RealName = reader["realName"].ToString().Trim();
                        user.Phone = reader["phone"].ToString().Trim();

                        users.Add(user);
                    }
                }
            }
            return users;
        }
        // 根据ID号查找用户
        public User FindBy(int UserID)
        {
            string selectByID = "SELECT UserID,UserName,[Password],LE_UserType.UserTypeID,LE_UserType.UserTypeName,Adress,Sex,RealName,Phone " +
                " FROM LE_User JOIN LE_UserType " +
                " ON LE_User.UserTypeID = LE_UserType.UserTypeID " +
                " WHERE userID = " + UserID;
            User user = FindUser(selectByID);
            return user;
        }
        // 根据用户名查找用户
        public User FindBy(string UserName)
        {
            string selectByID = "SELECT UserID,UserName,[Password],LE_UserType.UserTypeID,LE_UserType.UserTypeName,Adress,Sex,RealName,Phone " +
                " FROM LE_User JOIN LE_UserType " +
                " ON LE_User.UserTypeID = LE_UserType.UserTypeID " +
                " WHERE UserName = '" + UserName + "'";
            User user = FindUser(selectByID);
            return user;
        }

        private User FindUser(string selectQueryString)
        {
            User user = new User();
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = selectQueryString;
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        user.UserID = int.Parse(reader["userID"].ToString());
                        user.UserName = reader["userName"].ToString().Trim();
                        user.UserType.UserTypeID = int.Parse(reader["userTypeID"].ToString());
                        user.UserType.UserTypeName = reader["UserTypeName"].ToString().Trim();
                        user.Addess = reader["adress"].ToString().Trim();
                        user.Sex = reader["sex"].ToString().Trim();
                        user.RealName = reader["realName"].ToString().Trim();
                        user.Phone = reader["phone"].ToString().Trim();
                    }
                }
            }
            return user;

        }

        public static bool CheckLogin(string UserName,string Password, int UserTypeID)
        {
            string connString = ConfigurationManager.ConnectionStrings["LazyEatingConnectionString"].ConnectionString;
            bool Success = false;
            string selectSql = "SELECT COUNT(*) FROM LE_USER WHERE " +
                " UserName = @userName AND PassWord = @password AND UserTypeID = @userTypeID ";
            using (SqlConnection connection = new SqlConnection(connString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = selectSql;

                command.Parameters.Add("@userName", SqlDbType.Char, 30).Value = UserName;
                command.Parameters.Add("@password", SqlDbType.Char, 40).Value = Password;
                command.Parameters.Add("@userTypeID", SqlDbType.Int).Value = UserTypeID;
                connection.Open();
                Success = int.Parse(command.ExecuteScalar().ToString()) > 0;
                connection.Close();
            }
            return Success;
        }
        
    }
}
