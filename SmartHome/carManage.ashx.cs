using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.SessionState;
using System.Web.Script.Serialization;

namespace SmartHome
{
    public enum CARSTATES
    {
        已申请 = 0,
        申请通过,
        申请不通过,
        车辆已归还
    }
    public class carInfor
    {
        public string name { get; set; }
        public string idcard { get; set; }
        public string depname { get; set; }
        public string cellphone { get; set; }
        public string fromto { get; set; }
        public string cartype { get; set; }
        public string cardate { get; set; }

    }
    /// <summary>
    /// carManage1 的摘要说明
    /// </summary>
    public class carManage1 : IHttpHandler, IRequiresSessionState
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
                    trs.Append("<tr><td colspan='8' style='text-align:center;font-size:10px;font-weight:bold;color:#666666;background:#efefef'>表 格 数 据 为 空！</td></tr>");
                    context.Response.Write(trs);
                    return;
                }


                if (list != null)
                {
                    for (int i = 0; i < list.Count; i++)
                    {
                        //ID, name, IDCard, depName, carType, dateTime, fromTo, cellPhone
                        trs.Append("<tr>");
                        trs.Append("<td>" + list[i].name + "</td>");
                        trs.Append("<td>" + list[i].IDCard + "</td>");
                        trs.Append("<td>" + list[i].depName + "</td>");
                        trs.Append("<td>" + list[i].carType + "</td>");
                        trs.Append("<td>" + list[i].dateTime + "</td>");
                        trs.Append("<td>" + list[i].fromTo + "</td>");
                        trs.Append("<td>" + list[i].cellPhone + "</td>");
                        trs.Append("<td>" + list[i].carState + "</td>");
                        //trs.Append("<td><button type='button' class='btn btn-mini btn-primary'>通过</button>");
                        //trs.Append("<button type='button' class='btn btn-mini btn-danger' style='margin-left:3px;'>拒绝</button></td>");
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
                List<Model.CarManage> temp = new DAL.CarManageDAL().GetListbyCarState(CARSTATES.申请通过.ToString());
                if (temp == null)
                {
                    for (int i = 0; i < list.Count; i++)
                    {
                        //车辆通过的不能再申请了                    
                        trs.Append("<option value='" + list[i].plateNumber + "'>" + list[i].plateNumber + "</option>");
                    }
                }
                else
                {
                    for (int i = 0; i < list.Count; i++)
                    {
                        //车辆通过的不能再申请了 
                        bool carisapplyed = false;
                        for (int j = 0; j < temp.Count; j++)
                        {
                            if (temp[j].carType == list[i].plateNumber)
                            {
                                carisapplyed = true;
                            }
                        }
                        if (carisapplyed == false)
                        {
                            trs.Append("<option value='" + list[i].plateNumber + "'>" + list[i].plateNumber + "</option>");
                        }

                    }
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
            else if (name == "newlocation")
            {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                Dictionary<string, string> kvs = new Dictionary<string, string>();
                string userName = context.Request["userName"].Trim().ToString();
                List<Model.CarManage> list = new DAL.CarManageDAL().GetListbyUserNameCarState(userName,CARSTATES.申请通过.ToString());
                if (list == null)
                {
                    kvs["err_message"] = "err_message";
                    string send = serializer.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(send);
                }
                else
                {
                    string plateNumber = list[0].carType;
                    Model.CarGPSInfors cg = new DAL.CarGPSInforsDAL().GetCarGPSInforbyPlateNumber(plateNumber);
                    if (cg == null)
                    {
                        kvs["err_message"] = "err_message";
                        string send = serializer.Serialize(kvs);
                        context.Response.ContentType = "text/plain";
                        context.Response.Write(send);
                    }
                    else
                    {
                        Model.GPSIMEI gi = new DAL.GPSIMEIDAL().GetLastByIMEI(cg.IMEI);
                        if (gi == null)
                        {
                            kvs["err_message"] = "err_message";
                            string send = serializer.Serialize(kvs);
                            context.Response.ContentType = "text/plain";
                            context.Response.Write(send);
                        }
                        else
                        {
                            string lng = gi.Longitude;
                            string lat = gi.Latitude;
                            kvs["lnglat"] = lng+"*"+lat;
                            string send = serializer.Serialize(kvs);
                            context.Response.ContentType = "text/plain";
                            context.Response.Write(send);
                        }
                    }

                }
            }
            else if (name == "addcm")
            {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                Dictionary<string, string> kvs = new Dictionary<string, string>();
                Model.CarManage cm = new Model.CarManage();
                //在carorderlist数据库新增记录---------------------------------
                Model.CarOrderList col = new Model.CarOrderList();
                ////ID, loginUser, name, carPlateNumber, carUseTime, fromTo, IDCard, depName, cellPhone, carState, bossUser, dateTime
                col.loginUser = context.Request["userName"];
                col.name = context.Request["name1"];
                col.carPlateNumber = context.Request["cartype"];
                col.carUseTime = context.Request["cardate"];
                col.fromTo = context.Request["fromto"];
                col.IDCard = context.Request["idcard"];
                col.depName = context.Request["depname"];
                col.cellPhone = context.Request["cellphone"];
                col.carState = CARSTATES.已申请.ToString();
                col.bossUser = bossUserByPlateNumber(col.carPlateNumber);
                col.dateTime = DateTime.Now.ToString();
                new DAL.CarOrderListDAL().AddCarOrderList(col);
                //-------------------------------------------------------------

                cm.name = context.Request["name1"];
                cm.IDCard = context.Request["idcard"];
                cm.depName = context.Request["depname"];
                cm.carType = context.Request["cartype"];
                cm.dateTime = context.Request["cardate"];
                cm.fromTo = context.Request["fromto"];
                cm.cellPhone = context.Request["cellphone"];
                cm.userName = context.Request["userName"];
                //cm.carState = "已申请";//申请通过 申请不通过 车辆已归还 已申请
                cm.carState = CARSTATES.已申请.ToString();//申请通过 申请不通过 车辆已归还 已申请

                if (new DAL.CarManageDAL().GetCarManagebyName(cm.name) != null)
                {
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
                else
                {
                    if (new DAL.CarManageDAL().AddCarManage(cm) != -1)
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
            else
            {
                List<Model.CarManage> cm = new DAL.CarManageDAL().GetList();
                carInfor carinfor = new carInfor();
                Boolean isExist = false;
                JavaScriptSerializer jss = new JavaScriptSerializer();

                if (cm != null)
                {
                    for (int i = 0; i < cm.Count; i++)
                    {
                        if (name == cm[i].name)
                        {
                            carinfor.name = cm[i].name;
                            carinfor.idcard = cm[i].IDCard;
                            carinfor.depname = cm[i].depName;
                            carinfor.cellphone = cm[i].cellPhone;
                            carinfor.fromto = cm[i].fromTo;
                            if (cm[i].carState == CARSTATES.申请通过.ToString())
                            {
                                //carinfor.cartype = "-";
                                carinfor.cartype = "";
                            }
                            else
                            {
                                carinfor.cartype = cm[i].carType;
                            }

                            carinfor.cardate = cm[i].dateTime;
                            isExist = true;
                        }
                    }
                }
                if (isExist == false)
                {
                    List<Model.PersonManage> pm = new DAL.PersonManageDAL().GetList();
                    for (int i = 0; i < pm.Count; i++)
                    {
                        if (name == pm[i].name)
                        {
                            carinfor.name = pm[i].name;
                            carinfor.idcard = pm[i].IDCard;
                            carinfor.cellphone = pm[i].phoneNumber;
                            carinfor.depname = pm[i].depID;
                            carinfor.fromto = "-";
                            carinfor.cartype = "";
                            carinfor.cardate = "";

                        }
                    }
                }
                string send = jss.Serialize(carinfor);
                context.Response.Write(send);

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