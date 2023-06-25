using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace SmartHome.DAL
{
    public class CarGPSInforsDAL
    {
        //ID, IMEI, plateNumber
        public List<Model.CarGPSInfors> GetList()
        {
            string sql = "select * from CarGPSInfors";
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text);
            List<Model.CarGPSInfors> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.CarGPSInfors>();
                Model.CarGPSInfors cg = null;
                foreach (DataRow row in da.Rows)
                {
                    cg = new Model.CarGPSInfors();
                    LoadEntity(cg, row);
                    list.Add(cg);
                }
            }
            return list;
        }
        //查询
        public Model.CarGPSInfors GetCarGPSInforbyIMEI(string imei)
        {
            //ID, IMEI, plateNumber
            string sql = "select * from CarGPSInfors where imei=@imei";
            SqlParameter[] pars = { new SqlParameter("@imei", SqlDbType.NVarChar) };
            pars[0].Value = imei;
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text, pars);
            Model.CarGPSInfors cg = null;
            if (da.Rows.Count > 0)
            {
                cg = new Model.CarGPSInfors();
                LoadEntity(cg, da.Rows[0]);
            }
            return cg;
        }
        //查询
        public Model.CarGPSInfors GetCarGPSInforbyPlateNumber(string plateNumber)
        {
            //ID, IMEI, plateNumber
            string sql = "select * from CarGPSInfors where plateNumber=@plateNumber";
            SqlParameter[] pars = { new SqlParameter("@plateNumber", SqlDbType.NVarChar) };
            pars[0].Value = plateNumber;
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text, pars);
            Model.CarGPSInfors cg = null;
            if (da.Rows.Count > 0)
            {
                cg = new Model.CarGPSInfors();
                LoadEntity(cg, da.Rows[0]);
            }
            return cg;
        }
        private void LoadEntity(Model.CarGPSInfors cg, DataRow row)
        {
            //ID, IMEI, plateNumber
            cg.IMEI = row["IMEI"] != DBNull.Value ? row["IMEI"].ToString() : string.Empty;
            cg.plateNumber = row["plateNumber"] != DBNull.Value ? row["plateNumber"].ToString() : string.Empty;
        }
    }
}