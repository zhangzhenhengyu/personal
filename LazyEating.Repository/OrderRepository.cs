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
    public class OrderRepository 
    {
        private string ConnectionString;

        public OrderRepository()
        {
            this.ConnectionString = ConfigurationManager.ConnectionStrings["LazyEatingConnectionString"].ConnectionString;
        }

        // 查找全部订单
        public IEnumerable<Order> FindAll()
        {
            IList<Order> orders = new List<Order>();
            string selectSql = "SELECT LE_Order.OrderID,LE_Order.UserID ,LE_Order.RealName,[Address],LE_Order.Phone,Totle,DateCreate,OrderState" +
                ",LE_OrderDetail.FoodID,Quatity,UnitPrice" +
                ",FoodName ,LE_FoodType.FoodTypeID,FoodTypeName,Price,PicUrl,SalesVolume,AddDate,Describe" +
                " FROM LE_User,LE_Order,LE_OrderDetail,LE_Food,LE_FoodType " +
                " WHERE LE_User.UserID = LE_Order.UserID" +
                " AND LE_Order.OrderID = LE_OrderDetail.OrderID" +
                " AND LE_OrderDetail.FoodID = LE_Food.FoodID" +
                " AND LE_Food.FoodTypeID = LE_FoodType.FoodTypeID" +
                " ORDER BY LE_Order.OrderID ASC";
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = selectSql;
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    orders = this.GetOrderListForm(reader);
                }
            }
            return orders;
        }
        // 查找某个用户的订单
        public IEnumerable<Order> FindBy(User user)
        {
            return this.FindBy(user.UserID);
        }
        // 查找某个用户的订单
        public IEnumerable<Order> FindBy(int userID)
        {
            IList<Order> orders = new List<Order>();
            string selectSql = "SELECT LE_Order.OrderID,LE_Order.UserID ,LE_Order.RealName,[Address],LE_Order.Phone,Totle,DateCreate,OrderState" +
                ",LE_OrderDetail.FoodID,Quatity,UnitPrice" +
                ",FoodName ,LE_FoodType.FoodTypeID,FoodTypeName,Price,PicUrl,SalesVolume,AddDate,Describe" +
                " FROM LE_User,LE_Order,LE_OrderDetail,LE_Food,LE_FoodType " +
                " WHERE LE_User.UserID = LE_Order.UserID" +
                " AND LE_Order.OrderID = LE_OrderDetail.OrderID" +
                " AND LE_OrderDetail.FoodID = LE_Food.FoodID" +
                " AND LE_Food.FoodTypeID = LE_FoodType.FoodTypeID" +
                " AND LE_User.UserID = " + userID +
                " ORDER BY LE_Order.OrderID ASC";
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = selectSql;
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    orders = this.GetOrderListForm(reader);
                }
            }
            return orders;
        }
        // 查找某种类型的订单
        public IEnumerable<Order> FindBy(OrderState orderState)
        {
            IList<Order> orders = new List<Order>();
            string selectSql = "SELECT LE_Order.OrderID,LE_Order.UserID ,LE_Order.RealName,[Address],LE_Order.Phone,Totle,DateCreate,OrderState" +
                ",LE_OrderDetail.FoodID,Quatity,UnitPrice" +
                ",FoodName ,LE_FoodType.FoodTypeID,FoodTypeName,Price,PicUrl,SalesVolume,AddDate,Describe" +
                " FROM LE_User,LE_Order,LE_OrderDetail,LE_Food,LE_FoodType " +
                " WHERE LE_User.UserID = LE_Order.UserID" +
                " AND LE_Order.OrderID = LE_OrderDetail.OrderID" +
                " AND LE_OrderDetail.FoodID = LE_Food.FoodID" +
                " AND LE_Food.FoodTypeID = LE_FoodType.FoodTypeID" +
                " AND OrderState = " + (int)orderState +
                " ORDER BY LE_Order.OrderID ASC";
            
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = selectSql;
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    orders = this.GetOrderListForm(reader);
                }
            }
            return orders;
        }
        // 按订单号查找订单
        public Order FindByID(int OrderID)
        {
            IList<Order> orders = new List<Order>();
            string selectSql = "SELECT LE_Order.OrderID,LE_Order.UserID ,LE_Order.RealName,[Address],LE_Order.Phone,Totle,DateCreate,OrderState" +
                ",LE_OrderDetail.FoodID,Quatity,UnitPrice" +
                ",FoodName ,LE_FoodType.FoodTypeID,FoodTypeName,Price,PicUrl,SalesVolume,AddDate,Describe" +
                " FROM LE_User,LE_Order,LE_OrderDetail,LE_Food,LE_FoodType " +
                " WHERE LE_User.UserID = LE_Order.UserID" +
                " AND LE_Order.OrderID = LE_OrderDetail.OrderID" +
                " AND LE_OrderDetail.FoodID = LE_Food.FoodID" +
                " AND LE_Food.FoodTypeID = LE_FoodType.FoodTypeID" +
                " AND LE_Order.OrderID = " + OrderID +
                " ORDER BY LE_Order.OrderID ASC";
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = selectSql;
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    orders = this.GetOrderListForm(reader);
                }
            }
            return orders[0];
        }
        // 某个用户创建了一个新的订单
        public int Add(Order order)
        {
            int newOrderID = 0;
            string insertSql = "insert into" +
                " LE_Order(userID,realName,address,phone,totle,dateCreate,orderState)" +
                " VALUES(@userID,@realName,@address,@phone,@totle,@dateCreate,@orderState)" +
                " SELECT @@IDENTITY AS returnName";
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = insertSql;

                command.Parameters.Add("@userID", SqlDbType.Int).Value = order.UserID;
                command.Parameters.Add("@realName", SqlDbType.Char, 30).Value = order.RealName;
                command.Parameters.Add("@address", SqlDbType.Text).Value = order.Address;
                command.Parameters.Add("@phone", SqlDbType.Char, 20).Value = order.Phone;
                command.Parameters.Add("@totle", SqlDbType.Decimal).Value = order.Totle;
                command.Parameters.Add("@dateCreate", SqlDbType.DateTime).Value = order.DateCreate;
                command.Parameters.Add("@orderState", SqlDbType.Int).Value = (int)order.OrderState;

                connection.Open();
                newOrderID = int.Parse(command.ExecuteScalar().ToString());
                connection.Close();
            }
            insertSql = "insert into" +
                " LE_OrderDetail([OrderID],[FoodID],[Quatity],[UnitPrice])" +
                " VALUES(@orderID,@foodID,@quatity,@unitPrice)";
            foreach (OrderDetail orderDetail in order.OrderDetails)
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    SqlCommand command = connection.CreateCommand();

                    command.CommandText = insertSql;
                    command.Parameters.Add("@orderID", SqlDbType.Int).Value = newOrderID;
                    command.Parameters.Add("@foodID", SqlDbType.Int).Value = orderDetail.FoodID;
                    command.Parameters.Add("@quatity", SqlDbType.Int).Value = orderDetail.Quatity;
                    command.Parameters.Add("@unitPrice", SqlDbType.Decimal).Value = orderDetail.UnitPrice;

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }

            }
            return newOrderID;
        }
        // 删除某个订单
        public void Delete(int orderID)
        {
            string deleteSql = "delete from LE_Order where orderID = " + orderID;
            SqlHelper.ExecQueryString(ConnectionString, deleteSql);
        }

        public static int FindOrderCount(OrderState orderState)
        {
            int count = 0;
            string connString = ConfigurationManager.ConnectionStrings["LazyEatingConnectionString"].ConnectionString;
            string selectSql = "select Count(*) from LE_Order where OrderState ="+ (int)orderState;
            using (SqlConnection connection = new SqlConnection(connString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = selectSql;
                connection.Open();
                count = int.Parse(command.ExecuteScalar().ToString());
                connection.Close();
            }
            return count;
        }

        // 
        public void Save(Order order)
        {
            // (@userID,@realName,@address,@phone,@totle,@dateCreate,@orderState)
            string updataSql = "UPDATE LE_Order " +
                " SET [UserID] = @userID " +
                " ,[RealName] = @realName " +
                " ,[Address] = @address " +
                " ,[Phone] = @phone " +
                " ,[Totle] = @totle " +
                " ,[OrderState] = @orderState " +
                " WHERE [OrderID]= @orderID ";
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = updataSql;

                command.Parameters.Add("@orderID", SqlDbType.Int).Value = order.OrderID;
                command.Parameters.Add("@userID", SqlDbType.Int).Value = order.UserID;
                command.Parameters.Add("@realName", SqlDbType.Char, 30).Value = order.RealName;
                command.Parameters.Add("@address", SqlDbType.Text).Value = order.Address;
                command.Parameters.Add("@phone", SqlDbType.Char, 20).Value = order.Phone;
                command.Parameters.Add("@totle", SqlDbType.Decimal).Value = order.Totle;
                command.Parameters.Add("@orderState", SqlDbType.Int).Value = (int)order.OrderState;

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        private IList<Order> GetOrderListForm(IDataReader reader)
        {
            IList<Order> orders = new List<Order>();
            Order order = new Order();
            OrderDetail orderDetail;

            int OrderID = 0;

            while (reader.Read())
            {
                if (OrderID != int.Parse(reader["OrderID"].ToString()))
                {
                    OrderID = int.Parse(reader["OrderID"].ToString());
                    order = new Order();

                    order.OrderID = int.Parse(reader["OrderID"].ToString());
                    order.UserID = int.Parse(reader["UserID"].ToString());
                    order.RealName = reader["RealName"].ToString().Trim();
                    order.Address = reader["Address"].ToString().Trim();
                    order.Phone = reader["Phone"].ToString().Trim();
                    order.Totle = decimal.Parse(reader["Totle"].ToString());
                    order.DateCreate = DateTime.Parse(reader["DateCreate"].ToString());
                    order.OrderState = (OrderState)int.Parse(reader["OrderState"].ToString());

                    orders.Add(order);
                }
                orderDetail = GetOrderDetailForm(reader);
                orderDetail.OrderID = OrderID;
                order.OrderDetails.Add(orderDetail);
            }

            return orders;
        }
        private OrderDetail GetOrderDetailForm(IDataRecord record)
        {
            OrderDetail orderdetail = new OrderDetail();

            orderdetail.FoodID = int.Parse(record["FoodID"].ToString());
            orderdetail.Quatity = int.Parse(record["Quatity"].ToString());
            orderdetail.UnitPrice = decimal.Parse(record["UnitPrice"].ToString());

            orderdetail.Food.FoodName = record["FoodName"].ToString().Trim();
            orderdetail.Food.FoodTypeID = int.Parse(record["FoodTypeID"].ToString());
            orderdetail.Food.FoodType.FoodTypeName = record["FoodTypeName"].ToString().Trim();
            orderdetail.Food.Price = decimal.Parse(record["Price"].ToString());
            orderdetail.Food.PicUrl = record["PicUrl"].ToString().Trim();
            orderdetail.Food.SalesVolume = int.Parse(record["SalesVolume"].ToString());
            orderdetail.Food.AddDate = DateTime.Parse(record["AddDate"].ToString());
            orderdetail.Food.Describe = record["Describe"].ToString().Trim();

            return orderdetail;

        }

    }
}

//SELECT LE_Order.OrderID,LE_Order.UserID ,LE_Order.RealName,[Address],LE_Order.Phone,Totle,DateCreate,OrderState
//      ,LE_OrderDetail.FoodID,Quatity,UnitPrice
//      ,FoodName ,LE_FoodType.FoodTypeID,FoodTypeName,Price,PicUrl,SalesVolume,AddDate,Describe
//  FROM LE_User,LE_Order,LE_OrderDetail,LE_Food,LE_FoodType 
//  WHERE LE_User.UserID = LE_Order.UserID
//    AND LE_Order.OrderID = LE_OrderDetail.OrderID
//    AND LE_OrderDetail.FoodID = LE_Food.FoodID
//    AND LE_Food.FoodTypeID = LE_FoodType.FoodTypeID
//GO