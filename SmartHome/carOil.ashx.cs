using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.SessionState;
using System.Web.Script.Serialization;

namespace SmartHome
{
    /// <summary>
    /// carOil1 的摘要说明
    /// </summary>
    public class carOil1 : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";
            string name = context.Request["name"].Trim().ToString();
            if (name == "rtu2mms")
            {
                List<Model.CarOil> list = new DAL.CarOilDAL().GetList();
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
                        //ID, dateTime, plateNumber, runMiles, oilNumber, oilCapacity, cost, oilStation
                        trs.Append("<tr>");
                        trs.Append("<td>" + list[i].dateTime + "</td>");
                        trs.Append("<td>" + list[i].plateNumber + "</td>");
                        trs.Append("<td>" + list[i].runMiles + "</td>");
                        trs.Append("<td>" + list[i].oilNumber + "</td>");
                        trs.Append("<td>" + list[i].oilCapacity + "</td>");
                        trs.Append("<td>" + list[i].cost + "</td>");
                        trs.Append("<td>" + list[i].oilStation + "</td>");
                        trs.Append("</tr>");
                    }
                }
                else
                {
                    trs.Append("<tr><td colspan='7' style='text-align:center;font-size:10px;font-weight:bold;color:#666666;background:#efefef'>表 格 数 据 为 空！</td></tr>");
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
            //else if (name == "userList")
            //{
            //    List<Model.PersonManage> list = new DAL.PersonManageDAL().GetList();
            //    StringBuilder trs = new StringBuilder();
            //    if (list == null)
            //    {
            //        trs.Append("<option value='nodata'>空数据</option>");
            //        context.Response.Write(trs);
            //        return;
            //    }
            //    for (int i = 0; i < list.Count; i++)
            //    {
            //        trs.Append("<option value='" + list[i].name + "'>" + list[i].name + "</option>");
            //    }
            //    context.Response.Write(trs);
            //}
            else if (name == "addcm")
            {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                Dictionary<string, string> kvs = new Dictionary<string, string>();
                Model.CarOil cm = new Model.CarOil();
                //ID, dateTime, plateNumber, runMiles, oilNumber, oilCapacity, cost, oilStation
                cm.plateNumber = context.Request["plateNumber"];
                cm.runMiles = context.Request["runMiles"];
                cm.dateTime = DateTime.Now.ToString();
                cm.oilNumber = context.Request["oilNumber"];
                cm.oilCapacity = context.Request["oilCapacity"];
                cm.cost = context.Request["cost"];
                cm.oilStation = context.Request["oilStation"];


                if (new DAL.CarOilDAL().AddCarOil(cm) != -1)
                {
                    kvs["success"] = "success";
                    string send = serializer.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(send);
                }
                else
                {
                    kvs["err_message"] = "err_message";
                    string send = serializer.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(send);
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