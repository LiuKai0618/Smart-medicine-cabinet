using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;

namespace SmartHome
{
    /// <summary>
    /// h5login 的摘要说明
    /// </summary>
    public class h5login : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            // context.Request["name"] == "sysstatus"
            string username = context.Request["username"];
            string password = context.Request["password"];
            //访问数据库验证用户的合法性
            DAL.UserDAL userdal = new DAL.UserDAL();
            Model.User user = userdal.GetUser(username);
            Dictionary<string, string> kvs = new Dictionary<string, string>();
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            if (user == null)
            {
                kvs["error_key"] = "error_value";
                string send = serializer.Serialize(kvs);
                context.Response.ContentType = "text/plain";
                context.Response.Write(send);
                return;
            }
            if (user.UserPassword != password)
            {
                kvs["error_key"] = "error_value";
                string send = serializer.Serialize(kvs);
                context.Response.ContentType = "text/plain";
                context.Response.Write(send);
                return;
            }
            //合法的用户
            //context.Response.Redirect("111111111.aspx");
            context.Session["username"] = user.UserName;
            context.Session["userlevel"] = user.UserLevel;

            kvs["login"] = "login";
            string send1 = serializer.Serialize(kvs);
            context.Response.ContentType = "text/plain";
            context.Response.Write(send1);
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