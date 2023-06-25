using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.Script.Serialization;

namespace SmartHome
{
    /// <summary>
    /// trackManage1 的摘要说明
    /// </summary>
    public class trackManage1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {           
            string action = context.Request["action"].Trim().ToString();
            context.Response.ContentType = "text/html";

            if (action == "trackInfor")
            {
                //ID, name, sex, IDCard, depID, phoneNumber, jobPosition, education, isCertificated, registeredResidence
                List<Model.CarTrack> list = new DAL.CarTrackDAL().GetList();
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
                        //plateNumber, startTime, endTime, userName, trackName

                        trs.Append("<tr>");
                        trs.Append("<td>" + list[i].plateNumber + "</td>");
                        trs.Append("<td>" + list[i].startTime + "</td>");
                        trs.Append("<td>" + list[i].endTime + "</td>");
                        trs.Append("<td>" + list[i].userName + "</td>");
                        trs.Append("<td>" + list[i].trackName + "</td>");
                        trs.Append("<td><button type='button' class='btn btn-mini btn-primary'>修改</button>");
                        trs.Append("<button type='button' class='btn btn-mini btn-danger' style='margin-left:3px;'>删除</button></td>");
                        trs.Append("</tr>");
                    }
                    context.Response.Write(trs);
                }


            }

            else if (action == "delTrack")
            {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                Dictionary<string, string> kvs = new Dictionary<string, string>();
                //name, sex, IDCard, depID, phoneNumber, jobPosition, education, isCertificated, registeredResidence
                //Model.PersonManage person = new Model.PersonManage();               
                Model.CarTrack ct = new Model.CarTrack();
                ct.plateNumber = context.Request["plateNumber"];
                ct.startTime = context.Request["startTime"];
                ct.endTime = context.Request["endTime"];
                ct.userName = context.Request["userName"];
                ct.trackName = context.Request["trackName"];

                if (new DAL.CarTrackDAL().DeleteCarTrackbyPlateNumberStartTimeEndTimeUserNameTrackName(ct) != -1)
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
            else if (action == "editTrack")
            {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                Dictionary<string, string> kvs = new Dictionary<string, string>();
                //plateNumber, startTime, endTime, userName, trackName
                Model.CarTrack ct = new Model.CarTrack();
                ct.plateNumber = context.Request["plateNumber"];
                ct.startTime = context.Request["startTime"];
                ct.endTime = context.Request["endTime"];
                ct.userName = context.Request["userName"];
                ct.trackName = context.Request["trackName"];

                //按照经纬度、用户名和颜色，删掉旧的小药箱，再增加一个新的

                if (new DAL.CarTrackDAL().EditCarTrackbyPlateNumberStartTimeEndTimeUserName(ct) != -1)
                {
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