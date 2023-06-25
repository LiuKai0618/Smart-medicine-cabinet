using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace SmartHome.DAL
{
    public class GPSIMEIDAL
    {
        //增加一个新的GPS数据表
        public bool AddGPSIMEITable(Model.GPSIMEI gpsimei)
        {
            string sql = "select * from sys.tables where name= @imei";
            SqlParameter[] pars = { new SqlParameter("@imei", SqlDbType.NVarChar) };
            pars[0].Value = "GPS" + gpsimei.IMEI;
            if (SqlHelper.getDataTable(sql, CommandType.Text, pars).Rows.Count > 0)
            {
                return true;
            }
            else
            {
                //增加表格
                string sqlnew = "select * into GPS" + gpsimei.IMEI + " from GPS0000000000000000  where 1=2";
                int temp = SqlHelper.ExecuteNonquery(sqlnew, CommandType.Text);
                if (temp == 0)
                {
                    //增加主键
                    string sqlpid = "alter table GPS" + gpsimei.IMEI + " add primary key(ID)";
                    int ptemp = SqlHelper.ExecuteNonquery(sqlpid, CommandType.Text);
                    if (ptemp == -1)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }


                }
                else
                {
                    return false;
                }

            }
        }
        //根据IMEI返回最新的一条数据
        public Model.GPSIMEI GetLastByIMEI(string imei)
        {
            //table is exist?
            string sql1 = "select * from sys.tables where name= @imei";
            SqlParameter[] pars = { new SqlParameter("@imei", SqlDbType.NVarChar) };
            pars[0].Value = "GPS" + imei;
            if (SqlHelper.getDataTable(sql1, CommandType.Text, pars).Rows.Count <= 0)
            {
                return null;
            }
            //假定该表格已经存在
            //string sql = "select * from GPSStates where IMEI=@IMEI";
            //SqlParameter[] pars = { new SqlParameter("@IMEI", SqlDbType.NVarChar) };
            //pars[0].Value = imei;
            //DataTable da = SqlHelper.getDataTable(sql, CommandType.Text, pars);
            //Model.GPSStates gpsstates = null;
            //if (da.Rows.Count > 0)
            //{
            //    gpsstates = new Model.GPSStates();
            //    LoadEntity(gpsstates, da.Rows[0]);
            //}
            //return gpsstates;
            //select top 1 * from GPS0868120247900787 order by ID desc



            string sql = "select top 1 * from GPS" + imei + " order by ID desc";
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text);
            Model.GPSIMEI gpsimei = null;
            if (da.Rows.Count > 0)
            {
                gpsimei = new Model.GPSIMEI();
                LoadEntity(gpsimei,da.Rows[0]);
                //list = new List<Model.GPSIMEI>();
                //Model.GPSIMEI gpsimei = null;
                //foreach (DataRow row in da.Rows)
                //{
                //    gpsimei = new Model.GPSIMEI();
                //    LoadEntity(gpsimei, row);
                //    list.Add(gpsimei);
                //}
            }
            return gpsimei;
        }
        //根据IMEI返回对应数据表中的所有数据
        public List<Model.GPSIMEI> GetList(string imei)
        {
            //table is exist?
            string sql1 = "select * from sys.tables where name= @imei";
            SqlParameter[] pars = { new SqlParameter("@imei", SqlDbType.NVarChar) };
            pars[0].Value = "GPS" + imei;
            if (SqlHelper.getDataTable(sql1, CommandType.Text, pars).Rows.Count <= 0)
            {
                return null;
            }
            //假定该表格已经存在
            string sql = "select * from GPS" + imei;
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text);
            List<Model.GPSIMEI> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.GPSIMEI>();
                Model.GPSIMEI gpsimei = null;
                foreach (DataRow row in da.Rows)
                {
                    gpsimei = new Model.GPSIMEI();
                    LoadEntity(gpsimei, row);
                    list.Add(gpsimei);
                }
            }
            return list;
        }
        public List<Model.GPSIMEI> GetListbyIMEIStartEndDateTime(string imei,string startTime,string endTime)
        {
            //table is exist?
            string sql1 = "select * from sys.tables where name= @imei";
            SqlParameter[] pars = { new SqlParameter("@imei", SqlDbType.NVarChar) };
            pars[0].Value = "GPS" + imei;
            if (SqlHelper.getDataTable(sql1, CommandType.Text, pars).Rows.Count <= 0)
            {
                return null;
            }
            //假定该表格已经存在
            //select * from GPS0868120253315557 where DateTime between '2021/2/3 10:37:14' and '2021/2/3 10:52:28';
            string sql = "select * from GPS" + imei + " where DateTime between '"+startTime+"' and '"+endTime+"'";
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text);
            List<Model.GPSIMEI> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.GPSIMEI>();
                Model.GPSIMEI gpsimei = null;
                foreach (DataRow row in da.Rows)
                {
                    gpsimei = new Model.GPSIMEI();
                    LoadEntity(gpsimei, row);
                    list.Add(gpsimei);
                }
            }
            return list;
        }
        public int AddGPSIMEIData(Model.GPSIMEI gpsimei)
        {
            //ID, IMEI, DateTime, Latitude, Longitude, Speed, RealTimeLocation, IsLocated, LongitudeEastWest, LatitudeSouthNorth, Direction, ACC, UploadMode, RealTimeOrSupply, AccumulatedMiles
            string sql = "insert into GPS" + gpsimei.IMEI + "(IMEI, DateTime, Latitude, Longitude, Speed, RealTimeLocation, IsLocated, LongitudeEastWest, LatitudeSouthNorth, Direction, ACC, UploadMode, RealTimeOrSupply, AccumulatedMiles) values(@IMEI, @DateTime, @Latitude, @Longitude, @Speed, @RealTimeLocation, @IsLocated, @LongitudeEastWest, @LatitudeSouthNorth, @Direction, @ACC, @UploadMode, @RealTimeOrSupply, @AccumulatedMiles)";
            SqlParameter[] pars = {
                new SqlParameter("@IMEI", SqlDbType.NVarChar),
                new SqlParameter("@DateTime", SqlDbType.NVarChar),
                new SqlParameter("@Latitude", SqlDbType.NVarChar),
                new SqlParameter("@Longitude", SqlDbType.NVarChar),
                new SqlParameter("@Speed", SqlDbType.NVarChar),
                new SqlParameter("@RealTimeLocation", SqlDbType.NVarChar),
                new SqlParameter("@IsLocated", SqlDbType.NVarChar),
                new SqlParameter("@LongitudeEastWest", SqlDbType.NVarChar),
                new SqlParameter("@LatitudeSouthNorth", SqlDbType.NVarChar),
                new SqlParameter("@Direction", SqlDbType.NVarChar),
                new SqlParameter("@ACC", SqlDbType.NVarChar),
                new SqlParameter("@UploadMode", SqlDbType.NVarChar),
                new SqlParameter("@RealTimeOrSupply", SqlDbType.NVarChar),
                new SqlParameter("@AccumulatedMiles", SqlDbType.NVarChar)
            };
            pars[0].Value = gpsimei.IMEI;
            pars[1].Value = gpsimei.DateTime;
            pars[2].Value = gpsimei.Latitude;
            pars[3].Value = gpsimei.Longitude;
            pars[4].Value = gpsimei.Speed;
            pars[5].Value = gpsimei.RealTimeLocation;
            pars[6].Value = gpsimei.IsLocated;
            pars[7].Value = gpsimei.LongitudeEastWest;
            pars[8].Value = gpsimei.LatitudeSouthNorth;
            pars[9].Value = gpsimei.Direction;
            pars[10].Value = gpsimei.ACC;
            pars[11].Value = gpsimei.UploadMode;
            pars[12].Value = gpsimei.RealTimeOrSupply;
            pars[13].Value = gpsimei.AccumulatedMiles;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);

        }
        private void LoadEntity(Model.GPSIMEI gpsimei, DataRow row)
        {
            //ID, IMEI, DateTime, Latitude, Longitude, Speed, RealTimeLocation, IsLocated, LongitudeEastWest, LatitudeSouthNorth, 
            //Direction, ACC, UploadMode, RealTimeOrSupply, AccumulatedMiles
            gpsimei.IMEI = row["IMEI"] != DBNull.Value ? row["IMEI"].ToString() : string.Empty;
            gpsimei.DateTime = row["DateTime"] != DBNull.Value ? row["DateTime"].ToString() : string.Empty;
            gpsimei.Latitude = row["Latitude"] != DBNull.Value ? row["Latitude"].ToString() : string.Empty;
            gpsimei.Longitude = row["Longitude"] != DBNull.Value ? row["Longitude"].ToString() : string.Empty;
            gpsimei.Speed = row["Speed"] != DBNull.Value ? row["Speed"].ToString() : string.Empty;
            gpsimei.RealTimeLocation = row["RealTimeLocation"] != DBNull.Value ? row["RealTimeLocation"].ToString() : string.Empty;
            gpsimei.IsLocated = row["IsLocated"] != DBNull.Value ? row["IsLocated"].ToString() : string.Empty;
            gpsimei.LongitudeEastWest = row["LongitudeEastWest"] != DBNull.Value ? row["LongitudeEastWest"].ToString() : string.Empty;
            gpsimei.LatitudeSouthNorth = row["LatitudeSouthNorth"] != DBNull.Value ? row["LatitudeSouthNorth"].ToString() : string.Empty;
            gpsimei.Direction = row["Direction"] != DBNull.Value ? row["Direction"].ToString() : string.Empty;
            gpsimei.ACC = row["ACC"] != DBNull.Value ? row["ACC"].ToString() : string.Empty;
            gpsimei.UploadMode = row["UploadMode"] != DBNull.Value ? row["UploadMode"].ToString() : string.Empty;
            gpsimei.RealTimeOrSupply = row["RealTimeOrSupply"] != DBNull.Value ? row["RealTimeOrSupply"].ToString() : string.Empty;
            gpsimei.AccumulatedMiles = row["AccumulatedMiles"] != DBNull.Value ? row["AccumulatedMiles"].ToString() : string.Empty;
        }
    }
}