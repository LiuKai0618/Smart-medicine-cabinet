using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.Script.Serialization;

namespace SmartHome
{
    /// <summary>
    /// mbManage1 的摘要说明
    /// </summary>
    public class mbManage1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            Dictionary<string, string> mbcolordic = new Dictionary<string, string>();
            mbcolordic.Add("blue", "老年人");
            mbcolordic.Add("red", "高血压");
            mbcolordic.Add("green", "糖尿病");
            mbcolordic.Add("pink", "孕产妇");
            mbcolordic.Add("orange", "婴幼儿");
            mbcolordic.Add("yellow", "结核");
            mbcolordic.Add("purple", "严重精神障碍");
            mbcolordic.Add("white", "一般人群");

            string action = context.Request["action"].Trim().ToString();
            context.Response.ContentType = "text/html";

            if (action == "mbInfor")
            {
                //ID, name, sex, IDCard, depID, phoneNumber, jobPosition, education, isCertificated, registeredResidence
                List<Model.MedicineBox> list = new DAL.MedicineBoxDAL().GetList();
                StringBuilder trs = new StringBuilder();
                if (list == null)
                {
                    trs.Append("<tr><td colspan='10' style='text-align:center;font-size:10px;font-weight:bold;color:#666666;background:#efefef'>表 格 数 据 为 空！</td></tr>");
                    context.Response.Write(trs);
                }
                else if (list.Count == 0)
                {
                    trs.Append("<tr><td colspan='10' style='text-align:center;font-size:10px;font-weight:bold;color:#666666;background:#efefef'>表 格 数 据 为 空！</td></tr>");
                    context.Response.Write(trs);
                }
                else
                {
                    for (int i = 0; i < list.Count; i++)
                    {
                        //ID, name, sex, IDCard, depID, phoneNumber, jobPosition, education, isCertificated, registeredResidence
                        string lng = list[i].lnglat.Split('*')[0];
                        string lat = list[i].lnglat.Split('*')[1];
                        trs.Append("<tr>");
                        trs.Append("<td>" + lng + "</td>");
                        trs.Append("<td>" + lat + "</td>");
                        trs.Append("<td>" + list[i].userName + "</td>");
                        trs.Append("<td>" + mbcolordic[list[i].color] + "</td>");
                        trs.Append("<td>" + list[i].boxName + "</td>");
                        trs.Append("<td><button type='button' class='btn btn-mini btn-primary'>修改</button>");
                        trs.Append("<button type='button' class='btn btn-mini btn-danger' style='margin-left:3px;'>删除</button></td>");
                        trs.Append("</tr>");
                    }
                    context.Response.Write(trs);
                }
               

            }
            
            else if (action == "delMb")
            {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                Dictionary<string, string> kvs = new Dictionary<string, string>();
                //name, sex, IDCard, depID, phoneNumber, jobPosition, education, isCertificated, registeredResidence
                //Model.PersonManage person = new Model.PersonManage();               
                Model.MedicineBox mb = new Model.MedicineBox();
                mb.lnglat = context.Request["lnglat"];
                mb.userName = context.Request["userName"];
                mb.color = context.Request["color"];

                if (new DAL.MedicineBoxDAL().DeleteMedicineBoxbyLnglatUserNameColor(mb.lnglat,mb.userName,mb.color) != -1)
                {
                    kvs["success"] = "success";
                    string send = serializer.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(send);
                }
                else
                {
                    kvs["err_message"] = "delFailure";
                    string send = serializer.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(send);
                }

            }
            else if (action == "editMb")
            {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                Dictionary<string, string> kvs = new Dictionary<string, string>();
                //lnglat, userName, color, boxName
                Model.MedicineBox mb = new Model.MedicineBox();
                mb.lnglat = context.Request["lnglat"];
                mb.userName = context.Request["userName"];
                mb.color = context.Request["color"];
                mb.boxName = context.Request["boxName"];
                string oldmbcolor= context.Request["oldcolor"];

                //按照经纬度、用户名和颜色，删掉旧的小药箱，再增加一个新的

                if (new DAL.MedicineBoxDAL().DeleteMedicineBoxbyLnglatUserNameColor(mb.lnglat,mb.userName,oldmbcolor) != -1)
                {
                    new DAL.MedicineBoxDAL().AddMedicineBox(mb);
                    kvs["success"] = "success";
                    string send = serializer.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(send);
                }
                else
                {
                    kvs["err_message"] = "editFailure";
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