using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace SmartHome.DAL
{
    public class CarExceptionDAL
    {
        //ID, brand, name, oilConsumption, insurance, breakRules, maintain, carState
        public List<Model.CarException> GetList()
        {
            string sql = "select * from CarException";
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text);
            List<Model.CarException> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.CarException>();
                Model.CarException ce = null;
                foreach (DataRow row in da.Rows)
                {
                    ce = new Model.CarException();
                    LoadEntity(ce, row);
                    list.Add(ce);
                }
            }
            return list;
        }
        private void LoadEntity(Model.CarException ce, DataRow row)
        {
            //ID, brand, name, oilConsumption, insurance, breakRules, maintain, carState
            ce.brand = row["brand"] != DBNull.Value ? row["brand"].ToString() : string.Empty;
            ce.name = row["name"] != DBNull.Value ? row["name"].ToString() : string.Empty;
            ce.oilConsumption = row["oilConsumption"] != DBNull.Value ? row["oilConsumption"].ToString() : string.Empty;
            ce.insurance = row["insurance"] != DBNull.Value ? row["insurance"].ToString() : string.Empty;
            ce.breakRules = row["breakRules"] != DBNull.Value ? row["breakRules"].ToString() : string.Empty;
            ce.maintain = row["maintain"] != DBNull.Value ? row["maintain"].ToString() : string.Empty;
            ce.carState = row["carState"] != DBNull.Value ? row["carState"].ToString() : string.Empty;
        }
    }
}