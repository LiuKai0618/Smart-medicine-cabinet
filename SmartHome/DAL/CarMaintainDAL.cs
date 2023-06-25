using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace SmartHome.DAL
{
    public class CarMaintainDAL
    {
        //ID, brand, driver, dateTime, maintainDep, maintainItem, orderNumber, cost, carState
        public List<Model.CarMaintain> GetList()
        {
            string sql = "select * from CarMaintain";
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text);
            List<Model.CarMaintain> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.CarMaintain>();
                Model.CarMaintain cm = null;
                foreach (DataRow row in da.Rows)
                {
                    cm = new Model.CarMaintain();
                    LoadEntity(cm, row);
                    list.Add(cm);
                }
            }
            return list;
        }
        //增加
        public int AddCarMaintain(Model.CarMaintain cm)
        {
            //ID, brand, driver, dateTime, maintainDep, maintainItem, orderNumber, cost, carState
            string sql = "insert into CarMaintain(brand, driver, dateTime, maintainDep, maintainItem, orderNumber, cost, carState) values(@brand, @driver, @dateTime, @maintainDep, @maintainItem, @orderNumber, @cost, @carState)";
            SqlParameter[] pars = {
                 new SqlParameter("@brand", SqlDbType.NVarChar),
                new SqlParameter("@driver", SqlDbType.NVarChar),
                new SqlParameter("@dateTime", SqlDbType.NVarChar),
                new SqlParameter("@maintainDep", SqlDbType.NVarChar),
                new SqlParameter("@maintainItem", SqlDbType.NVarChar),
                new SqlParameter("@orderNumber", SqlDbType.NVarChar),
                new SqlParameter("@cost", SqlDbType.NVarChar),
                new SqlParameter("@carState", SqlDbType.NVarChar)
            };
            pars[0].Value = cm.brand;
            pars[1].Value = cm.driver;
            pars[2].Value = cm.dateTime;
            pars[3].Value = cm.maintainDep;
            pars[4].Value = cm.maintainItem;
            pars[5].Value = cm.orderNumber;
            pars[6].Value = cm.cost;
            pars[7].Value = cm.carState;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);

        }
        private void LoadEntity(Model.CarMaintain cm, DataRow row)
        {
            //ID, brand, driver, dateTime, maintainDep, maintainItem, orderNumber, cost, carState
            cm.brand = row["brand"] != DBNull.Value ? row["brand"].ToString() : string.Empty;
            cm.driver = row["driver"] != DBNull.Value ? row["driver"].ToString() : string.Empty;
            cm.dateTime = row["dateTime"] != DBNull.Value ? row["dateTime"].ToString() : string.Empty;
            cm.maintainDep = row["maintainDep"] != DBNull.Value ? row["maintainDep"].ToString() : string.Empty;
            cm.maintainItem = row["maintainItem"] != DBNull.Value ? row["maintainItem"].ToString() : string.Empty;
            cm.orderNumber = row["orderNumber"] != DBNull.Value ? row["orderNumber"].ToString() : string.Empty;
            cm.cost = row["cost"] != DBNull.Value ? row["cost"].ToString() : string.Empty;
            cm.carState = row["carState"] != DBNull.Value ? row["carState"].ToString() : string.Empty;
        }

    }
}