using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;

namespace SmartHome
{
    /// <summary>
    /// userManager1 的摘要说明
    /// </summary>
    public class userManager1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            //HttpRequest hr= context.Request;
            //string test = context.Request["action"];
            if (context.Request["action"] == "userinfor")
            {
                List<string> users = new List<string>();
                List<Model.User> userlist = new DAL.UserDAL().GetList();
                if (userlist == null) { return; }
                if (userlist.Count == 0) { return; }
                for (int i = 0; i < userlist.Count; i++)
                {
                    if (userlist[i].UserLevel != "0")
                    {
                        users.Add(userlist[i].UserName);
                    }

                }
                Dictionary<string, List<string>> kvs = new Dictionary<string, List<string>>();
                kvs["usernamelist"] = users;
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                string send = serializer.Serialize(kvs);

                context.Response.ContentType = "text/plain";
                context.Response.Write(send);

            }
            else if (context.Request["action"] == "adduser")
            {
                Dictionary<string, string> kvs = new Dictionary<string, string>();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                string username = context.Request["addUsername"];
                //if (username == "sa")
                //{
                //    kvs["err_message"] = "err_message";
                //    string send = serializer.Serialize(kvs);
                //    context.Response.ContentType = "text/plain";
                //    context.Response.Write(send);
                //    return;
                //}


                string password = context.Request["addPassword1"];
                string userlevel = context.Request["addUserlevel"];
                Model.User adduser = new Model.User();
                adduser.UserName = username;
                adduser.UserPassword = password;
                adduser.UserLevel = userlevel;
               
                if (new DAL.UserDAL().AddUser(adduser) != -1)
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
            else if (context.Request["action"] == "deluser")
            {
                string delUsername = context.Request["delUsername"];
                Dictionary<string, string> kvs = new Dictionary<string, string>();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                if (new DAL.UserDAL().DeleteUser(delUsername) != -1)
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
            else if (context.Request["action"] == "rtuidsInfor")
            {
                //List<Model.RTU2MMS> list = new DAL.RTU2MMSDAL().GetList();
                //if (list == null) { return; }
                //StringBuilder trs = new StringBuilder();
                ////int count = (int)Math.Ceiling(list.Count/4.0);
                //int zong = list.Count;
                //int shang = list.Count / 4;
                //int yushu = list.Count % 4;
                //trs.Append("<label class='control-label' for=''>请勾选要访问的站点：</label>");
                //for (int i = 0; i < shang; i++)
                //{
                //    trs.Append("<div class='controls'>");
                //    for (int j = 0; j < 4; j++)
                //    {
                //        trs.Append("<label class='span3'><input type='checkbox' id='' value='" + list[i * 4 + j].RTUID + "'/> " + list[i * 4 + j].RTUID + "</label>");
                //    }
                //    trs.Append("</div>");
                //}
                //if (yushu > 0)
                //{
                //    trs.Append("<div class='controls'>");
                //    for (int i = 0; i < yushu; i++)
                //    {
                //        trs.Append("<label class='span3'><input type='checkbox' id='' value='" + list[zong - yushu + i].RTUID + "'/> " + list[zong - yushu + i].RTUID + "</label>");
                //    }
                //    trs.Append("</div>");
                //}
                //context.Response.ContentType = "text/html";
                //context.Response.Write(trs);


            }
            else if (context.Request["action"] == "userRTUIDs")
            {
                string username = context.Request["username"];
                Model.User user = new DAL.UserDAL().GetUser(username);
                string userLevel = user.UserLevel;
                string userPassword = user.UserPassword;



                List<string> rtuids = new List<string>();
                rtuids.Add(userLevel);
                rtuids.Add(userPassword);
                //List<Model.UserRTU> userrtulist = new DAL.UserRTUDAL().GetListByUserName(username);

                //if (userrtulist == null) { return; }
                //if (userrtulist.Count == 0) { return; }
                //for (int i = 0; i < userrtulist.Count; i++)
                //{
                //    rtuids.Add(userrtulist[i].RTUID);

                //}
                Dictionary<string, List<string>> kvs = new Dictionary<string, List<string>>();
                //Dictionary<string, string> kvs = new Dictionary<string, string>();
                kvs["userrtuids"] = rtuids;


                JavaScriptSerializer serializer = new JavaScriptSerializer();
                string send = serializer.Serialize(kvs);

                context.Response.ContentType = "text/plain";
                context.Response.Write(send);
            }
            else if (context.Request["action"] == "edituser")
            {
                string username = context.Request["editUsername"];
                string password = context.Request["editPassword"];
                string userlevel = context.Request["editUserlevel"];
                //string rtuidsel = context.Request["rtuidsel"];
                //更新数据库
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                Dictionary<string, string> kvs = new Dictionary<string, string>();
                Model.User user = new Model.User();
                user.UserName = username;
                user.UserLevel = userlevel;
                user.UserPassword = password;

                if (new DAL.UserDAL().EditUser(user) == -1)
                {
                    kvs["err_message"] = "err_message";
                    string send = serializer.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(send);
                }
                else
                {
                    kvs["success"] = "success";
                    string send = serializer.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(send);
                }


                //string[] s = serializer.Deserialize<string[]>(rtuidsel);
                //if (s.Length == 0)
                //{
                //    if (new DAL.UserRTUDAL().DeleteUserRTU(username) != -1)
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

                //    //首先删除该用户之前的所用记录，然后再增加，这就是编辑修改
                //    if (new DAL.UserRTUDAL().DeleteUserRTU(username) == -1)
                //    {
                //        kvs["err_message"] = "err_message";
                //        string send = serializer.Serialize(kvs);
                //        context.Response.ContentType = "text/plain";
                //        context.Response.Write(send);
                //        return;
                //    }
                //    bool rel_success = true;
                //    for (int i = 0; i < s.Length; i++)
                //    {
                //        Model.UserRTU userrtu = new Model.UserRTU();
                //        userrtu.UserName = username;
                //        userrtu.RTUID = s[i];
                //        if (new DAL.UserRTUDAL().AddUserRTU(userrtu) == -1)
                //        {
                //            rel_success = false;
                //        }
                //    }
                //    if (rel_success)
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