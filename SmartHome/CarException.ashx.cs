using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.SessionState;

namespace SmartHome
{
    /// <summary>
    /// CarException1 的摘要说明
    /// </summary>
    public class CarException1 : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";
            string name = context.Request["name"].Trim().ToString();
            if (name == "rtu2mms")
            {
                List<Model.CarException> list = new DAL.CarExceptionDAL().GetList();
                StringBuilder trs = new StringBuilder();
                if (context.Session["username"] == null)
                {
                    trs.Append("<tr><td colspan='7' style='text-align:center;font-size:10px;font-weight:bold;color:#666666;background:#efefef'>表 格 数 据 为 空！</td></tr>");
                    context.Response.Write(trs);
                    return;
                }


                if (list != null)
                {
                    for (int i = 0; i < list.Count; i++)
                    {
                        //ID, brand, name, oilConsumption, insurance, breakRules, maintain, carState
                        trs.Append("<tr>");
                        trs.Append("<td>" + list[i].brand + "</td>");
                        trs.Append("<td>" + list[i].name + "</td>");
                        trs.Append("<td>" + list[i].oilConsumption + "</td>");
                        trs.Append("<td>" + list[i].insurance + "</td>");
                        trs.Append("<td>" + list[i].breakRules + "</td>");
                        trs.Append("<td>" + list[i].maintain + "</td>");
                        trs.Append("<td style='color: red;font-weight:bold'>" + list[i].carState + "</td>");
                        trs.Append("</tr>");
                    }
                }
                else
                {
                    trs.Append("<tr><td colspan='7' style='text-align:center;font-size:10px;font-weight:bold;color:#666666;background:#efefef'>表 格 数 据 为 空！</td></tr>");
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