using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;

namespace SmartHome
{
    /// <summary>
    /// map 的摘要说明
    /// </summary>
    public class map : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            if (context.Request["name"] == null) { return; }
            string name = context.Request["name"].Trim().ToString();　　　　　　//接收前台传过来的参数
            //if (string.IsNullOrEmpty(name)) { return; }
            //-----------------------------------------------车辆最新定位---------------------------------------------
            if (name == "map")
            {

                // List<Model.GPSStates> list= new DAL.GPSStatesDAL().GetList();
                JavaScriptSerializer jss = new JavaScriptSerializer();
                //DAL.MapDAL mapdal = new DAL.MapDAL();
                //List<Model.Map> list = mapdal.GetList();
                List<Model.GPSIMEI> list = new List<Model.GPSIMEI>();
                List<Model.GPSStates> gpsstates = new DAL.GPSStatesDAL().GetList();
                if (gpsstates != null)
                {
                    for (int i = 0; i < gpsstates.Count; i++)
                    {
                        if (gpsstates[i].IMEI == "0000000000000000") { continue; }
                        if (gpsstates[i].IMEI == "0868120247900787") { continue; }
                        list.Add(new DAL.GPSIMEIDAL().GetLastByIMEI(gpsstates[i].IMEI));
                    }
                }



                //List<Model.GPSIMEI> list = null;
                List<string> mapString = new List<string>();

                Dictionary<string, string> kvs = new Dictionary<string, string>();

                if (context.Session["username"] == null)
                {
                    kvs["error_key"] = "error_value";
                    string senderror = jss.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(senderror);
                    return;
                }

                //根据username判断是否为超级管理员，
                if (new DAL.UserDAL().GetUser(context.Session["username"].ToString()).UserLevel == "0")
                {
                    //list = mapdal.GetList();
                }
                else
                {
                    //根据用户名查询能看到的rtuid列表
                    //list = mapdal.GetListByUserName(context.Session["username"].ToString());
                }
                if (list == null)
                {
                    kvs["error_key"] = "error_value";
                    string senderror = jss.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(senderror);
                    return;
                }
                if (list.Count == 0)
                {
                    kvs["error_key"] = "error_value";
                    string senderror = jss.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(senderror);
                    return;
                }

                for (int i = 0; i < list.Count; i++)
                {
                    mapString.Add(jss.Serialize(list[i]));
                }
                string[] temp = mapString.ToArray();
                string send = jss.Serialize(temp);
                context.Response.Write(send);
                //jss.Serialize(mapdal.GetList);
                //context.Response.Write();
            }
            //------------------------------------------------------------------------------------------
            //------------------------------------------------------------------------------------------
            else if (name == "startend1")
            {
                string startdatetime = context.Request["startdatetime"].Trim().ToString();
                string enddatetime = context.Request["enddatetime"].Trim().ToString();
                string platenumber = context.Request["platenumber"].Trim().ToString();

                System.Diagnostics.Debug.WriteLine("====="+startdatetime);
                //startdatetime = startdatetime.Replace("\"","");
                //string newstartdatetime = startdatetime.Replace("\\+", " ");
                //string[] startarray = startdatetime.Split('+');//将一个字符串分割成字符串数组 参数的意义是按照指定的地方开始分割
                //string[] endarray = enddatetime.Split('+');//将一个字符串分割成字符串数组 参数的意义是按照指定的地方开始分割
                //string newstartdatetime = startarray[0] + " " + startarray[1];//拼接字符串                string[] startarray = startdatetime.Split('+');//将一个字符串分割成字符串数组 参数的意义是按照指定的地方开始分割
                //string newenddatetime = endarray[0] + " " + endarray[1];//拼接字符串s

                //string[] endarray = enddatetime.Split('-');
                // string newenddatetimee = endarray[0] + "/" + Convert.ToInt32(endarray[1]).ToString() + "/" + Convert.ToInt32(endarray[2]).ToString();//拼接字符串 强制类型转换
                //string newstartdatetime1= Convert.ToInt32(newstartdatetime).ToString();
                //str.replace("\\+", "%20")
                //enddatetime = enddatetime.Replace("+", " ");
                //string newenddatetime = enddatetime.Replace("\\+", " ");
                //Convert.ToInt32(endarray[1]).ToString()
                //string[] startarray = startdatetime.Split('+');


                //string[] endarray = enddatetime.Split('+');

                string imei = new DAL.CarGPSInforsDAL().GetCarGPSInforbyPlateNumber(platenumber).IMEI;

                //string[] startarray = startdatetime.Split('-');//将一个字符串分割成字符串数组 参数的意义是按照指定的地方开始分割
                //string newstartdatetime = startarray[0] + "/" + Convert.ToInt32(startarray[1]).ToString() + "/" + Convert.ToInt32(startarray[2]).ToString();//拼接字符串

               // string[] endarray = enddatetime.Split('-');
                //string newenddatetimee = endarray[0] + "/" + Convert.ToInt32(endarray[1]).ToString() + "/" + Convert.ToInt32(endarray[2]).ToString();//拼接字符串 强制类型转换


                JavaScriptSerializer jss = new JavaScriptSerializer();
                List<Model.GPSIMEI> list = new DAL.GPSIMEIDAL().GetListbyIMEIStartEndDateTime(imei, startdatetime, enddatetime);



                List<string> mapString = new List<string>();
                Dictionary<string, string> kvs = new Dictionary<string, string>();

                if (list == null)
                {
                    kvs["error_key"] = "error_value";
                    string senderror = jss.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(senderror);
                    return;
                }
                if (list.Count == 0)
                {
                    kvs["error_key"] = "error_value";
                    string senderror = jss.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(senderror);
                    return;
                }

                for (int i = 0; i < list.Count; i++)
                {
                    mapString.Add(jss.Serialize(list[i]));
                }
                string[] temp = mapString.ToArray();//将list转换成数组
                string send = jss.Serialize(temp);//将数组转换成json字符串
                context.Response.Write(send);







            }
            else if (name == "startend")
            {
                string startdatetime = context.Request["startdatetime"].Trim().ToString();
                string enddatetime = context.Request["enddatetime"].Trim().ToString();
                string platenumber = context.Request["platenumber"].Trim().ToString();
                string imei = new DAL.CarGPSInforsDAL().GetCarGPSInforbyPlateNumber(platenumber).IMEI;

                string[] startarray = startdatetime.Split('-');//将一个字符串分割成字符串数组 参数的意义是按照指定的地方开始分割
                string newstartdatetime = startarray[0] + "/" + Convert.ToInt32(startarray[1]).ToString() + "/" + Convert.ToInt32(startarray[2]).ToString();//拼接字符串

                string[] endarray = enddatetime.Split('-');
                string newenddatetimee = endarray[0] + "/" + Convert.ToInt32(endarray[1]).ToString() + "/" + Convert.ToInt32(endarray[2]).ToString();//拼接字符串 强制类型转换


                JavaScriptSerializer jss = new JavaScriptSerializer();
                List<Model.GPSIMEI> list = new DAL.GPSIMEIDAL().GetListbyIMEIStartEndDateTime(imei, newstartdatetime + " 0:0:0", newenddatetimee + " 23:59:59");



                List<string> mapString = new List<string>();
                Dictionary<string, string> kvs = new Dictionary<string, string>();

                if (list == null)
                {
                    kvs["error_key"] = "error_value";
                    string senderror = jss.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(senderror);
                    return;
                }
                if (list.Count == 0)
                {
                    kvs["error_key"] = "error_value";
                    string senderror = jss.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(senderror);
                    return;
                }

                for (int i = 0; i < list.Count; i++)
                {
                    mapString.Add(jss.Serialize(list[i]));
                }
                string[] temp = mapString.ToArray();//将list转换成数组
                string send = jss.Serialize(temp);//将数组转换成json字符串
                context.Response.Write(send);







            }
            //------------------------------------------------------------------------------------------
            //---------------------------------大屏展示---------------------------------------------------------
            else if (name == "all")
            {
                JavaScriptSerializer jss = new JavaScriptSerializer();
                List<Model.GPSStates> gpsstates = new DAL.GPSStatesDAL().GetList();
                List<List<string>> mapAll = new List<List<string>>();


                if (gpsstates != null)
                {
                    for (int i = 0; i < gpsstates.Count; i++)
                    {
                        List<Model.GPSIMEI> list = new DAL.GPSIMEIDAL().GetList(gpsstates[i].IMEI);
                        List<Model.GPSIMEI> listNew = new List<Model.GPSIMEI>();
                        //--------------------如果小于10，大于10小于120，大于120------------------------------------------------
                        if (list.Count < 10)
                        {
                            //返回所有记录
                        }
                        else if (list.Count < 120)
                        {
                            //根据总数，均匀返回10条数据，步长为：总数/10，再取整
                            int step = list.Count / 10;
                            for (int j = 0; j < 10; j++)
                            {
                                listNew.Add(list[j * step]);
                            }
                            list = listNew;
                        }
                        else
                        {
                            int len = list.Count;
                            for (int j = 0; j < 10; j++)
                            {
                                listNew.Add(list[len - 120 + j * 12]);
                            }
                            list = listNew;
                        }
                        //--------------------如果小于10，大于10小于120，大于120------------------------------------------------
                        //if (list.Count > 6)
                        //{
                        //    int len = list.Count;
                        //    for (int j = 0; j < 6; j++)
                        //    {
                        //        listNew.Add(list[len - 6 + j]);

                        //    }
                        //    list = listNew;
                        //}
                        //----------------------------------------------------------------------
                        List<string> mapString = new List<string>();
                        for (int j = 0; j < list.Count; j++)
                        {
                            mapString.Add(jss.Serialize(list[j]));
                        }
                        //----------------------------------------------------------------------
                        mapAll.Add(mapString);
                    }
                    string send = jss.Serialize(mapAll);
                    context.Response.Write(send);
                }
                else
                {
                    Dictionary<string, string> kvs = new Dictionary<string, string>();
                    kvs["error_key"] = "error_value";
                    string senderror = jss.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(senderror);
                }

            }
            //-----------------------------------------------车辆历史轨迹根据imei返回---------------------------------------------
            else
            {
                JavaScriptSerializer jss = new JavaScriptSerializer();
                string imei = new DAL.CarGPSInforsDAL().GetCarGPSInforbyPlateNumber(context.Request["name"].ToString()).IMEI;
                List<Model.GPSIMEI> list = new DAL.GPSIMEIDAL().GetList(imei);

                //List<Model.GPSIMEI> list = new DAL.GPSIMEIDAL().GetList(context.Request["name"].ToString());

                List<Model.GPSIMEI> listNew = new List<Model.GPSIMEI>();

                //--------------------如果小于10，大于10小于120，大于120------------------------------------------------
                if (list.Count < 10)
                {
                    //返回所有记录
                }
                else if (list.Count < 120)
                {
                    //根据总数，均匀返回10条数据，步长为：总数/10，再取整
                    int step = list.Count / 10;
                    for (int j = 0; j < 10; j++)
                    {
                        listNew.Add(list[j * step]);
                    }
                    list = listNew;
                }
                else
                {
                    int len = list.Count;
                    for (int j = 0; j < 10; j++)
                    {
                        listNew.Add(list[len - 120 + j * 12]);
                    }
                    list = listNew;
                }
                //--------------------如果小于10，大于10小于120，大于120------------------------------------------------
                //if (list.Count > 6)
                //{
                //    int len = list.Count;
                //    for (int i = 0; i < 6; i++)
                //    {
                //        listNew.Add(list[len - 6 + i]);

                //    }
                //    list = listNew;
                //}


                //List<Model.GPSStates> gpsstates = new DAL.GPSStatesDAL().GetList();
                //if (gpsstates != null)
                //{
                //    for (int i = 0; i < gpsstates.Count; i++)
                //    {
                //        list.Add(new DAL.GPSIMEIDAL().GetLastByIMEI(gpsstates[i].IMEI));
                //    }
                //}



                //List<Model.GPSIMEI> list = null;
                List<string> mapString = new List<string>();

                Dictionary<string, string> kvs = new Dictionary<string, string>();

                if (context.Session["username"] == null)
                {
                    kvs["error_key"] = "error_value";
                    string senderror = jss.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(senderror);
                    return;
                }

                //根据username判断是否为超级管理员，
                if (new DAL.UserDAL().GetUser(context.Session["username"].ToString()).UserLevel == "0")
                {
                    //list = mapdal.GetList();
                }
                else
                {
                    //根据用户名查询能看到的rtuid列表
                    //list = mapdal.GetListByUserName(context.Session["username"].ToString());
                }
                if (list == null)
                {
                    kvs["error_key"] = "error_value";
                    string senderror = jss.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(senderror);
                    return;
                }
                if (list.Count == 0)
                {
                    kvs["error_key"] = "error_value";
                    string senderror = jss.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(senderror);
                    return;
                }

                for (int i = 0; i < list.Count; i++)
                {
                    mapString.Add(jss.Serialize(list[i]));
                }
                string[] temp = mapString.ToArray();
                string send = jss.Serialize(temp);
                context.Response.Write(send);
                //jss.Serialize(mapdal.GetList);
                //context.Response.Write();
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