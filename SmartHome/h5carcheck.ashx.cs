using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.SessionState;
using System.Web.Script.Serialization;

namespace SmartHome
{
    /// <summary>
    /// h5carcheck1 的摘要说明
    /// </summary>
    public class h5carcheck1 : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";
            string name = context.Request["name"].Trim().ToString();
            if (name == "userList")
            {

                List<Model.CarManage> list = new DAL.CarManageDAL().GetList();
                StringBuilder trs = new StringBuilder();
                if (list == null)
                {
                    trs.Append("<option value='nodata'>空数据</option>");
                    context.Response.Write(trs);
                    return;
                }
                //List<Model.CarManage> temp = new DAL.CarManageDAL().GetListbyCarState(CARSTATES.车辆已归还.ToString());
                for (int i = 0; i < list.Count; i++)
                {
                    if (list[i].carState == CARSTATES.车辆已归还.ToString())
                    {
                        continue;
                    }
                    trs.Append("<option value='" + list[i].name + "'>" + list[i].name + "</option>");
                }

                context.Response.Write(trs);
            }
            else if (name == "carList")
            {
                List<Model.CarGPSInfors> list = new DAL.CarGPSInforsDAL().GetList();
                StringBuilder trs = new StringBuilder();
                if (list == null)
                {
                    trs.Append("<option value='nodata'>空数据</option>");
                    context.Response.Write(trs);
                    return;
                }
                for (int i = 0; i < list.Count; i++)
                {
                    trs.Append("<option value='" + list[i].plateNumber + "'>" + list[i].plateNumber + "</option>");
                }
                context.Response.Write(trs);
            }
            else
            {
                List<Model.CarManage> cmlist = new DAL.CarManageDAL().GetList();
                JavaScriptSerializer jss = new JavaScriptSerializer();
                for (int i = 0; i < cmlist.Count; i++)
                {
                    if (name == cmlist[i].name)
                    {
                        string send = jss.Serialize(cmlist[i]);
                        context.Response.Write(send);
                    }
                }
            }
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}