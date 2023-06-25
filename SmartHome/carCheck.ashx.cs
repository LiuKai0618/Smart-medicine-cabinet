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
    /// carCheck1 的摘要说明
    /// </summary>
    public class carCheck1 : IHttpHandler, IRequiresSessionState
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
                List<Model.CarManage> list = new DAL.CarManageDAL().GetList();
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
                        //如果车辆状态为车辆已归还，无需审批
                        //ID, name, IDCard, depName, carType, dateTime, fromTo, cellPhone
                        if (list[i].carState == CARSTATES.车辆已归还.ToString())
                        {
                            continue;
                        }
                        trs.Append("<tr>");
                        trs.Append("<td>" + list[i].name + "</td>");
                        trs.Append("<td>" + list[i].IDCard + "</td>");
                        trs.Append("<td>" + list[i].depName + "</td>");
                        trs.Append("<td>" + list[i].carType + "</td>");
                        trs.Append("<td>" + list[i].dateTime + "</td>");
                        trs.Append("<td>" + list[i].fromTo + "</td>");
                        trs.Append("<td>" + list[i].cellPhone + "</td>");
                        trs.Append("<td>" + list[i].carState + "</td>");
                        trs.Append("<td><button type='button' class='btn btn-mini btn-primary'>通过</button>");
                        trs.Append("<button type='button' class='btn btn-mini btn-danger' style='margin-left:3px;'>拒绝</button></td>");
                        trs.Append("</tr>");
                    }
                }
                else
                {
                    trs.Append("<tr><td colspan='8' style='text-align:center;font-size:10px;font-weight:bold;color:#666666;background:#efefef'>表 格 数 据 为 空！</td></tr>");
                }
                context.Response.Write(trs);
            }
            else
            {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                Dictionary<string, string> kvs = new Dictionary<string, string>();
                string action = context.Request["action"].Trim().ToString();//
                string loginUser = context.Request["loginUser"].Trim().ToString();//登录用户名
                Model.CarManage cm = new DAL.CarManageDAL().GetCarManagebyName(name);
                if (action == "pass")
                {
                    //cm.carState = "申请通过";
                    cm.carState = CARSTATES.申请通过.ToString();
                }
                else if (action == "reject")
                {
                    //cm.carState = "申请不通过";
                    cm.carState = CARSTATES.申请不通过.ToString();
                }
                //在carorderlist数据库新增记录---------------------------------
                Model.CarOrderList col = new Model.CarOrderList();
                ////ID, loginUser, name, carPlateNumber, carUseTime, fromTo, IDCard, depName, cellPhone, carState, bossUser, dateTime
                col.loginUser = loginUser;
                col.name = name;
                col.carPlateNumber = cm.carType;
                col.carUseTime = cm.dateTime;
                col.fromTo = cm.fromTo;
                col.IDCard = cm.IDCard;
                col.depName = cm.depName;
                col.cellPhone = cm.cellPhone;
                col.carState = cm.carState;
                col.bossUser = bossUserByPlateNumber(cm.carType);
                col.dateTime = DateTime.Now.ToString();
                new DAL.CarOrderListDAL().AddCarOrderList(col);
                //-------------------------------------------------------------



                if (new DAL.CarManageDAL().EditCarManage(cm) != -1)
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