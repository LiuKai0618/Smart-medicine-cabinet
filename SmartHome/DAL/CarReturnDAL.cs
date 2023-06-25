using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace SmartHome.DAL
{
    public class CarReturnDAL
    {
        //ID, name, IDCard, depName, carType, dateTime, fromTo, cellPhone, cost, runMiles
        public List<Model.CarReturn> GetList()
        {
            string sql = "select * from CarReturn";
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text);
            List<Model.CarReturn> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.CarReturn>();
                Model.CarReturn co = null;
                foreach (DataRow row in da.Rows)
                {
                    co = new Model.CarReturn();
                    LoadEntity(co, row);
                    list.Add(co);
                }
            }
            return list;
        }
        public int AddCarReturn(Model.CarReturn cm)
        {
            //ID, name, IDCard, depName, carType, dateTime, fromTo, cellPhone, cost, runMiles
            string sql = "insert into CarReturn(name, IDCard, depName, carType, dateTime, fromTo, cellPhone, cost, runMiles) values(@name, @IDCard, @depName, @carType, @dateTime, @fromTo, @cellPhone, @cost, @runMiles)";
            SqlParameter[] pars = {
                new SqlParameter("@name", SqlDbType.NVarChar),
                new SqlParameter("@IDCard", SqlDbType.NVarChar),
                new SqlParameter("@depName", SqlDbType.NVarChar),
                new SqlParameter("@carType", SqlDbType.NVarChar),
                new SqlParameter("@dateTime", SqlDbType.NVarChar),
                new SqlParameter("@fromTo", SqlDbType.NVarChar),
                new SqlParameter("@cellPhone", SqlDbType.NVarChar),
                new SqlParameter("@cost", SqlDbType.NVarChar),
                new SqlParameter("@runMiles", SqlDbType.NVarChar)
            };
            pars[0].Value = cm.name;
            pars[1].Value = cm.IDCard;
            pars[2].Value = cm.depName;
            pars[3].Value = cm.carType;
            pars[4].Value = cm.dateTime;
            pars[5].Value = cm.fromTo;
            pars[6].Value = cm.cellPhone;
            pars[7].Value = cm.cost;
            pars[8].Value = cm.runMiles;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);

        }
        private void LoadEntity(Model.CarReturn cr, DataRow row)
        {
            //ID, name, IDCard, depName, carType, dateTime, fromTo, cellPhone, cost, runMiles
            cr.name = row["name"] != DBNull.Value ? row["name"].ToString() : string.Empty;
            cr.IDCard = row["IDCard"] != DBNull.Value ? row["IDCard"].ToString() : string.Empty;
            cr.depName = row["depName"] != DBNull.Value ? row["depName"].ToString() : string.Empty;
            cr.carType = row["carType"] != DBNull.Value ? row["carType"].ToString() : string.Empty;
            cr.dateTime = row["dateTime"] != DBNull.Value ? row["dateTime"].ToString() : string.Empty;
            cr.fromTo = row["fromTo"] != DBNull.Value ? row["fromTo"].ToString() : string.Empty;
            cr.cellPhone = row["cellPhone"] != DBNull.Value ? row["cellPhone"].ToString() : string.Empty;
            cr.cost = row["cost"] != DBNull.Value ? row["cost"].ToString() : string.Empty;
            cr.runMiles = row["runMiles"] != DBNull.Value ? row["runMiles"].ToString() : string.Empty;
        }
    }
}