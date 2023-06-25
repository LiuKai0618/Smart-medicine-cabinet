using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace SmartHome.DAL
{
    public class CarCheckDAL
    {
        //ID, name, IDCard, depName, carType, dateTime, fromTo, cellPhone
        public List<Model.CarCheck> GetList()
        {
            string sql = "select * from CarCheck";
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text);
            List<Model.CarCheck> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.CarCheck>();
                Model.CarCheck cm = null;
                foreach (DataRow row in da.Rows)
                {
                    cm = new Model.CarCheck();
                    LoadEntity(cm, row);
                    list.Add(cm);
                }
            }
            return list;
        }
        private void LoadEntity(Model.CarCheck cm, DataRow row)
        {
            //ID, name, IDCard, depName, carType, dateTime, fromTo, cellPhone
            cm.name = row["name"] != DBNull.Value ? row["name"].ToString() : string.Empty;
            cm.IDCard = row["IDCard"] != DBNull.Value ? row["IDCard"].ToString() : string.Empty;
            cm.dateTime = row["dateTime"] != DBNull.Value ? row["dateTime"].ToString() : string.Empty;
            cm.depName = row["depName"] != DBNull.Value ? row["depName"].ToString() : string.Empty;
            cm.carType = row["carType"] != DBNull.Value ? row["carType"].ToString() : string.Empty;
            cm.fromTo = row["fromTo"] != DBNull.Value ? row["fromTo"].ToString() : string.Empty;
            cm.cellPhone = row["cellPhone"] != DBNull.Value ? row["cellPhone"].ToString() : string.Empty;
        }
    }
}