using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace SmartHome.DAL
{
    public class CarManageDAL
    {
        //ID, name, IDCard, depName, carType, dateTime, fromTo, cellPhone, carState, userName
        public List<Model.CarManage> GetList()
        {
            string sql = "select * from CarManage";
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text);
            List<Model.CarManage> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.CarManage>();
                Model.CarManage cm = null;
                foreach (DataRow row in da.Rows)
                {
                    cm = new Model.CarManage();
                    LoadEntity(cm, row);
                    list.Add(cm);
                }
            }
            return list;
        }
        //ID, name, IDCard, depName, carType, dateTime, fromTo, cellPhone, carState, userName
        public List<Model.CarManage> GetListbyUserNameCarState(string userName,string carState)
        {
            string sql = "select * from CarManage where userName=@userName and carState=@carState";
            SqlParameter[] pars = {
                new SqlParameter("@userName", SqlDbType.NVarChar),
                new SqlParameter("@carState", SqlDbType.NVarChar)
            };
            pars[0].Value = userName;
            pars[1].Value = carState;

            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text, pars);
            List<Model.CarManage> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.CarManage>();
                Model.CarManage cm = null;
                foreach (DataRow row in da.Rows)
                {
                    cm = new Model.CarManage();
                    LoadEntity(cm, row);
                    list.Add(cm);
                }
            }
            return list;
        }
        //ID, name, IDCard, depName, carType, dateTime, fromTo, cellPhone, carState, userName
        public List<Model.CarManage> GetListbyCarState(string carState)
        {
            string sql = "select * from CarManage where carState=@carState";
            SqlParameter[] pars = { new SqlParameter("@carState", SqlDbType.NVarChar) };
            pars[0].Value = carState;
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text, pars);
            List<Model.CarManage> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.CarManage>();
                Model.CarManage cm = null;
                foreach (DataRow row in da.Rows)
                {
                    cm = new Model.CarManage();
                    LoadEntity(cm, row);
                    list.Add(cm);
                }
            }
            return list;
        }
        //查询
        public Model.CarManage GetCarManagebyName(string name)
        {
            //ID, name, IDCard, depName, carType, dateTime, fromTo, cellPhone, carState, userName
            string sql = "select * from CarManage where name=@name";
            SqlParameter[] pars = { new SqlParameter("@name", SqlDbType.NVarChar) };
            pars[0].Value = name;
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text, pars);
            Model.CarManage cm = null;
            if (da.Rows.Count > 0)
            {
                cm = new Model.CarManage();
                LoadEntity(cm, da.Rows[0]);
            }
            return cm;
        }
        //修改
        public int EditCarManage(Model.CarManage cm)
        {
            //ID, name, IDCard, depName, carType, dateTime, fromTo, cellPhone, carState, userName
            string sql = "update CarManage set IDCard=@IDCard,depName=@depName,carType=@carType,dateTime=@dateTime,fromTo=@fromTo,cellPhone=@cellPhone,carState=@carState,userName=@userName where name=@name";
            SqlParameter[] pars = {
                new SqlParameter("@IDCard", SqlDbType.NVarChar),
                new SqlParameter("@depName", SqlDbType.NVarChar),
                new SqlParameter("@carType", SqlDbType.NVarChar),
                new SqlParameter("@dateTime", SqlDbType.NVarChar),
                new SqlParameter("@fromTo", SqlDbType.NVarChar),
                new SqlParameter("@cellPhone", SqlDbType.NVarChar),
                new SqlParameter("@carState", SqlDbType.NVarChar),
                new SqlParameter("@userName", SqlDbType.NVarChar),
                new SqlParameter("@name", SqlDbType.NVarChar)

            };
            pars[0].Value = cm.IDCard;
            pars[1].Value = cm.depName;
            pars[2].Value = cm.carType;
            pars[3].Value = cm.dateTime;
            pars[4].Value = cm.fromTo;
            pars[5].Value = cm.cellPhone;
            pars[6].Value = cm.carState;
            pars[7].Value = cm.userName;
            pars[8].Value = cm.name;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);
        }
        //增加
        public int AddCarManage(Model.CarManage cm)
        {
            //ID, name, IDCard, depName, carType, dateTime, fromTo, cellPhone, carState, userName
            string sql = "insert into CarManage(name, IDCard, depName, carType, dateTime, fromTo, cellPhone, carState, userName) values(@name, @IDCard, @depName, @carType, @dateTime, @fromTo, @cellPhone, @carState, @userName)";
            SqlParameter[] pars = {
                 new SqlParameter("@IDCard", SqlDbType.NVarChar),
                new SqlParameter("@depName", SqlDbType.NVarChar),
                new SqlParameter("@carType", SqlDbType.NVarChar),
                new SqlParameter("@dateTime", SqlDbType.NVarChar),
                new SqlParameter("@fromTo", SqlDbType.NVarChar),
                new SqlParameter("@cellPhone", SqlDbType.NVarChar),
                new SqlParameter("@carState", SqlDbType.NVarChar),
                new SqlParameter("@userName", SqlDbType.NVarChar),
                new SqlParameter("@name", SqlDbType.NVarChar)
            };
            pars[0].Value = cm.IDCard;
            pars[1].Value = cm.depName;
            pars[2].Value = cm.carType;
            pars[3].Value = cm.dateTime;
            pars[4].Value = cm.fromTo;
            pars[5].Value = cm.cellPhone;
            pars[6].Value = cm.carState;
            pars[7].Value = cm.userName;
            pars[8].Value = cm.name;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);

        }
        private void LoadEntity(Model.CarManage cm, DataRow row)
        {
            //ID, name, IDCard, depName, carType, dateTime, fromTo, cellPhone, carState, userName
            cm.name = row["name"] != DBNull.Value ? row["name"].ToString() : string.Empty;
            cm.IDCard = row["IDCard"] != DBNull.Value ? row["IDCard"].ToString() : string.Empty;
            cm.dateTime = row["dateTime"] != DBNull.Value ? row["dateTime"].ToString() : string.Empty;
            cm.depName = row["depName"] != DBNull.Value ? row["depName"].ToString() : string.Empty;
            cm.carType = row["carType"] != DBNull.Value ? row["carType"].ToString() : string.Empty;
            cm.fromTo = row["fromTo"] != DBNull.Value ? row["fromTo"].ToString() : string.Empty;
            cm.cellPhone = row["cellPhone"] != DBNull.Value ? row["cellPhone"].ToString() : string.Empty;
            cm.carState = row["carState"] != DBNull.Value ? row["carState"].ToString() : string.Empty;
            cm.userName = row["userName"] != DBNull.Value ? row["userName"].ToString() : string.Empty;
        }
    }
}