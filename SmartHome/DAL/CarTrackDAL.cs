using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace SmartHome.DAL
{
    public class CarTrackDAL
    {
        public List<Model.CarTrack> GetList()
        {
            //ID, plateNumber, startTime, endTime, userName, trackName
            string sql = "select * from CarTrack";
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text);
            List<Model.CarTrack> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.CarTrack>();
                Model.CarTrack cm = null;
                foreach (DataRow row in da.Rows)
                {
                    cm = new Model.CarTrack();
                    LoadEntity(cm, row);
                    list.Add(cm);
                }
            }
            return list;
        }
        public List<Model.CarTrack> GetListbyPlateNumber(string plateNumber)
        {
            //ID, plateNumber, startTime, endTime, userName, trackName
            string sql = "select * from CarTrack where plateNumber=@plateNumber";
            SqlParameter[] pars = { new SqlParameter("@plateNumber", SqlDbType.NVarChar) };
            pars[0].Value = plateNumber;
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text, pars);
            List<Model.CarTrack> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.CarTrack>();
                Model.CarTrack cm = null;
                foreach (DataRow row in da.Rows)
                {
                    cm = new Model.CarTrack();
                    LoadEntity(cm, row);
                    list.Add(cm);
                }
            }
            return list;
        }
        public Model.CarTrack GetCarTrackbyTrackName(string trackName)
        {
            //ID, plateNumber, startTime, endTime, userName, trackName
            string sql = "select * from CarTrack where trackName=@trackName";
            SqlParameter[] pars = { new SqlParameter("@trackName", SqlDbType.NVarChar) };
            pars[0].Value = trackName;
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text, pars);

            Model.CarTrack ct = null;
            if (da.Rows.Count > 0)
            {
                ct = new Model.CarTrack();
                LoadEntity(ct, da.Rows[0]);
            }
            return ct;
        }
        public Model.CarTrack GetCarTrackbyTrackNamePlateNumber(string plateNumber, string trackName)
        {
            //ID, plateNumber, startTime, endTime, userName, trackName
            string sql = "select * from CarTrack where trackName=@trackName and plateNumber=@plateNumber";
            System.Diagnostics.Debug.Write("plateNumber");
            System.Diagnostics.Debug.Write("trackName");
            // where trackName = @trackName and plateNumber = @plateNumber
            SqlParameter[] pars = {
                 new SqlParameter("@trackName", SqlDbType.NVarChar),
                 new SqlParameter("@plateNumber", SqlDbType.NVarChar)
            };
            pars[0].Value = trackName;
            pars[1].Value = plateNumber;
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text, pars);


            // Model.CarTrack ct = null;
            Model.CarTrack ct = null;
            if (da.Rows.Count > 0)
            {
                ct = new Model.CarTrack();
                LoadEntity(ct, da.Rows[0]);
            }
            return ct;
        }

        public int DeleteCarTrackbyPlateNumbertrackName(string plateNumber, string trackName)
        {
            string sql = "delete from CarTrack where trackName=@trackName and plateNumber=@plateNumber";

            SqlParameter[] pars = {
                 new SqlParameter("@trackName", SqlDbType.NVarChar),
                 new SqlParameter("@plateNumber", SqlDbType.NVarChar)
            };
            pars[0].Value = trackName;
            pars[1].Value = plateNumber;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);
        }
        public int DeleteCarTrackbyPlateNumberStartTimeEndTimeUserNameTrackName(Model.CarTrack ct)
        {
            string sql = "delete from CarTrack where trackName=@trackName and plateNumber=@plateNumber and userName=@userName and startTime=@startTime and endTime=@endTime";

            SqlParameter[] pars = {
                new SqlParameter("@startTime", SqlDbType.NVarChar),
                new SqlParameter("@endTime", SqlDbType.NVarChar),
                new SqlParameter("@userName", SqlDbType.NVarChar),
                new SqlParameter("@plateNumber", SqlDbType.NVarChar),
                new SqlParameter("@trackName", SqlDbType.NVarChar)
            };
            pars[0].Value = ct.startTime;
            pars[1].Value = ct.endTime;
            pars[2].Value = ct.userName;
            pars[3].Value = ct.plateNumber;
            pars[4].Value = ct.trackName;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);
        }
        public int EditCarTrack(Model.CarTrack ct)
        {
            //ID, plateNumber, startTime, endTime, userName, trackName
            string sql = "update CarTrack set startTime=@startTime,endTime=@endTime,userName=@userName,destination=@destination where plateNumber=@plateNumber and trackName=@trackName";
            SqlParameter[] pars = {
                new SqlParameter("@startTime", SqlDbType.NVarChar),
                new SqlParameter("@endTime", SqlDbType.NVarChar),
                new SqlParameter("@userName", SqlDbType.NVarChar),
                new SqlParameter("@plateNumber", SqlDbType.NVarChar),
                new SqlParameter("@trackName", SqlDbType.NVarChar),
                new SqlParameter("@destination", SqlDbType.NVarChar)
            };
            pars[0].Value = ct.startTime;
            pars[1].Value = ct.endTime;
            pars[2].Value = ct.userName;
            pars[3].Value = ct.plateNumber;
            pars[4].Value = ct.trackName;
            pars[5].Value = ct.destination;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);
        }
        public int EditCarTrackbyPlateNumberStartTimeEndTimeUserName(Model.CarTrack ct)
        {
            //ID, plateNumber, startTime, endTime, userName, trackName
            string sql = "update CarTrack set trackName=@trackName where plateNumber=@plateNumber and userName=@userName and startTime=@startTime and endTime=@endTime";
            SqlParameter[] pars = {
                new SqlParameter("@startTime", SqlDbType.NVarChar),
                new SqlParameter("@endTime", SqlDbType.NVarChar),
                new SqlParameter("@userName", SqlDbType.NVarChar),
                new SqlParameter("@plateNumber", SqlDbType.NVarChar),
                new SqlParameter("@trackName", SqlDbType.NVarChar)
            };
            pars[0].Value = ct.startTime;
            pars[1].Value = ct.endTime;
            pars[2].Value = ct.userName;
            pars[3].Value = ct.plateNumber;
            pars[4].Value = ct.trackName;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);
        }
        public int AddCarTrack(Model.CarTrack ct)
        {
            Model.CarTrack cttemp = GetCarTrackbyTrackNamePlateNumber(ct.plateNumber, ct.trackName);
            if (cttemp != null)
            {
                if (cttemp.startTime == ct.startTime && cttemp.endTime == ct.endTime && cttemp.userName == ct.userName)
                {
                    return 1;
                }
            }
            //ID, plateNumber, startTime, endTime, userName, trackName
            string sql = "insert into CarTrack(plateNumber, startTime, endTime, userName, trackName, orgin, destination) values(@plateNumber, @startTime, @endTime, @userName, @trackName, @orgin, @destination)";
            SqlParameter[] pars = {
                 new SqlParameter("@plateNumber", SqlDbType.NVarChar),
                new SqlParameter("@startTime", SqlDbType.NVarChar),
                new SqlParameter("@endTime", SqlDbType.NVarChar),
                new SqlParameter("@userName", SqlDbType.NVarChar),
                new SqlParameter("@trackName", SqlDbType.NVarChar),
                new SqlParameter ("@orgin",SqlDbType.NVarChar),
                new SqlParameter ("@destination",SqlDbType.NVarChar)
            };
            pars[0].Value = ct.plateNumber;
            pars[1].Value = ct.startTime;
            pars[2].Value = ct.endTime;
            pars[3].Value = ct.userName;
            pars[4].Value = ct.trackName;
            pars[5].Value = ct.orgin;
            pars[6].Value = ct.destination;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);

        }
        private void LoadEntity(Model.CarTrack ct, DataRow row)
        {
            //ID, plateNumber, startTime, endTime, userName, trackName
            ct.plateNumber = row["plateNumber"] != DBNull.Value ? row["plateNumber"].ToString() : string.Empty;
            ct.startTime = row["startTime"] != DBNull.Value ? row["startTime"].ToString() : string.Empty;
            ct.endTime = row["endTime"] != DBNull.Value ? row["endTime"].ToString() : string.Empty;
            ct.userName = row["userName"] != DBNull.Value ? row["userName"].ToString() : string.Empty;
            ct.trackName = row["trackName"] != DBNull.Value ? row["trackName"].ToString() : string.Empty;
            ct.orgin = row["orgin"] != DBNull.Value ? row["orgin"].ToString() : string.Empty;
            ct.destination = row["destination"] != DBNull.Value ? row["destination"].ToString() : string.Empty;
        }
    }
}