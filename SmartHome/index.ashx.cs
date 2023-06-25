using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.SessionState;

namespace SmartHome
{
    /// <summary>
    /// index 的摘要说明
    /// </summary>
    public class index : IHttpHandler, IRequiresSessionState
    {

        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";
            string name = context.Request["name"].Trim().ToString(); //接收前台传过来的参数
           
           
            if (name == "rtu2mms")
            {
                string startdatetime = context.Request["startdatetime"].Trim().ToString();
                string enddatetime = context.Request["enddatetime"].Trim().ToString();

                //GPS0868120247900787
                List<Model.GPSStates> list = new DAL.GPSStatesDAL().GetList3(startdatetime, enddatetime);
                StringBuilder trs = new StringBuilder();
                if (context.Session["username"] == null)
                {
                    trs.Append("<tr><td colspan='10' style='text-align:center;font-size:10px;font-weight:bold;color:#666666;background:#efefef'>表 格 数 据 为 空！</td></tr>");
                    context.Response.Write(trs);
                    return;
                }
                //根据username判断是否为超级管理员，
                if (new DAL.UserDAL().GetUser(context.Session["username"].ToString()).UserLevel == "0")
                {

                }
                else
                {

                }


                if (list != null)
                {
                    for (int i = 0; i < list.Count; i++)
                    {
                        if (list[i].IMEI == "0000000000000000") { continue; }
                        //0868120247900787
                        if (list[i].IMEI == "0868120247900787") { continue; }
                        //ID, IPPort, IMEI, GasElectricSwitch, LocationSwitch, Charging, ACC, Garrison, PowerLevel, SignalIntensity, DateTime
                        trs.Append("<tr>");
                        //trs.Append("<td>" + list[i].IPPort + "</td>");
                        string plateNumber = new DAL.CarGPSInforsDAL().GetCarGPSInforbyIMEI(list[i].IMEI).plateNumber;
                        trs.Append("<td>" + plateNumber + "</td>");
                        trs.Append("<td>" + list[i].IMEI + "</td>");
                        trs.Append("<td>" + list[i].GasElectricSwitch + "</td>");
                        trs.Append("<td>" + list[i].LocationSwitch + "</td>");
                        trs.Append("<td>" + list[i].Charging + "</td>");
                        trs.Append("<td>" + list[i].ACC + "</td>");
                        trs.Append("<td>" + list[i].Garrison + "</td>");
                        trs.Append("<td>" + list[i].PowerLevel + "</td>");
                        trs.Append("<td>" + list[i].SignalIntensity + "</td>");
                        trs.Append("<td>" + list[i].DateTime + "</td>");
                        trs.Append("</tr>");

                        //ID, RTUID, Password, SwitchState, SwitchStyle, UpInterval, MaxCurrent, MinVoltage, MaxVoltage, 
                        //Frequency, DutyRatio, OpenTime, OpenAngle, ClientPoint, DateTime, NowVoltage, NowCurrent


                    }
                }
                else
                {
                    trs.Append("<tr><td colspan='10' style='text-align:center;font-size:10px;font-weight:bold;color:#666666;background:#efefef'>表 格 数 据 为 空！</td></tr>");
                }



                //string row = "<tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td>11</td><td>12</td><td>13</td><td>14</td></tr>";

                //trs.Append("<tr></tr>");
                context.Response.Write(trs);
            }
            else 
            if (name == "rtuidselect")
            {
                //显示所有的GPS设备ID
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
            else
            if (name == "timedatatrack")
            {
                //显示所有的GPS设备ID
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
            else
            {
                string imei = new DAL.CarGPSInforsDAL().GetCarGPSInforbyPlateNumber(name).IMEI;
                //根据名字返回相应的gps数据表
                List<Model.GPSIMEI> list = new DAL.GPSIMEIDAL().GetList(imei);
                StringBuilder trs = new StringBuilder();
                if (context.Session["username"] == null)
                {
                    trs.Append("<tr><td colspan='12' style='text-align:center;font-size:10px;font-weight:bold;color:#666666;background:#efefef'>表 格 数 据 为 空！</td></tr>");
                    context.Response.Write(trs);
                    return;
                }
                if (list != null)
                {
                    for (int i = 0; i < list.Count; i++)
                    {
                        //ID, IMEI, DateTime, Latitude, Longitude, Speed, RealTimeLocation, IsLocated, LongitudeEastWest, LatitudeSouthNorth, 
                        //Direction, ACC, UploadMode, RealTimeOrSupply, AccumulatedMiles
                        trs.Append("<tr>");
                        //trs.Append("<td>" + list[i].IMEI + "</td>");
                        //trs.Append("<td>" + list[i].DateTime + "</td>");
                        trs.Append("<td>" + list[i].Latitude + "</td>");
                        trs.Append("<td>" + list[i].Longitude + "</td>");
                        trs.Append("<td>" + list[i].Speed + "km/h</td>");
                        trs.Append("<td>" + list[i].RealTimeLocation + "</td>");
                        trs.Append("<td>" + list[i].IsLocated + "</td>");
                        trs.Append("<td>" + list[i].LongitudeEastWest + "</td>");
                        trs.Append("<td>" + list[i].LatitudeSouthNorth + "</td>");
                        trs.Append("<td>" + list[i].Direction + "</td>");
                        trs.Append("<td>" + list[i].ACC + "</td>");
                        trs.Append("<td>" + list[i].UploadMode + "</td>");
                        trs.Append("<td>" + list[i].RealTimeOrSupply + "</td>");
                        trs.Append("<td>" + list[i].DateTime + "</td>");
                        //trs.Append("<td>" + list[i].AccumulatedMiles + "</td>");
                        trs.Append("</tr>");
                    }
                }
                else
                {
                    trs.Append("<tr><td colspan='12' style='text-align:center;font-size:10px;font-weight:bold;color:#666666;background:#efefef'>表 格 数 据 为 空！</td></tr>");
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