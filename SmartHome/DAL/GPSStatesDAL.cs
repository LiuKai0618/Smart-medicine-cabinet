using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace SmartHome.DAL
{
    public class GPSStatesDAL
    {
        //ID, IPPort, IMEI, GasElectricSwitch, LocationSwitch, Charging, ACC, Garrison, PowerLevel, SignalIntensity, DateTime
        public List<Model.GPSStates> GetList()
        {
            string sql = "select * from GPSStates  ";
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text);
            List<Model.GPSStates> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.GPSStates>();
                Model.GPSStates gpsstates = null;
                foreach (DataRow row in da.Rows)
                {
                    gpsstates = new Model.GPSStates();
                    LoadEntity(gpsstates, row);
                    list.Add(gpsstates);
                }
            }
            return list;
        }
        public List<Model.GPSStates> GetList3(string startdatetime, string enddatetime)
        {
            string sql = "select * from GPSStates where CONVERT(datetime,DateTime,111) between CONVERT(datetime,'" + startdatetime + "',111) AND CONVERT(datetime,'" + enddatetime + "',111)";
            Console.WriteLine(sql);
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text);
            List<Model.GPSStates> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.GPSStates>();
                Model.GPSStates gpsstates = null;
                foreach (DataRow row in da.Rows)
                {
                    gpsstates = new Model.GPSStates();
                    LoadEntity(gpsstates, row);
                    list.Add(gpsstates);
                }
            }
            return list;
        }
        public List<Model.GPSStates> GetList2(string start, string end)
        {
            string sql = "select * from GPSStates where CONVERT(datetime,DateTime,111) between '2021-07-03' AND '2021-07-15'";
            //string sql = "select * from GPSStates where CONVERT(datetime,DateTime,111) between 'CONVERT(datetime,"+start+",111)' AND 'CONVERT(datetime,"+end+",111)' ";
            //WHERE (GAddTime BETWEEN CONVERT(datetime, LEFT(GETDATE(), 10) + ' 00:00:00.000') 
            //AND CONVERT(datetime, LEFT(GETDATE(), 10) +' 00:00:00.000') +1) 
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text);
            List<Model.GPSStates> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.GPSStates>();
                Model.GPSStates gpsstates = null;
                foreach (DataRow row in da.Rows)
                {
                    gpsstates = new Model.GPSStates();
                    LoadEntity(gpsstates, row);
                    list.Add(gpsstates);
                }
            }
            return list;
        }
        public int AddGPSStates(Model.GPSStates gpsstates)
        {
            //ID,IPPort,IMEI,GasElectricSwitch,LocationSwitch,Charging,ACC,Garrison,PowerLevel,SignalIntensity,DateTime
            string sql = "insert into GPSStates(IPPort,IMEI,GasElectricSwitch,LocationSwitch,Charging,ACC,Garrison,PowerLevel,SignalIntensity,DateTime) values(@IPPort,@IMEI,@GasElectricSwitch,@LocationSwitch,@Charging,@ACC,@Garrison,@PowerLevel,@SignalIntensity,@DateTime)";
            SqlParameter[] pars = {
                new SqlParameter("@IPPort", SqlDbType.NVarChar),
                new SqlParameter("@IMEI", SqlDbType.NVarChar),
                new SqlParameter("@GasElectricSwitch", SqlDbType.NVarChar),
                new SqlParameter("@LocationSwitch", SqlDbType.NVarChar),
                new SqlParameter("@Charging", SqlDbType.NVarChar),
                new SqlParameter("@ACC", SqlDbType.NVarChar),
                new SqlParameter("@Garrison", SqlDbType.NVarChar),
                new SqlParameter("@PowerLevel", SqlDbType.NVarChar),
                new SqlParameter("@SignalIntensity", SqlDbType.NVarChar),
                new SqlParameter("@DateTime", SqlDbType.NVarChar)
            };
            pars[0].Value = gpsstates.IPPort;
            pars[1].Value = gpsstates.IMEI;
            pars[2].Value = gpsstates.GasElectricSwitch;
            pars[3].Value = gpsstates.LocationSwitch;
            pars[4].Value = gpsstates.Charging;
            pars[5].Value = gpsstates.ACC;
            pars[6].Value = gpsstates.Garrison;
            pars[7].Value = gpsstates.PowerLevel;
            pars[8].Value = gpsstates.SignalIntensity;
            pars[9].Value = gpsstates.DateTime;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);

        }

        public Model.GPSStates GetGPSStates(string imei)
        {
            string sql = "select * from GPSStates where IMEI=@IMEI";
            SqlParameter[] pars = { new SqlParameter("@IMEI", SqlDbType.NVarChar) };
            pars[0].Value = imei;
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text, pars);
            Model.GPSStates gpsstates = null;
            if (da.Rows.Count > 0)
            {
                gpsstates = new Model.GPSStates();
                LoadEntity(gpsstates, da.Rows[0]);
            }
            return gpsstates;
        }
        public int EditGPSStates(Model.GPSStates gpsstates)
        {
            //ID,IPPort,IMEI,GasElectricSwitch,LocationSwitch,Charging,ACC,Garrison,PowerLevel,SignalIntensity,DateTime
            string sql = "update GPSStates set IPPort=@IPPort,GasElectricSwitch=@GasElectricSwitch,LocationSwitch=@LocationSwitch,Charging=@Charging,ACC=@ACC,Garrison=@Garrison,PowerLevel=@PowerLevel,SignalIntensity=@SignalIntensity,DateTime=@DateTime where IMEI=@IMEI";
            SqlParameter[] pars = {
                new SqlParameter("@IPPort", SqlDbType.NVarChar),
                new SqlParameter("@GasElectricSwitch", SqlDbType.NVarChar),
                new SqlParameter("@LocationSwitch", SqlDbType.NVarChar),
                new SqlParameter("@Charging", SqlDbType.NVarChar),
                new SqlParameter("@ACC", SqlDbType.NVarChar),
                new SqlParameter("@Garrison", SqlDbType.NVarChar),
                new SqlParameter("@PowerLevel", SqlDbType.NVarChar),
                new SqlParameter("@SignalIntensity", SqlDbType.NVarChar),
                new SqlParameter("@DateTime", SqlDbType.NVarChar),
                new SqlParameter("@IMEI", SqlDbType.NVarChar)
            };
            pars[0].Value = gpsstates.IPPort;
            pars[1].Value = gpsstates.GasElectricSwitch;
            pars[2].Value = gpsstates.LocationSwitch;
            pars[3].Value = gpsstates.Charging;
            pars[4].Value = gpsstates.ACC;
            pars[5].Value = gpsstates.Garrison;
            pars[6].Value = gpsstates.PowerLevel;
            pars[7].Value = gpsstates.SignalIntensity;
            pars[8].Value = gpsstates.DateTime;
            pars[9].Value = gpsstates.IMEI;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);
        }
        private void LoadEntity(Model.GPSStates gpsstates, DataRow row)
        {
            //ID, IPPort, IMEI, GasElectricSwitch, LocationSwitch, Charging, ACC, Garrison, PowerLevel, SignalIntensity, DateTime
            gpsstates.IPPort = row["IPPort"] != DBNull.Value ? row["IPPort"].ToString() : string.Empty;
            gpsstates.IMEI = row["IMEI"] != DBNull.Value ? row["IMEI"].ToString() : string.Empty;
            gpsstates.GasElectricSwitch = row["GasElectricSwitch"] != DBNull.Value ? row["GasElectricSwitch"].ToString() : string.Empty;
            gpsstates.LocationSwitch = row["LocationSwitch"] != DBNull.Value ? row["LocationSwitch"].ToString() : string.Empty;
            gpsstates.Charging = row["Charging"] != DBNull.Value ? row["Charging"].ToString() : string.Empty;
            gpsstates.ACC = row["ACC"] != DBNull.Value ? row["ACC"].ToString() : string.Empty;
            gpsstates.Garrison = row["Garrison"] != DBNull.Value ? row["Garrison"].ToString() : string.Empty;
            gpsstates.PowerLevel = row["PowerLevel"] != DBNull.Value ? row["PowerLevel"].ToString() : string.Empty;
            gpsstates.SignalIntensity = row["SignalIntensity"] != DBNull.Value ? row["SignalIntensity"].ToString() : string.Empty;
            gpsstates.DateTime = row["DateTime"] != DBNull.Value ? row["DateTime"].ToString() : string.Empty;
        }
    }
}