using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace SmartHome.Third
{
    public class CarInforDAL
    {
        //ID, plateNumber, visitCount, runMiles
        public List<CarInfor> GetList()
        {
            string sql = "select * from CarInfor";
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text);
            List<CarInfor> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<CarInfor>();
                CarInfor car = null;
                foreach (DataRow row in da.Rows)
                {
                    car = new CarInfor();
                    LoadEntity(car, row);
                    list.Add(car);
                }
            }
            return list;
        }
        //查询
        public CarInfor GetCarbyPlateNumber(string plateNumber)
        {
            //ID, plateNumber, visitCount, runMiles
            string sql = "select * from CarInfor where plateNumber=@plateNumber";
            SqlParameter[] pars = { new SqlParameter("@plateNumber", SqlDbType.NVarChar) };
            pars[0].Value = plateNumber;
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text, pars);
            CarInfor car = null;
            if (da.Rows.Count > 0)
            {
                car = new CarInfor();
                LoadEntity(car, da.Rows[0]);
            }
            return car;
        }
        //删除
        public int DeleteCarbyPlateNumber(string plateNumber)
        {
            //ID, plateNumber, visitCount, runMiles
            string sql = "delete from CarInfor where plateNumber=@plateNumber";
            SqlParameter[] pars = { new SqlParameter("@plateNumber", SqlDbType.NVarChar) };
            pars[0].Value = plateNumber;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);
        }
        //修改
        public int EditCar(CarInfor car)
        {
            //ID, plateNumber, visitCount, runMiles
            string sql = "update CarInfor set visitCount=@visitCount,runMiles=@runMiles where plateNumber=@plateNumber";
            SqlParameter[] pars = {
                new SqlParameter("@visitCount", SqlDbType.NVarChar),
                new SqlParameter("@runMiles", SqlDbType.NVarChar),
                new SqlParameter("@plateNumber", SqlDbType.NVarChar)
            };
            pars[0].Value = car.visitCount;
            pars[1].Value = car.runMiles;
            pars[2].Value = car.plateNumber;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);
        }
        //增加
        public int AddCar(CarInfor car)
        {
            //ID, plateNumber, visitCount, runMiles
            string sql = "insert into CarInfor(plateNumber, visitCount, runMiles) values(@plateNumber, @visitCount, @runMiles)";
            SqlParameter[] pars = {
                new SqlParameter("@visitCount", SqlDbType.NVarChar),
                new SqlParameter("@runMiles", SqlDbType.NVarChar),
                new SqlParameter("@plateNumber", SqlDbType.NVarChar)
            };
            pars[0].Value = car.visitCount;
            pars[1].Value = car.runMiles;
            pars[2].Value = car.plateNumber;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);

        }
        private void LoadEntity(Third.CarInfor car, DataRow row)
        {
            //ID, plateNumber, visitCount, runMiles
            car.plateNumber = row["plateNumber"] != DBNull.Value ? row["plateNumber"].ToString() : string.Empty;
            car.visitCount = row["visitCount"] != DBNull.Value ? row["visitCount"].ToString() : string.Empty;
            car.runMiles = row["runMiles"] != DBNull.Value ? row["runMiles"].ToString() : string.Empty;
        }
    }
}