using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace SmartHome.DAL
{
    ////ID, loginUser, name, carPlateNumber, carUseTime, fromTo, IDCard, depName, cellPhone, carState, bossUser, dateTime
    public class CarOrderListDAL
    {
        public List<Model.CarOrderList> GetList()
        {
            string sql = "select * from CarOrderList";
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text);
            List<Model.CarOrderList> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.CarOrderList>();
                Model.CarOrderList cm = null;
                foreach (DataRow row in da.Rows)
                {
                    cm = new Model.CarOrderList();
                    LoadEntity(cm, row);
                    list.Add(cm);
                }
            }
            return list;
        }
        public List<Model.CarOrderList> GetListbyPlateNumber(string carPlateNumber)
        {
            string sql = "select * from CarOrderList where carPlateNumber=@carPlateNumber";
            SqlParameter[] pars = {
                new SqlParameter("@carPlateNumber", SqlDbType.NVarChar)
            };
            pars[0].Value = carPlateNumber;

            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text, pars);
            List<Model.CarOrderList> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.CarOrderList>();
                Model.CarOrderList cm = null;
                foreach (DataRow row in da.Rows)
                {
                    cm = new Model.CarOrderList();
                    LoadEntity(cm, row);
                    list.Add(cm);
                }
            }
            return list;
        }
        public List<Model.CarOrderList> GetListbyLoginUser(string loginUser)
        {
            string sql = "select * from CarOrderList where loginUser=@loginUser";
            SqlParameter[] pars = {
                new SqlParameter("@loginUser", SqlDbType.NVarChar)
            };
            pars[0].Value = loginUser;

            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text, pars);
            List<Model.CarOrderList> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.CarOrderList>();
                Model.CarOrderList cm = null;
                foreach (DataRow row in da.Rows)
                {
                    cm = new Model.CarOrderList();
                    LoadEntity(cm, row);
                    list.Add(cm);
                }
            }
            return list;
        }
        public int AddCarOrderList(Model.CarOrderList cm)
        {
            //ID, loginUser, name, carPlateNumber, carUseTime, fromTo, IDCard, depName, cellPhone, carState, bossUser, dateTime
            string sql = "insert into CarOrderList(loginUser, name, carPlateNumber, carUseTime, fromTo, IDCard, depName, cellPhone, carState, bossUser, dateTime) values(@loginUser, @name, @carPlateNumber, @carUseTime, @fromTo, @IDCard, @depName, @cellPhone, @carState, @bossUser, @dateTime)";
            SqlParameter[] pars = {
                 new SqlParameter("@loginUser", SqlDbType.NVarChar),
                new SqlParameter("@name", SqlDbType.NVarChar),
                new SqlParameter("@carPlateNumber", SqlDbType.NVarChar),
                new SqlParameter("@carUseTime", SqlDbType.NVarChar),
                new SqlParameter("@fromTo", SqlDbType.NVarChar),
                new SqlParameter("@IDCard", SqlDbType.NVarChar),
                new SqlParameter("@depName", SqlDbType.NVarChar),
                new SqlParameter("@cellPhone", SqlDbType.NVarChar),
                new SqlParameter("@carState", SqlDbType.NVarChar),
                new SqlParameter("@bossUser", SqlDbType.NVarChar),
                new SqlParameter("@dateTime", SqlDbType.NVarChar)
            };
            pars[0].Value = cm.loginUser;
            pars[1].Value = cm.name;
            pars[2].Value = cm.carPlateNumber;
            pars[3].Value = cm.carUseTime;
            pars[4].Value = cm.fromTo;
            pars[5].Value = cm.IDCard;
            pars[6].Value = cm.depName;
            pars[7].Value = cm.cellPhone;
            pars[8].Value = cm.carState;
            pars[9].Value = cm.bossUser;
            pars[10].Value = cm.dateTime;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);

        }
        public List<Model.CarOrderList> GetListbyLoginUserBossUser(string loginUser, string bossUser)
        {
            string sql = "select * from CarOrderList where loginUser=@loginUser or bossUser=@bossUser";
            SqlParameter[] pars = {
                new SqlParameter("@loginUser", SqlDbType.NVarChar),
                new SqlParameter("@bossUser", SqlDbType.NVarChar)
            };
            pars[0].Value = loginUser;
            pars[1].Value = bossUser;

            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text, pars);
            List<Model.CarOrderList> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.CarOrderList>();
                Model.CarOrderList cm = null;
                foreach (DataRow row in da.Rows)
                {
                    cm = new Model.CarOrderList();
                    LoadEntity(cm, row);
                    list.Add(cm);
                }
            }
            return list;
        }
        private void LoadEntity(Model.CarOrderList cm, DataRow row)
        {
            //ID, loginUser, name, carPlateNumber, carUseTime, fromTo, IDCard, depName, cellPhone, carState, bossUser, dateTime
            cm.loginUser = row["loginUser"] != DBNull.Value ? row["loginUser"].ToString() : string.Empty;
            cm.name = row["name"] != DBNull.Value ? row["name"].ToString() : string.Empty;
            cm.carPlateNumber = row["carPlateNumber"] != DBNull.Value ? row["carPlateNumber"].ToString() : string.Empty;
            cm.carUseTime = row["carUseTime"] != DBNull.Value ? row["carUseTime"].ToString() : string.Empty;
            cm.fromTo = row["fromTo"] != DBNull.Value ? row["fromTo"].ToString() : string.Empty;
            cm.IDCard = row["IDCard"] != DBNull.Value ? row["IDCard"].ToString() : string.Empty;
            cm.depName = row["depName"] != DBNull.Value ? row["depName"].ToString() : string.Empty;
            cm.cellPhone = row["cellPhone"] != DBNull.Value ? row["cellPhone"].ToString() : string.Empty;
            cm.carState = row["carState"] != DBNull.Value ? row["carState"].ToString() : string.Empty;
            cm.bossUser = row["bossUser"] != DBNull.Value ? row["bossUser"].ToString() : string.Empty;
            cm.dateTime = row["dateTime"] != DBNull.Value ? row["dateTime"].ToString() : string.Empty;
        }
    }
}