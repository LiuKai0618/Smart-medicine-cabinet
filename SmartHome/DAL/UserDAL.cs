using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SmartHome.DAL
{
    public class UserDAL
    {
        //ID, UserName, UserPassword, UserLevel
        public List<Model.User> GetList()
        {
            string sql = "select * from UserInfors";
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text);
            List<Model.User> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.User>();
                Model.User user = null;
                foreach (DataRow row in da.Rows)
                {
                    user = new Model.User();
                    LoadEntity(user, row);
                    list.Add(user);
                }
            }
            return list;
        }
        //查询
        public Model.User GetUser(string userName)
        {
            //ID, UserName, UserPassword, UserLevel
            string sql = "select * from UserInfors where UserName=@UserName";
            SqlParameter[] pars = { new SqlParameter("@UserName", SqlDbType.NVarChar) };
            pars[0].Value = userName;
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text, pars);
            Model.User user = null;
            if (da.Rows.Count > 0)
            {
                user = new Model.User();
                LoadEntity(user, da.Rows[0]);
            }
            return user;
        }
        //删除
        public int DeleteUser(string userName)
        {
            //首先要删除userrtu下的该用户的所有信息
            //if (new DAL.UserRTUDAL().DeleteUserRTU(userName) == -1)
            //{
            //    return -1;
            //}
            //ID, UserName, UserPassword, UserLevel
            string sql = "delete from UserInfors where UserName=@UserName";
            SqlParameter[] pars = { new SqlParameter("@UserName", SqlDbType.NVarChar) };
            pars[0].Value = userName;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);
        }
        //修改
        public int EditUser(Model.User user)
        {
            //ID, UserName, UserPassword, UserLevel
            string sql = "update UserInfors set UserPassword=@UserPassword,UserLevel=@UserLevel where UserName=@UserName";
            SqlParameter[] pars = {
                new SqlParameter("@UserPassword", SqlDbType.NVarChar),
                new SqlParameter("@UserLevel", SqlDbType.NVarChar),
                new SqlParameter("@UserName", SqlDbType.NVarChar)
            };
            pars[0].Value = user.UserPassword;
            pars[1].Value = user.UserLevel;
            pars[2].Value = user.UserName;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);
        }
        //增加
        public int AddUser(Model.User user)
        {
            //ID, UserName, UserPassword, UserLevel
            string sql = "insert into UserInfors(UserName, UserPassword, UserLevel) values(@UserName,@UserPassword,@UserLevel)";
            SqlParameter[] pars = {
                new SqlParameter("@UserName", SqlDbType.NVarChar),
                new SqlParameter("@UserPassword", SqlDbType.NVarChar),
                new SqlParameter("@UserLevel", SqlDbType.NVarChar)
            };
            pars[0].Value = user.UserName;
            pars[1].Value = user.UserPassword;
            pars[2].Value = user.UserLevel;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);

        }
        private void LoadEntity(Model.User user, DataRow row)
        {
            //ID, UserName, UserPassword, UserLevel
            user.UserName = row["UserName"] != DBNull.Value ? row["UserName"].ToString() : string.Empty;
            user.UserPassword = row["UserPassword"] != DBNull.Value ? row["UserPassword"].ToString() : string.Empty;
            user.UserLevel = row["UserLevel"] != DBNull.Value ? row["UserLevel"].ToString() : string.Empty;
        }
    }
}