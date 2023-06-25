using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;

namespace SmartHome
{
    /// <summary>
    /// h5marker 的摘要说明
    /// </summary>
    public class h5marker : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string action = context.Request["action"].Trim().ToString();
            context.Response.ContentType = "text/html";


            if (action == "add")
            {
                string lnglat = context.Request["lnglat"].Trim().ToString();
                string userName = context.Request["userName"].Trim().ToString();
                string boxName = context.Request["boxName"].Trim().ToString();
                string color = context.Request["color"].Trim().ToString();
                Model.MedicineBox mb = new Model.MedicineBox();
                mb.lnglat = lnglat;
                mb.userName = userName;
                mb.boxName = boxName;
                mb.color = color;
                new DAL.MedicineBoxDAL().AddMedicineBox(mb);
                //JavaScriptSerializer serializer = new JavaScriptSerializer();
                //Dictionary<string, string> kvs = new Dictionary<string, string>();
                ////ID, depID, depParentID, depName, depHeader, depPhone, remark
                //Model.DepManage dep = new Model.DepManage();
                //dep.depID = context.Request["depID"];
                //dep.depParentID = context.Request["depParentID"];
                //dep.depName = context.Request["depName"];
                //dep.depHeader = context.Request["depHeader"];
                //dep.depPhone = context.Request["depPhone"];
                //dep.remark = context.Request["remark"];

                //if (new DAL.DepManageDAL().GetDepbyDepID(dep.depID) != null)
                //{
                //    kvs["err_message"] = "depIsExist";
                //    string send = serializer.Serialize(kvs);
                //    context.Response.ContentType = "text/plain";
                //    context.Response.Write(send);
                //    return;
                //}
                //if (new DAL.DepManageDAL().AddDep(dep) != -1)
                //{
                //    kvs["success"] = "success";
                //    string send = serializer.Serialize(kvs);
                //    context.Response.ContentType = "text/plain";
                //    context.Response.Write(send);
                //}
                //else
                //{
                //    kvs["err_message"] = "addFailure";
                //    string send = serializer.Serialize(kvs);
                //    context.Response.ContentType = "text/plain";
                //    context.Response.Write(send);
                //}

            }
            else if (action == "edit")
            {
                string lnglat = context.Request["lnglat"].Trim().ToString();
                string userName = context.Request["userName"].Trim().ToString();
                string boxName = context.Request["boxName"].Trim().ToString();
                string colorlist = context.Request["colorlist"].Trim().ToString();
                string[] colorarray = colorlist.Split('*');
                Dictionary<string, string> kvs = new Dictionary<string, string>();
                JavaScriptSerializer jss = new JavaScriptSerializer();
                int returnInt;
                returnInt = new DAL.MedicineBoxDAL().DeleteMedicineBoxbyLnglatUserName(lnglat, userName);

                if (returnInt <= 0)
                {
                    kvs["err_message"] = "err_message";
                    string send4 = jss.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(send4);
                    return;
                }
                for (int i = 0; i < colorarray.Length; i++)
                {
                    if (colorarray[i] == "") { continue; }
                    Model.MedicineBox mb = new Model.MedicineBox();
                    mb.lnglat = lnglat;
                    mb.userName = userName;
                    mb.boxName = boxName;
                    mb.color = colorarray[i];
                    new DAL.MedicineBoxDAL().AddMedicineBox(mb);
                }

                kvs["success"] = "success";
                string send3 = jss.Serialize(kvs);
                context.Response.ContentType = "text/plain";
                context.Response.Write(send3);


            }
            else if (action == "sub")
            {
                string lnglat = context.Request["lnglat"].Trim().ToString();
                string userName = context.Request["userName"].Trim().ToString();

                Dictionary<string, string> kvs = new Dictionary<string, string>();
                JavaScriptSerializer jss = new JavaScriptSerializer();

                Model.MedicineBox mb = new DAL.MedicineBoxDAL().GetMedicineBoxbyLnglat(lnglat);
                if (mb == null)
                {
                    kvs["success"] = "success";
                    string send3 = jss.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(send3);
                    return;
                }
                if (mb.userName != userName)
                {
                    kvs["err_message"] = "err_message";
                    string send1 = jss.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(send1);
                }
                else
                {
                    int result = new DAL.MedicineBoxDAL().DeleteMedicineBoxbyLnglatUserName(lnglat, userName);
                    if (result == -1)
                    {
                        kvs["err_failure"] = "err_failure";
                        string send2 = jss.Serialize(kvs);
                        context.Response.ContentType = "text/plain";
                        context.Response.Write(send2);
                    }
                    else
                    {
                        kvs["success"] = "success";
                        string send3 = jss.Serialize(kvs);
                        context.Response.ContentType = "text/plain";
                        context.Response.Write(send3);
                    }

                }

                //JavaScriptSerializer serializer = new JavaScriptSerializer();
                //Dictionary<string, string> kvs = new Dictionary<string, string>();
                ////ID, depID, depParentID, depName, depHeader, depPhone, remark              
                //string depID = context.Request["depID"];

                //if (new DAL.DepManageDAL().DeleteDepbyDepID(depID) != -1)
                //{
                //    kvs["success"] = "success";
                //    string send = serializer.Serialize(kvs);
                //    context.Response.ContentType = "text/plain";
                //    context.Response.Write(send);
                //}
                //else
                //{
                //    kvs["err_message"] = "delFailure";
                //    string send = serializer.Serialize(kvs);
                //    context.Response.ContentType = "text/plain";
                //    context.Response.Write(send);
                //}

            }
            else if (action == "colorList")
            {
                string lnglat = context.Request["lnglat"].Trim().ToString();
                string boxName = context.Request["boxName"].Trim().ToString();
                string userName = context.Request["userName"].Trim().ToString();


                Dictionary<string, string> kvs = new Dictionary<string, string>();
                //string color = context.Request["color"].Trim().ToString();
                List<Model.MedicineBox> list = new DAL.MedicineBoxDAL().GetListbyLnglatUsernameBoxname(lnglat, userName, boxName);
                StringBuilder sb = new StringBuilder();
                JavaScriptSerializer jss = new JavaScriptSerializer();
                if (list == null)
                {
                    kvs["err_message"] = "err_message";
                    string send1 = jss.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(send1);

                }
                else
                {
                    for (int i = 0; i < list.Count; i++)
                    {
                        sb.Append(list[i].color + "*");
                    }
                    kvs["colorlist"] = sb.ToString();
                    string send1 = jss.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(send1);
                }


                //string[] temp = mapString.ToArray();
                //string send = jss.Serialize(temp);
                //context.Response.Write(send);
            }
            else if (action == "allmbsbyusername")
            {
                string username = context.Request["userName"].Trim().ToString();
                Dictionary<string, string> kvs = new Dictionary<string, string>();
                string color = context.Request["color"].Trim().ToString();
                List<Model.MedicineBox> list;
                if (color == "allcolors")
                {
                    list = new DAL.MedicineBoxDAL().GetListbyUserName(username);
                }
                else
                {
                    //list = new DAL.MedicineBoxDAL().GetListbyUserNameColor(username, color);
                    list = new DAL.MedicineBoxDAL().GetListbyColor(color);
                }

                List<string> mapString = new List<string>();
                JavaScriptSerializer jss = new JavaScriptSerializer();
                if (list == null)
                {
                    kvs["err_message"] = "err_message";
                    string send1 = jss.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(send1);
                    return;
                }
                for (int i = 0; i < list.Count; i++)
                {
                    mapString.Add(jss.Serialize(list[i]));
                }
                string[] temp = mapString.ToArray();
                string send = jss.Serialize(temp);
                context.Response.Write(send);
            }
            else if (action == "allmbsbyusernamenew")
            {
                string username = context.Request["userName"].Trim().ToString();
                string FirstLng = context.Request["FirstLng"].Trim().ToString();
                string FirstLat = context.Request["FirstLat"].Trim().ToString();
                string BanjingMi = context.Request["BanjingMi"].Trim().ToString();
                string Number12 = context.Request["Number12"].Trim().ToString();


                Dictionary<string, string> kvs = new Dictionary<string, string>();
                string color = context.Request["color"].Trim().ToString();
                List<Model.MedicineBox> list;
                if (color == "allcolors")
                {
                    list = new DAL.MedicineBoxDAL().GetListbyUserName(username);
                }
                else
                {
                    //list = new DAL.MedicineBoxDAL().GetListbyUserNameColor(username, color);
                    list = new DAL.MedicineBoxDAL().GetListbyColor(color, FirstLng, FirstLat, BanjingMi, Number12);
                }

                List<string> mapString = new List<string>();
                JavaScriptSerializer jss = new JavaScriptSerializer();
                if (list == null)
                {
                    kvs["err_message"] = "err_message";
                    string send1 = jss.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(send1);
                    return;
                }
                for (int i = 0; i < list.Count; i++)
                {
                    mapString.Add(jss.Serialize(list[i]));
                }
                string[] temp = mapString.ToArray();
                string send = jss.Serialize(temp);
                context.Response.Write(send);
            }
            else if (action == "allmbs")
            {
                Dictionary<string, string> kvs = new Dictionary<string, string>();
                List<Model.MedicineBox> list = new DAL.MedicineBoxDAL().GetList();
                List<string> mapString = new List<string>();
                JavaScriptSerializer jss = new JavaScriptSerializer();
                if (list == null)
                {
                    kvs["err_message"] = "err_message";
                    string send1 = jss.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(send1);
                    return;
                }
                for (int i = 0; i < list.Count; i++)
                {
                    mapString.Add(jss.Serialize(list[i]));
                }
                string[] temp = mapString.ToArray();
                string send = jss.Serialize(temp);
                context.Response.Write(send);
            }
            else if (action == "latlngbyplatenumber")
            {
                string plateNumber = context.Request["ppnnmm"].Trim().ToString();
                string imei = new DAL.CarGPSInforsDAL().GetCarGPSInforbyPlateNumber(plateNumber).IMEI;
                Model.GPSIMEI carinfor = new DAL.GPSIMEIDAL().GetLastByIMEI(imei);
                JavaScriptSerializer jss = new JavaScriptSerializer();

                string send = jss.Serialize(carinfor);
                context.Response.Write(send);

                //Dictionary<string, string> kvs = new Dictionary<string, string>();

                //List<Model.MedicineBox> list = new DAL.MedicineBoxDAL().GetListbyUserName(username);
                //List<string> mapString = new List<string>();

                //if (list == null)
                //{
                //    kvs["err_message"] = "err_message";
                //    string send1 = jss.Serialize(kvs);
                //    context.Response.ContentType = "text/plain";
                //    context.Response.Write(send1);
                //    return;
                //}
                //for (int i = 0; i < list.Count; i++)
                //{
                //    mapString.Add(jss.Serialize(list[i]));
                //}
                //string[] temp = mapString.ToArray();
                //string send = jss.Serialize(temp);
                //context.Response.Write(send);
            }
            else if (action == "tracksbyplatenumber")
            {
                string plateNumber = context.Request["ppnnmm"].Trim().ToString();
                List<Model.CarTrack> list = new DAL.CarTrackDAL().GetListbyPlateNumber(plateNumber);
                StringBuilder trs = new StringBuilder();
                if (list == null)
                {
                    trs.Append("<option value='nodata'>--下拉选择历史轨迹--</option>");
                    context.Response.Write(trs);
                    return;
                }
                trs.Append("<option value='nodata'>--下拉选择历史轨迹--</option>");
                for (int i = 0; i < list.Count; i++)
                {
                    trs.Append("<option value='" + list[i].trackName + "'>" + list[i].trackName + "</option>");
                }
                context.Response.Write(trs);
                //string plateNumber = context.Request["ppnnmm"].Trim().ToString();
                //List<Model.CarTrack> list = new DAL.CarTrackDAL().GetListbyPlateNumber(plateNumber);
                //JavaScriptSerializer jss = new JavaScriptSerializer();
                //List<string> mapString = new List<string>();
                //Dictionary<string, string> kvs = new Dictionary<string, string>();

                //if (list == null)
                //{
                //    kvs["err_message"] = "err_message";
                //    string send1 = jss.Serialize(kvs);
                //    context.Response.ContentType = "text/plain";
                //    context.Response.Write(send1);
                //    return;
                //}
                //for (int i = 0; i < list.Count; i++)
                //{
                //    mapString.Add(jss.Serialize(list[i]));
                //}
                //string[] temp = mapString.ToArray();
                //string send = jss.Serialize(temp);
                //context.Response.Write(send);

            }
            else if (action == "loadpointlist")
            {
                string plateNumber = context.Request["plateNumber"].Trim().ToString();
                string trackName = context.Request["trackName"].Trim().ToString();
                Model.CarTrack ct = new DAL.CarTrackDAL().GetCarTrackbyTrackNamePlateNumber(plateNumber, trackName);
                string starttime = ct.startTime;
                string endtime = ct.endTime;
                JavaScriptSerializer jss = new JavaScriptSerializer();
                string send = jss.Serialize(starttime);
                string send2 = jss.Serialize(endtime);
                context.Response.Write(send);


                //string imei = new DAL.CarGPSInforsDAL().GetCarGPSInforbyPlateNumber(plateNumber).IMEI;


                //JavaScriptSerializer jss = new JavaScriptSerializer();
                //List<Model.GPSIMEI> list = new DAL.GPSIMEIDAL().GetListbyIMEIStartEndDateTime(imei, starttime, endtime);


                //List<string> mapString = new List<string>();
                //Dictionary<string, string> kvs = new Dictionary<string, string>();
                //if (list == null)
                //{
                //    kvs["error_key"] = "error_value";
                //    string senderror = jss.Serialize(kvs);
                //    context.Response.ContentType = "text/plain";
                //    context.Response.Write(senderror);
                //    return;
                //}
                //if (list.Count == 0)
                //{
                //    kvs["error_key"] = "error_value";
                //    string senderror = jss.Serialize(kvs);
                //    context.Response.ContentType = "text/plain";
                //    context.Response.Write(senderror);
                //    return;
                //}

                //for (int i = 0; i < list.Count; i++)
                //{
                //    mapString.Add(jss.Serialize(list[i]));
                //}
                //string[] temp = mapString.ToArray();
                //string send = jss.Serialize(temp);
                //context.Response.Write(send);


                //List<Model.CarTrack> list = new DAL.CarTrackDAL().GetListbyPlateNumber(plateNumber);
                //StringBuilder trs = new StringBuilder();
                //if (list == null)
                //{
                //    trs.Append("<option value='nodata'>--下拉选择历史轨迹--</option>");
                //    context.Response.Write(trs);
                //    return;
                //}
                //trs.Append("<option value='nodata'>--下拉选择历史轨迹--</option>");
                //for (int i = 0; i < list.Count; i++)
                //{
                //    trs.Append("<option value='" + list[i].trackName + "'>" + list[i].trackName + "</option>");
                //}
                //context.Response.Write(trs);

                //string plateNumber = context.Request["ppnnmm"].Trim().ToString();
                //List<Model.CarTrack> list = new DAL.CarTrackDAL().GetListbyPlateNumber(plateNumber);
                //JavaScriptSerializer jss = new JavaScriptSerializer();
                //List<string> mapString = new List<string>();
                //Dictionary<string, string> kvs = new Dictionary<string, string>();

                //if (list == null)
                //{
                //    kvs["err_message"] = "err_message";
                //    string send1 = jss.Serialize(kvs);
                //    context.Response.ContentType = "text/plain";
                //    context.Response.Write(send1);
                //    return;
                //}
                //for (int i = 0; i < list.Count; i++)
                //{
                //    mapString.Add(jss.Serialize(list[i]));
                //}
                //string[] temp = mapString.ToArray();
                //string send = jss.Serialize(temp);
                //context.Response.Write(send);

            }
            else if (action == "loadpointlist2")
            {
                string plateNumber = context.Request["plateNumber"].Trim().ToString();
                string trackName = context.Request["trackName"].Trim().ToString();
                Model.CarTrack ct = new DAL.CarTrackDAL().GetCarTrackbyTrackNamePlateNumber(plateNumber, trackName);
                string starttime = ct.startTime;
                string endtime = ct.endTime;
                JavaScriptSerializer jss = new JavaScriptSerializer();
                string send = jss.Serialize(starttime);
                string send2 = jss.Serialize(endtime);
                context.Response.Write(send2);
            }
            else if (action == "addTrack")
            {
                string platenumber = context.Request["platenumber"].Trim().ToString();
                string trackname = context.Request["trackname"].Trim().ToString();
                string username = context.Request["username"].Trim().ToString();
                string imei = new DAL.CarGPSInforsDAL().GetCarGPSInforbyPlateNumber(platenumber).IMEI;
                string starttime = new DAL.GPSIMEIDAL().GetLastByIMEI(imei).DateTime;
                string orgin = context.Request["orgin"].Trim().ToString();
                string destination = context.Request["desname"].Trim().ToString();


                Model.CarTrack ct = new Model.CarTrack();
                ct.plateNumber = platenumber;
                ct.trackName = trackname;
                ct.userName = username;
                ct.startTime = starttime;
                ct.endTime = starttime;
                ct.orgin = trackname;
                ct.destination = trackname;
                //ct.endTime = "";
                new DAL.CarTrackDAL().AddCarTrack(ct);
                //List<Model.CarTrack> list = new DAL.CarTrackDAL().GetListbyPlateNumber(plateNumber);
                //JavaScriptSerializer jss = new JavaScriptSerializer();
                //List<string> mapString = new List<string>();
                //Dictionary<string, string> kvs = new Dictionary<string, string>();

                //if (list == null)
                //{
                //    kvs["err_message"] = "err_message";
                //    string send1 = jss.Serialize(kvs);
                //    context.Response.ContentType = "text/plain";
                //    context.Response.Write(send1);
                //    return;
                //}
                //for (int i = 0; i < list.Count; i++)
                //{
                //    mapString.Add(jss.Serialize(list[i]));
                //}
                //string[] temp = mapString.ToArray();
                //string send = jss.Serialize(temp);
                //context.Response.Write(send);

            }
            else if (action == "addfulltrack")
            {
                string platenumber = context.Request["platenumber"].Trim().ToString();
                string trackname = context.Request["trackname"].Trim().ToString();
                string desname = context.Request["desname"].Trim().ToString();

                string imei = new DAL.CarGPSInforsDAL().GetCarGPSInforbyPlateNumber(platenumber).IMEI;
                string endtime = new DAL.GPSIMEIDAL().GetLastByIMEI(imei).DateTime;

                Model.CarTrack ct = new DAL.CarTrackDAL().GetCarTrackbyTrackNamePlateNumber(platenumber, trackname);
                ct.endTime = endtime;
                ct.destination = desname;
                new DAL.CarTrackDAL().EditCarTrack(ct);

                //string plateNumber = context.Request["ppnnmm"].Trim().ToString();
                //List<Model.CarTrack> list = new DAL.CarTrackDAL().GetListbyPlateNumber(plateNumber);
                //JavaScriptSerializer jss = new JavaScriptSerializer();
                //List<string> mapString = new List<string>();
                //Dictionary<string, string> kvs = new Dictionary<string, string>();

                //if (list == null)
                //{
                //    kvs["err_message"] = "err_message";
                //    string send1 = jss.Serialize(kvs);
                //    context.Response.ContentType = "text/plain";
                //    context.Response.Write(send1);
                //    return;
                //}
                //for (int i = 0; i < list.Count; i++)
                //{
                //    mapString.Add(jss.Serialize(list[i]));
                //}
                //string[] temp = mapString.ToArray();
                //string send = jss.Serialize(temp);
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