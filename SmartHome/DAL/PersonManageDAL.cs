using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace SmartHome.DAL
{
    public class PersonManageDAL
    {
        //ID, name, sex, IDCard, depID, phoneNumber, jobPosition, education, isCertificated, registeredResidence
        public List<Model.PersonManage> GetList()
        {
            string sql = "select * from PersonManage";
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text);
            List<Model.PersonManage> list = null;
            if (da.Rows.Count > 0)
            {
                list = new List<Model.PersonManage>();
                Model.PersonManage user = null;
                foreach (DataRow row in da.Rows)
                {
                    user = new Model.PersonManage();
                    LoadEntity(user, row);
                    list.Add(user);
                }
            }
            return list;
        }
        //查询
        public Model.PersonManage GetPersonbyIDCard(string IDCard)
        {
            //ID, name, sex, IDCard, depID, phoneNumber, jobPosition, education, isCertificated, registeredResidence
            string sql = "select * from PersonManage where IDCard=@IDCard";
            SqlParameter[] pars = { new SqlParameter("@IDCard", SqlDbType.NVarChar) };
            pars[0].Value = IDCard;
            DataTable da = SqlHelper.getDataTable(sql, CommandType.Text, pars);
            Model.PersonManage user = null;
            if (da.Rows.Count > 0)
            {
                user = new Model.PersonManage();
                LoadEntity(user, da.Rows[0]);
            }
            return user;
        }
        //删除
        public int DeletePersonbyIDCard(string IDCard)
        {
            //首先要删除userrtu下的该用户的所有信息
            //if (new DAL.UserRTUDAL().DeleteUserRTU(userName) == -1)
            //{
            //    return -1;
            //}
            //ID, name, sex, IDCard, depID, phoneNumber, jobPosition, education, isCertificated, registeredResidence
            string sql = "delete from PersonManage where IDCard=@IDCard";
            SqlParameter[] pars = { new SqlParameter("@IDCard", SqlDbType.NVarChar) };
            pars[0].Value = IDCard;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);
        }
        //修改
        public int EditPerson(Model.PersonManage user)
        {
            //ID, name, sex, IDCard, depID, phoneNumber, jobPosition, education, isCertificated, registeredResidence
            string sql = "update PersonManage set name=@name,sex=@sex,depID=@depID,phoneNumber=@phoneNumber,jobPosition=@jobPosition,education=@education,isCertificated=@isCertificated,registeredResidence=@registeredResidence where IDCard=@IDCard";
            SqlParameter[] pars = {
                new SqlParameter("@name", SqlDbType.NVarChar),
                new SqlParameter("@sex", SqlDbType.NVarChar),
                new SqlParameter("@depID", SqlDbType.NVarChar),
                new SqlParameter("@phoneNumber", SqlDbType.NVarChar),
                new SqlParameter("@jobPosition", SqlDbType.NVarChar),
                new SqlParameter("@education", SqlDbType.NVarChar),
                new SqlParameter("@isCertificated", SqlDbType.NVarChar),
                new SqlParameter("@registeredResidence", SqlDbType.NVarChar),
                new SqlParameter("@IDCard", SqlDbType.NVarChar)
            };
            pars[0].Value = user.name;
            pars[1].Value = user.sex;
            pars[2].Value = user.depID;
            pars[3].Value = user.phoneNumber;
            pars[4].Value = user.jobPosition;
            pars[5].Value = user.education;
            pars[6].Value = user.isCertificated;
            pars[7].Value = user.registeredResidence;
            pars[8].Value = user.IDCard;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);
        }
        //增加
        public int AddPerson(Model.PersonManage user)
        {
            //ID, name, sex, IDCard, depID, phoneNumber, jobPosition, education, isCertificated, registeredResidence
            string sql = "insert into PersonManage(name, sex, IDCard, depID, phoneNumber, jobPosition, education, isCertificated, registeredResidence) values(@name, @sex, @IDCard, @depID, @phoneNumber, @jobPosition, @education, @isCertificated, @registeredResidence)";
            SqlParameter[] pars = {
                new SqlParameter("@name", SqlDbType.NVarChar),
                new SqlParameter("@sex", SqlDbType.NVarChar),
                new SqlParameter("@IDCard", SqlDbType.NVarChar),
                new SqlParameter("@depID", SqlDbType.NVarChar),
                new SqlParameter("@phoneNumber", SqlDbType.NVarChar),
                new SqlParameter("@jobPosition", SqlDbType.NVarChar),
                new SqlParameter("@education", SqlDbType.NVarChar),
                new SqlParameter("@isCertificated", SqlDbType.NVarChar),
                new SqlParameter("@registeredResidence", SqlDbType.NVarChar)
            };
            pars[0].Value = user.name;
            pars[1].Value = user.sex;
            pars[2].Value = user.IDCard;
            pars[3].Value = user.depID;
            pars[4].Value = user.phoneNumber;
            pars[5].Value = user.jobPosition;
            pars[6].Value = user.education;
            pars[7].Value = user.isCertificated;
            pars[8].Value = user.registeredResidence;
            return SqlHelper.ExecuteNonquery(sql, CommandType.Text, pars);

        }
        private void LoadEntity(Model.PersonManage user, DataRow row)
        {
            //ID, name, sex, IDCard, depID, phoneNumber, jobPosition, education, isCertificated, registeredResidence
            user.name = row["name"] != DBNull.Value ? row["name"].ToString() : string.Empty;
            user.sex = row["sex"] != DBNull.Value ? row["sex"].ToString() : string.Empty;
            user.IDCard = row["IDCard"] != DBNull.Value ? row["IDCard"].ToString() : string.Empty;
            user.depID = row["depID"] != DBNull.Value ? row["depID"].ToString() : string.Empty;
            user.phoneNumber = row["phoneNumber"] != DBNull.Value ? row["phoneNumber"].ToString() : string.Empty;
            user.jobPosition = row["jobPosition"] != DBNull.Value ? row["jobPosition"].ToString() : string.Empty;
            user.education = row["education"] != DBNull.Value ? row["education"].ToString() : string.Empty;
            user.isCertificated = row["isCertificated"] != DBNull.Value ? row["isCertificated"].ToString() : string.Empty;
            user.registeredResidence = row["registeredResidence"] != DBNull.Value ? row["registeredResidence"].ToString() : string.Empty;
        }
    }
}