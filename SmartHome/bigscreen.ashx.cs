using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;

namespace SmartHome
{
    /// <summary>
    /// bigscreen1 的摘要说明
    /// </summary>
    public class bigscreen1 : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            if (context.Request["name"] == null) { return; }
            string name = context.Request["name"].Trim().ToString();
            if (name == "outCounts")
            {
                List<Third.CarInfor> list = new Third.CarInforDAL().GetList();
                List<string> mapString = new List<string>();
                JavaScriptSerializer jss = new JavaScriptSerializer();
                for (int i = 0; i < list.Count; i++)
                {
                    mapString.Add(jss.Serialize(list[i]));
                }
                string[] temp = mapString.ToArray();
                string send = jss.Serialize(temp);
                context.Response.Write(send);
            }
            else
            {
                //接收出行次数，更新数据库
                string plateNumber = context.Request["name"].Trim().ToString();
                //string carout = context.Request["carout"].Trim().ToString();
                Third.CarInforDAL cardal = new Third.CarInforDAL();
                Third.CarInfor car = cardal.GetCarbyPlateNumber(plateNumber);
                if (car != null)
                {
                    int temp = Convert.ToInt32(car.visitCount);
                    car.visitCount = (temp + 1).ToString();
                    cardal.EditCar(car);
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