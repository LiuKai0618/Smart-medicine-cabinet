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
    /// carReturn1 的摘要说明
    /// </summary>
    public class carReturn1 : IHttpHandler, IRequiresSessionState
    {
        public static string bossUserByPlateNumber(string imei)
        {
            if (imei == "蒙E9390B")
            {
                return "xlsq022";
            }
            else if (imei == "蒙E7560P")
            {
                return "trg008";
            }
            else if (imei == "蒙EFQ920")
            {
                return "sd003";
            }
            else if (imei == "蒙E1759P")
            {
                return "xbl011";
            }
            else if (imei == "鲁A66666")
            {
                return "sa";
            }
            else if (imei == "蒙E0373F")
            {
                return "bytl001";
            }
            else if (imei == "蒙E1795P")
            {
                return "cg001";
            }
            else if (imei == "蒙E2338M")
            {
                return "hdg001";
            }
            else if (imei == "蒙E2809N")
            {
                return "jsm001";
            }
            else if (imei == "蒙E2750N")
            {
                return "brt";
            }
            else if (imei == "蒙EHD909")
            {
                return "wsm001";
            }
            else
            {
                return "user1";
            }
        }

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";
            string name = context.Request["name"].Trim().ToString();
            if (name == "rtu2mms")
            {
                List<Model.CarReturn> list = new DAL.CarReturnDAL().GetList();
                StringBuilder trs = new StringBuilder();
                if (context.Session["username"] == null)
                {
                    trs.Append("<tr><td colspan='9' style='text-align:center;font-size:10px;font-weight:bold;color:#666666;background:#efefef'>表 格 数 据 为 空！</td></tr>");
                    context.Response.Write(trs);
                    return;
                }


                if (list != null)
                {
                    for (int i = 0; i < list.Count; i++)
                    {
                        //ID, name, IDCard, depName, carType, dateTime, fromTo, cellPhone, cost, runMiles
                        trs.Append("<tr>");
                        trs.Append("<td>" + list[i].name + "</td>");
                        trs.Append("<td>" + list[i].IDCard + "</td>");
                        trs.Append("<td>" + list[i].depName + "</td>");
                        trs.Append("<td>" + list[i].carType + "</td>");
                        trs.Append("<td>" + list[i].dateTime + "</td>");
                        trs.Append("<td>" + list[i].fromTo + "</td>");
                        trs.Append("<td>" + list[i].cellPhone + "</td>");
                        trs.Append("<td>" + list[i].cost + "</td>");
                        trs.Append("<td>" + list[i].runMiles + "</td>");
                        trs.Append("</tr>");
                    }
                }
                else
                {
                    trs.Append("<tr><td colspan='9' style='text-align:center;font-size:10px;font-weight:bold;color:#666666;background:#efefef'>表 格 数 据 为 空！</td></tr>");
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
                List<Model.CarManage> list = new DAL.CarManageDAL().GetList();
                StringBuilder trs = new StringBuilder();
                if (list == null)
                {
                    trs.Append("<option value='nodata'>空数据</option>");
                    context.Response.Write(trs);
                    return;
                }
                for (int i = 0; i < list.Count; i++)
                {
                    //if (list[i].carState == "申请通过")
                    if (list[i].carState == CARSTATES.申请通过.ToString())
                    {
                        trs.Append("<option value='" + list[i].name + "'>" + list[i].name + "</option>");
                    }
                    
                }
                context.Response.Write(trs);
            }
            else if (name == "addcm")
            {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                Dictionary<string, string> kvs = new Dictionary<string, string>();
                Model.CarReturn cm = new Model.CarReturn();
                ////ID, name1, IDCard, depName, carType, dateTime, fromTo, cellPhone, cost, runMiles
                cm.name = context.Request["name1"];
                cm.IDCard = context.Request["IDCard"];
                cm.depName = context.Request["depName"];
                cm.carType = context.Request["carType"];
                cm.dateTime = context.Request["dateTime"];
                cm.fromTo = context.Request["fromTo"];
                cm.cellPhone = context.Request["cellPhone"];
                cm.cost = context.Request["cost"];
                cm.runMiles = context.Request["runMiles"];
                if (new DAL.CarReturnDAL().AddCarReturn(cm) != -1)
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
                //修改用车申请里面的车辆状态为“车辆已归还”已申请，申请通过，申请不通过
                Model.CarManage carmanage = new DAL.CarManageDAL().GetCarManagebyName(cm.name);
                //carmanage.carState = "车辆已归还";
                carmanage.carState = CARSTATES.车辆已归还.ToString();
                new DAL.CarManageDAL().EditCarManage(carmanage);

                //-------------------------------------------------------------
                //在carorderlist数据库新增记录-----------------------------------------------------------------------
                string loginUser = context.Request["loginUser"].Trim().ToString();//登录用户名

                Model.CarOrderList col = new Model.CarOrderList();
                ////ID, loginUser, name, carPlateNumber, carUseTime, fromTo, IDCard, depName, cellPhone, carState, bossUser, dateTime
                col.loginUser = loginUser;
                col.name = cm.name;
                col.carPlateNumber = cm.carType;
                col.carUseTime = cm.dateTime;
                col.fromTo = cm.fromTo;
                col.IDCard = cm.IDCard;
                col.depName = cm.depName;
                col.cellPhone = cm.cellPhone;
                col.carState = CARSTATES.车辆已归还.ToString();
                col.bossUser = bossUserByPlateNumber(cm.carType);
                col.dateTime = DateTime.Now.ToString();
                new DAL.CarOrderListDAL().AddCarOrderList(col);
                //---------------------------------------------------------------------------------------------------------------


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
            else
            {
                List<Model.CarManage> cm = new DAL.CarManageDAL().GetList();
                //carInfor carinfor = new carInfor();
                //Boolean isExist = false;
                JavaScriptSerializer jss = new JavaScriptSerializer();
                for (int i = 0; i < cm.Count; i++)
                {
                    if (name == cm[i].name)
                    {
                        string send = jss.Serialize(cm[i]);
                        context.Response.Write(send);
                    }
                }
                //if (cm != null)
                //{
                //    for (int i = 0; i < cm.Count; i++)
                //    {
                //        if (name == cm[i].name)
                //        {
                //            carinfor.name = cm[i].name;
                //            carinfor.idcard = cm[i].IDCard;
                //            carinfor.depname = cm[i].depName;
                //            carinfor.cellphone = cm[i].cellPhone;
                //            carinfor.fromto = cm[i].fromTo;
                //            carinfor.cartype = cm[i].carType;
                //            carinfor.cardate = cm[i].dateTime;
                //            isExist = true;
                //        }
                //    }
                //}
                //if (isExist == false)
                //{
                //    List<Model.PersonManage> pm = new DAL.PersonManageDAL().GetList();
                //    for (int i = 0; i < pm.Count; i++)
                //    {
                //        if (name == pm[i].name)
                //        {
                //            carinfor.name = pm[i].name;
                //            carinfor.idcard = pm[i].IDCard;
                //            carinfor.cellphone = pm[i].phoneNumber;
                //            carinfor.depname = pm[i].depID;
                //            carinfor.fromto = "-";
                //            carinfor.cartype = "";
                //            carinfor.cardate = "";

                //        }
                //    }
                //}
                //string send = jss.Serialize(carinfor);
                //context.Response.Write(send);

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