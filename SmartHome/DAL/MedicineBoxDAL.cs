using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace SmartHome.DAL
{
    public class MedicineBoxDAL
    {
        //ID, lnglat, userName, color, boxName
        public List<Model.MedicineBox> GetList()
        {
            string sql = "select * from MedicineBox";
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text);
            List<Model.MedicineBox> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.MedicineBox>();
                Model.MedicineBox cm = null;
                foreach (DataRow row in da.Rows)
                {
                    cm = new Model.MedicineBox();
                    LoadEntity(cm, row);
                    list.Add(cm);
                }
            }
            return list;
        }
        public List<Model.MedicineBox> GetListbyUserName(string userName)
        {
            string sql = "select * from MedicineBox where userName=@userName";
            SqlParameter[] pars = { new SqlParameter("@userName", SqlDbType.NVarChar) };
            pars[0].Value = userName;
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text, pars);
            List<Model.MedicineBox> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.MedicineBox>();
                Model.MedicineBox cm = null;
                foreach (DataRow row in da.Rows)
                {
                    cm = new Model.MedicineBox();
                    LoadEntity(cm, row);
                    list.Add(cm);
                }
            }
            return list;
        }
        public List<Model.MedicineBox> GetListbyLnglatUsernameBoxname(string lnglat, string userName,string boxName)
        {
            //ID, lnglat, userName, color, boxName
            string sql = "select * from MedicineBox where userName=@userName and lnglat=@lnglat and boxName=@boxName";
            SqlParameter[] pars = {
                new SqlParameter("@lnglat", SqlDbType.NVarChar),
                new SqlParameter("@userName", SqlDbType.NVarChar),
                new SqlParameter("@boxName", SqlDbType.NVarChar)
            };
            pars[0].Value = lnglat;
            pars[1].Value = userName;
            pars[2].Value = boxName;
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text, pars);
            List<Model.MedicineBox> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.MedicineBox>();
                Model.MedicineBox cm = null;
                foreach (DataRow row in da.Rows)
                {
                    cm = new Model.MedicineBox();
                    LoadEntity(cm, row);
                    list.Add(cm);
                }
            }
            return list;
        }
        public List<Model.MedicineBox> GetListbyUserNameColor(string userName,string color)
        {
            string sql = "select * from MedicineBox where userName=@userName and color=@color";
            SqlParameter[] pars = {
                new SqlParameter("@userName", SqlDbType.NVarChar),
                new SqlParameter("@color", SqlDbType.NVarChar)
            };
            pars[0].Value = userName;
            pars[1].Value = color;
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text, pars);
            List<Model.MedicineBox> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.MedicineBox>();
                Model.MedicineBox cm = null;
                foreach (DataRow row in da.Rows)
                {
                    cm = new Model.MedicineBox();
                    LoadEntity(cm, row);
                    list.Add(cm);
                }
            }
            return list;
        }
        //根据颜色返回小药箱列表
        public List<Model.MedicineBox> GetListbyColor(string color)
        {
            string sql = "select * from MedicineBox where color=@color";
            SqlParameter[] pars = {
                new SqlParameter("@color", SqlDbType.NVarChar)
            };
            pars[0].Value = color;
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text, pars);
            List<Model.MedicineBox> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.MedicineBox>();
                Model.MedicineBox cm = null;
                foreach (DataRow row in da.Rows)
                {
                    cm = new Model.MedicineBox();
                    LoadEntity(cm, row);
                    list.Add(cm);
                }
            }
            return list;
        }
        public List<Model.MedicineBox> GetListbyColor(string color, string FirstLng, string FirstLat, string BanjingMi, string Number12)
        {
            string sql = "select * from MedicineBox where color=@color";
            SqlParameter[] pars = {
                new SqlParameter("@color", SqlDbType.NVarChar)
            };
            pars[0].Value = color;
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text, pars);
            List<Model.MedicineBox> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.MedicineBox>();
                Model.MedicineBox cm = null;


                foreach (DataRow row in da.Rows)
                {
                    cm = new Model.MedicineBox();
                    LoadEntity(cm, row);
                    string dblng = cm.lnglat.Split('*')[0];
                    string dblat = cm.lnglat.Split('*')[1];
                    double dbdoublelng = 0;
                    double dbdoublelat = 0;

                    try
                    {
                        dbdoublelng = Convert.ToDouble(dblng);
                        dbdoublelat = Convert.ToDouble(dblat);
                    }
                    catch (Exception e) { continue; }
                    double caldistance = mapDistance1.GetDistance(Convert.ToDouble(FirstLat),Convert.ToDouble(FirstLng), dbdoublelat, dbdoublelng);
                    if (Number12 == "1")//半径里面
                    {
                        if (caldistance < Convert.ToDouble(BanjingMi))
                        {
                            list.Add(cm);
                        }
                    }
                    else
                    {
                        if (caldistance > Convert.ToDouble(BanjingMi))
                        {
                            list.Add(cm);
                        }
                    }
                    //list.Add(cm);
                }
            }
            return list;
        }
        //查询，根据经纬度返回小药箱
        public Model.MedicineBox GetMedicineBoxbyLnglat(string lnglat)
        {
            //ID, lnglat, userName, color, boxName
            string sql = "select * from MedicineBox where lnglat=@lnglat";
            SqlParameter[] pars = { new SqlParameter("@lnglat", SqlDbType.NVarChar) };
            pars[0].Value = lnglat;
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text, pars);
            Model.MedicineBox cm = null;
            if (da.Rows.Count > 0)
            {
                cm = new Model.MedicineBox();
                LoadEntity(cm, da.Rows[0]);
            }
            return cm;
        }        
        //增加
        public int AddMedicineBox(Model.MedicineBox cm)
        {
            List<Model.MedicineBox> mblist = GetListbyLnglatUsernameBoxname(cm.lnglat, cm.userName, cm.boxName);
            if (mblist != null)
            {
                if (mblist[0].color == cm.color)
                {
                    return 1;
                }
            }
            //ID, lnglat, userName, color, boxName
            string sql = "insert into MedicineBox(lnglat,userName,color,boxName) values(@lnglat,@userName,@color,@boxName)";
            SqlParameter[] pars = {
                 new SqlParameter("@lnglat", SqlDbType.NVarChar),
                 new SqlParameter("@userName", SqlDbType.NVarChar),
                 new SqlParameter("@color", SqlDbType.NVarChar),
                 new SqlParameter("@boxName", SqlDbType.NVarChar)
            };
            pars[0].Value = cm.lnglat;
            pars[1].Value = cm.userName;
            pars[2].Value = cm.color;
            pars[3].Value = cm.boxName;

            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);

        }
        //删除
        public int DeleteMedicineBoxbyLnglat(string lnglat)
        {
            //ID, lnglat, userName, color, boxName
            string sql = "delete from MedicineBox where lnglat=@lnglat";
            SqlParameter[] pars = { new SqlParameter("@lnglat", SqlDbType.NVarChar) };
            pars[0].Value = lnglat;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);
        }
        //删除
        public int DeleteMedicineBoxbyLnglatUserNameColor(string lnglat,string userName,string color)
        {
            //ID, lnglat, userName, color, boxName
            string sql = "delete from MedicineBox where lnglat=@lnglat and userName=@userName and color=@color";
            SqlParameter[] pars = {
                new SqlParameter("@lnglat", SqlDbType.NVarChar),
                new SqlParameter("@userName", SqlDbType.NVarChar),
                new SqlParameter("@color", SqlDbType.NVarChar)
            };
            pars[0].Value = lnglat;
            pars[1].Value = userName;
            pars[2].Value = color;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);
        }
        //根据经纬度和用户名删除小药箱
        public int DeleteMedicineBoxbyLnglatUserName(string lnglat,string userName)
        {
            //ID, lnglat, userName, color, boxName
            string sql = "delete from MedicineBox where lnglat=@lnglat and userName=@userName";
            SqlParameter[] pars = {
                new SqlParameter("@userName", SqlDbType.NVarChar),
                new SqlParameter("@lnglat", SqlDbType.NVarChar)
            };
            pars[0].Value = userName;
            pars[1].Value = lnglat;
            //SqlParameter[] pars = { new SqlParameter("@lnglat", SqlDbType.NVarChar) };
            //pars[0].Value = lnglat;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);
        }
        private void LoadEntity(Model.MedicineBox mb, DataRow row)
        {
            //ID, lnglat, userName, color, boxName
            mb.lnglat = row["lnglat"] != DBNull.Value ? row["lnglat"].ToString() : string.Empty;
            mb.userName = row["userName"] != DBNull.Value ? row["userName"].ToString() : string.Empty;
            mb.color = row["color"] != DBNull.Value ? row["color"].ToString() : string.Empty;
            mb.boxName = row["boxName"] != DBNull.Value ? row["boxName"].ToString() : string.Empty;
        }
    }
}