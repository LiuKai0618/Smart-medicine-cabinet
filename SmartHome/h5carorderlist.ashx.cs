using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.SessionState;

namespace SmartHome
{
    /// <summary>
    /// h5carorderlist1 的摘要说明
    /// </summary>
    public class h5carorderlist1 : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";
            string name = context.Request["name"].Trim().ToString();　　　　　　//接收前台传过来的参数
            if (name != null) 
            {
                List<Model.CarOrderList> list1 = new DAL.CarOrderListDAL().GetListbyLoginUser(name);
                StringBuilder trs = new StringBuilder();
                if (list1 == null)
                {
                    trs.Append("<tr><td colspan='7' style='text-align:center;font-size:10px;font-weight:bold;color:#666666;background:#efefef'>表 格 数 据 为 空！</td></tr>");
                    context.Response.Write(trs);
                    return;
                }
                List<Model.CarOrderList> list = new DAL.CarOrderListDAL().GetListbyPlateNumber(list1[0].carPlateNumber);
                if (list == null)
                {
                    trs.Append("<tr><td colspan='7' style='text-align:center;font-size:10px;font-weight:bold;color:#666666;background:#efefef'>表 格 数 据 为 空！</td></tr>");
                    context.Response.Write(trs);
                    return;
                }
                if (context.Session["username"] == null)
                {
                    trs.Append("<tr><td colspan='7' style='text-align:center;font-size:10px;font-weight:bold;color:#666666;background:#efefef'>表 格 数 据 为 空！</td></tr>");
                    context.Response.Write(trs);
                    return;
                }
                for (int i = 0; i < list.Count; i++)
                {
                    
                    trs.Append("<tr>");
                    trs.Append("<td>" + list[i].loginUser + "</td>");
                    trs.Append("<td>" + list[i].name + "</td>");
                    trs.Append("<td>" + list[i].carPlateNumber + "</td>");
                    trs.Append("<td>" + list[i].carUseTime + "</td>");
                    trs.Append("<td>" + list[i].fromTo + "</td>");
                    trs.Append("<td>" + list[i].carState + "</td>");
                    trs.Append("<td>" + list[i].dateTime + "</td>");
                    trs.Append("</tr>");


                }



                context.Response.Write(trs);
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