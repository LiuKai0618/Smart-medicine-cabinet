using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace SmartHome.DAL
{
    public class DepManageDAL
    {
        //ID, depID, depParentID, depName, depHeader, depPhone, remark
        public List<Model.DepManage> GetList()
        {
            string sql = "select * from DepManage";
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text);
            List<Model.DepManage> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.DepManage>();
                Model.DepManage dep = null;
                foreach (DataRow row in da.Rows)
                {
                    dep = new Model.DepManage();
                    LoadEntity(dep, row);
                    list.Add(dep);
                }
            }
            return list;
        }
        //查询
        public Model.DepManage GetDepbyDepID(string depID)
        {
            //ID, depID, depParentID, depName, depHeader, depPhone, remark
            string sql = "select * from DepManage where depID=@depID";
            SqlParameter[] pars = { new SqlParameter("@depID", SqlDbType.NVarChar) };
            pars[0].Value = depID;
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text, pars);
            Model.DepManage dep = null;
            if (da.Rows.Count > 0)
            {
                dep = new Model.DepManage();
                LoadEntity(dep, da.Rows[0]);
            }
            return dep;
        }
        //删除
        public int DeleteDepbyDepID(string depID)
        {
            //ID, depID, depParentID, depName, depHeader, depPhone, remark
            string sql = "delete from DepManage where depID=@depID";
            SqlParameter[] pars = { new SqlParameter("@depID", SqlDbType.NVarChar) };
            pars[0].Value = depID;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);
        }
        //修改
        public int EditDep(Model.DepManage dep)
        {
            //ID, depID, depParentID, depName, depHeader, depPhone, remark
            string sql = "update DepManage set depParentID=@depParentID,depName=@depName,depHeader=@depHeader,depPhone=@depPhone,remark=@remark where depID=@depID";
            SqlParameter[] pars = {
                new SqlParameter("@depParentID", SqlDbType.NVarChar),
                new SqlParameter("@depName", SqlDbType.NVarChar),
                new SqlParameter("@depHeader", SqlDbType.NVarChar),
                new SqlParameter("@depPhone", SqlDbType.NVarChar),
                new SqlParameter("@remark", SqlDbType.NVarChar),
                new SqlParameter("@depID", SqlDbType.NVarChar)
            };
            pars[0].Value = dep.depParentID;
            pars[1].Value = dep.depName;
            pars[2].Value = dep.depHeader;
            pars[3].Value = dep.depPhone;
            pars[4].Value = dep.remark;
            pars[5].Value = dep.depID;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);
        }
        //增加
        public int AddDep(Model.DepManage dep)
        {
            //ID, depID, depParentID, depName, depHeader, depPhone, remark
            string sql = "insert into DepManage(depParentID, depName, depHeader, depPhone, remark,depID) values(@depParentID, @depName, @depHeader, @depPhone, @remark,@depID)";
            SqlParameter[] pars = {
                new SqlParameter("@depParentID", SqlDbType.NVarChar),
                new SqlParameter("@depName", SqlDbType.NVarChar),
                new SqlParameter("@depHeader", SqlDbType.NVarChar),
                new SqlParameter("@depPhone", SqlDbType.NVarChar),
                new SqlParameter("@remark", SqlDbType.NVarChar),
                new SqlParameter("@depID", SqlDbType.NVarChar)
            };
            pars[0].Value = dep.depParentID;
            pars[1].Value = dep.depName;
            pars[2].Value = dep.depHeader;
            pars[3].Value = dep.depPhone;
            pars[4].Value = dep.remark;
            pars[5].Value = dep.depID;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);

        }
        private void LoadEntity(Model.DepManage dep, DataRow row)
        {
            //ID, depID, depParentID, depName, depHeader, depPhone, remark
            dep.depID = row["depID"] != DBNull.Value ? row["depID"].ToString() : string.Empty;
            dep.depParentID = row["depParentID"] != DBNull.Value ? row["depParentID"].ToString() : string.Empty;
            dep.depName = row["depName"] != DBNull.Value ? row["depName"].ToString() : string.Empty;
            dep.depID = row["depID"] != DBNull.Value ? row["depID"].ToString() : string.Empty;
            dep.depHeader = row["depHeader"] != DBNull.Value ? row["depHeader"].ToString() : string.Empty;
            dep.depPhone = row["depPhone"] != DBNull.Value ? row["depPhone"].ToString() : string.Empty;
            dep.remark = row["remark"] != DBNull.Value ? row["remark"].ToString() : string.Empty;
        }
    }
}