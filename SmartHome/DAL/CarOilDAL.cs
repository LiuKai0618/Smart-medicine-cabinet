using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace SmartHome.DAL
{
    public class CarOilDAL
    {
        //ID, dateTime, plateNumber, runMiles, oilNumber, oilCapacity, cost, oilStation
        public List<Model.CarOil> GetList()
        {
            string sql = "select * from CarOil";
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text);
            List<Model.CarOil> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.CarOil>();
                Model.CarOil co = null;
                foreach (DataRow row in da.Rows)
                {
                    co = new Model.CarOil();
                    LoadEntity(co, row);
                    list.Add(co);
                }
            }
            return list;
        }
        //增加
        public int AddCarOil(Model.CarOil cm)
        {
            //ID, dateTime, plateNumber, runMiles, oilNumber, oilCapacity, cost, oilStation
            string sql = "insert into CarOil(dateTime, plateNumber, runMiles, oilNumber, oilCapacity, cost, oilStation) values(@dateTime, @plateNumber, @runMiles, @oilNumber, @oilCapacity, @cost, @oilStation)";
            SqlParameter[] pars = {
                 new SqlParameter("@dateTime", SqlDbType.NVarChar),
                new SqlParameter("@plateNumber", SqlDbType.NVarChar),
                new SqlParameter("@runMiles", SqlDbType.NVarChar),
                new SqlParameter("@oilNumber", SqlDbType.NVarChar),
                new SqlParameter("@oilCapacity", SqlDbType.NVarChar),
                new SqlParameter("@cost", SqlDbType.NVarChar),
                new SqlParameter("@oilStation", SqlDbType.NVarChar)
            };
            pars[0].Value = cm.dateTime;
            pars[1].Value = cm.plateNumber;
            pars[2].Value = cm.runMiles;
            pars[3].Value = cm.oilNumber;
            pars[4].Value = cm.oilCapacity;
            pars[5].Value = cm.cost;
            pars[6].Value = cm.oilStation;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);

        }
        private void LoadEntity(Model.CarOil co, DataRow row)
        {
            //ID, dateTime, plateNumber, runMiles, oilNumber, oilCapacity, cost, oilStation
            co.dateTime = row["dateTime"] != DBNull.Value ? row["dateTime"].ToString() : string.Empty;
            co.plateNumber = row["plateNumber"] != DBNull.Value ? row["plateNumber"].ToString() : string.Empty;
            co.runMiles = row["runMiles"] != DBNull.Value ? row["runMiles"].ToString() : string.Empty;
            co.oilNumber = row["oilNumber"] != DBNull.Value ? row["oilNumber"].ToString() : string.Empty;
            co.oilCapacity = row["oilCapacity"] != DBNull.Value ? row["oilCapacity"].ToString() : string.Empty;
            co.cost = row["cost"] != DBNull.Value ? row["cost"].ToString() : string.Empty;
            co.oilStation = row["oilStation"] != DBNull.Value ? row["oilStation"].ToString() : string.Empty;
        }
    }
}