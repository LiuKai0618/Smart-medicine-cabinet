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
    /// carMaintain1 的摘要说明
    /// </summary>
    public class carMaintain1 : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";
            string name = context.Request["name"].Trim().ToString();　　　　　　
            if (name == "rtu2mms")
            {
                List<Model.CarMaintain> list = new DAL.CarMaintainDAL().GetList();
                StringBuilder trs = new StringBuilder();
                if (context.Session["username"] == null)
                {
                    trs.Append("<tr><td colspan='8' style='text-align:center;font-size:10px;font-weight:bold;color:#666666;background:#efefef'>表 格 数 据 为 空！</td></tr>");
                    context.Response.Write(trs);
                    return;
                }
               

                if (list != null)
                {
                    for (int i = 0; i < list.Count; i++)
                    {
                        //ID, brand, driver, dateTime, maintainDep, maintainItem, orderNumber, cost, carState
                        trs.Append("<tr>");
                        trs.Append("<td>" + list[i].brand + "</td>");
                        trs.Append("<td>" + list[i].driver + "</td>");
                        trs.Append("<td>" + list[i].dateTime + "</td>");
                        trs.Append("<td>" + list[i].maintainDep + "</td>");
                        trs.Append("<td>" + list[i].maintainItem + "</td>");
                        trs.Append("<td>" + list[i].orderNumber + "</td>");
                        trs.Append("<td>" + list[i].cost + "</td>");
                        trs.Append("<td>" + list[i].carState + "</td>");
                        trs.Append("</tr>");
                    }
                }
                else
                {
                    trs.Append("<tr><td colspan='8' style='text-align:center;font-size:10px;font-weight:bold;color:#666666;background:#efefef'>表 格 数 据 为 空！</td></tr>");
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
            else if (name == "userList")
            {
                List<Model.PersonManage> list = new DAL.PersonManageDAL().GetList();
                StringBuilder trs = new StringBuilder();
                if (list == null)
                {
                    trs.Append("<option value='nodata'>空数据</option>");
                    context.Response.Write(trs);
                    return;
                }
                for (int i = 0; i < list.Count; i++)
                {
                    trs.Append("<option value='" + list[i].name + "'>" + list[i].name + "</option>");
                }
                context.Response.Write(trs);
            }
            else if (name == "addcm")
            {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                Dictionary<string, string> kvs = new Dictionary<string, string>();
                Model.CarMaintain cm = new Model.CarMaintain();
                //ID, brand, driver, dateTime, maintainDep, maintainItem, orderNumber, cost, carState
                cm.brand = context.Request["addBrand"];
                cm.driver = context.Request["addDriver"];
                cm.dateTime = DateTime.Now.ToString();
                cm.maintainDep = context.Request["addMaintainDep"];
                cm.maintainItem = context.Request["addMaintainItem"];
                cm.orderNumber = context.Request["addOrderNumber"];
                cm.cost = context.Request["addCost"];
                cm.carState = context.Request["addCarState"];


                if (new DAL.CarMaintainDAL().AddCarMaintain(cm) != -1)
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
                //addBrand,addDriver,addMaintainDep,addMaintainItem,addOrderNumber,addCost,addCarState
                //cm.name = context.Request["name1"];
                //cm.IDCard = context.Request["idcard"];
                //cm.depName = context.Request["depname"];
                //cm.carType = context.Request["cartype"];
                //cm.dateTime = context.Request["cardate"];
                //cm.fromTo = context.Request["fromto"];
                //cm.cellPhone = context.Request["cellphone"];
                //cm.carState = "已申请";

                //if (new DAL.CarManageDAL().GetCarManagebyName(cm.name) != null)
                //{
                //    if (new DAL.CarManageDAL().EditCarManage(cm) != -1)
                //    {
                //        kvs["success"] = "success";
                //        string send = serializer.Serialize(kvs);
                //        context.Response.ContentType = "text/plain";
                //        context.Response.Write(send);
                //    }
                //    else
                //    {
                //        kvs["err_message"] = "err_message";
                //        string send = serializer.Serialize(kvs);
                //        context.Response.ContentType = "text/plain";
                //        context.Response.Write(send);

                //    }
                //}
                //else
                //{
                //    if (new DAL.CarManageDAL().AddCarManage(cm) != -1)
                //    {
                //        kvs["success"] = "success";
                //        string send = serializer.Serialize(kvs);
                //        context.Response.ContentType = "text/plain";
                //        context.Response.Write(send);
                //    }
                //    else
                //    {
                //        kvs["err_message"] = "err_message";
                //        string send = serializer.Serialize(kvs);
                //        context.Response.ContentType = "text/plain";
                //        context.Response.Write(send);
                //    }
                //}

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