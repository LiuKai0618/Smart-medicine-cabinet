using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.Script.Serialization;

namespace SmartHome
{
    /// <summary>
    /// personManage1 的摘要说明
    /// </summary>
    public class personManage1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string action = context.Request["action"].Trim().ToString();
            context.Response.ContentType = "text/html";

            if (action == "personInfor")
            {
                //ID, name, sex, IDCard, depID, phoneNumber, jobPosition, education, isCertificated, registeredResidence
                List<Model.PersonManage> list = new DAL.PersonManageDAL().GetList();
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
                        trs.Append("<tr>");
                        trs.Append("<td>" + list[i].name + "</td>");
                        trs.Append("<td>" + list[i].sex + "</td>");
                        trs.Append("<td>" + list[i].IDCard + "</td>");
                        trs.Append("<td>" + list[i].depID + "</td>");
                        trs.Append("<td>" + list[i].phoneNumber + "</td>");
                        trs.Append("<td>" + list[i].jobPosition + "</td>");
                        trs.Append("<td>" + list[i].education + "</td>");
                        trs.Append("<td>" + list[i].isCertificated + "</td>");
                        trs.Append("<td>" + list[i].registeredResidence + "</td>");
                        trs.Append("<td><button type='button' class='btn btn-mini btn-primary'>修改</button>");
                        trs.Append("<button type='button' class='btn btn-mini btn-danger' style='margin-left:3px;'>删除</button></td>");
                        trs.Append("</tr>");
                    }
                    context.Response.Write(trs);
                }
                //List<string> users = new List<string>();
                //List<Model.User> userlist = new DAL.UserDAL().GetList();
                //if (userlist == null) { return; }
                //if (userlist.Count == 0) { return; }
                //for (int i = 0; i < userlist.Count; i++)
                //{
                //    if (userlist[i].UserLevel != "0")
                //    {
                //        users.Add(userlist[i].UserName);
                //    }

                //}
                //Dictionary<string, List<string>> kvs = new Dictionary<string, List<string>>();
                //kvs["usernamelist"] = users;
                //JavaScriptSerializer serializer = new JavaScriptSerializer();
                //string send = serializer.Serialize(kvs);

                //context.Response.ContentType = "text/plain";
                //context.Response.Write(send);

            }
            else if (action == "addPerson")
            {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                Dictionary<string, string> kvs = new Dictionary<string, string>();
                //name, sex, IDCard, depID, phoneNumber, jobPosition, education, isCertificated, registeredResidence
                Model.PersonManage person = new Model.PersonManage();
                person.name = context.Request["name"];
                person.sex = context.Request["sex"];
                person.IDCard = context.Request["IDCard"];
                person.depID = context.Request["depID"];
                person.phoneNumber = context.Request["phoneNumber"];
                person.jobPosition = context.Request["jobPosition"];
                person.education = context.Request["education"];
                person.isCertificated = context.Request["isCertificated"];
                person.registeredResidence = context.Request["registeredResidence"];
                if (new DAL.PersonManageDAL().GetPersonbyIDCard(person.IDCard) != null)
                {
                    kvs["err_message"] = "personIsExist";
                    string send = serializer.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(send);
                    return;
                }
                //如果身份证号不重复的话，再判断人名是否重复，如果重复，则在名字后加1-3位随机数
                bool nameaddone = false;
                List<Model.PersonManage> personlist = new DAL.PersonManageDAL().GetList();
                string tempName = person.name;
                //-------------------------------------1----------------------------------------------------
                if (personlist != null)
                {
                    for (int i = 0; i < personlist.Count; i++)
                    {
                        if (personlist[i].name == person.name)
                        {
                            Random ran = new Random();
                            int RandKey = ran.Next(100, 999);
                            //int RandKey = ran.Next(0, 9);
                            tempName = person.name + RandKey.ToString();
                            nameaddone = true;
                        }
                    }
                }
                //-------------------------------------2----------------------------------------------------
                if (personlist != null)
                {
                    for (int i = 0; i < personlist.Count; i++)
                    {
                        if (personlist[i].name == tempName)
                        {
                            Random ran = new Random();
                            int RandKey = ran.Next(100, 999);
                            //int RandKey = ran.Next(0, 9);
                            tempName = person.name + RandKey.ToString();
                            //nameaddone = true;
                        }
                    }
                }
                //-------------------------------------3----------------------------------------------------
                if (personlist != null)
                {
                    for (int i = 0; i < personlist.Count; i++)
                    {
                        if (personlist[i].name == tempName)
                        {
                            Random ran = new Random();
                            int RandKey = ran.Next(100, 999);
                            //int RandKey = ran.Next(0, 9);
                            tempName = person.name + RandKey.ToString();
                            //nameaddone = true;
                        }
                    }
                }
                //-----------------------------------------------------------------------------------------
                person.name = tempName;

                if (new DAL.PersonManageDAL().AddPerson(person) != -1)
                {
                    if (nameaddone)
                    {
                        kvs["success"] = "success_addone";
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
                    
                }
                else
                {
                    kvs["err_message"] = "addFailure";
                    string send = serializer.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(send);
                }

            }
            else if (action == "delPerson")
            {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                Dictionary<string, string> kvs = new Dictionary<string, string>();
                //name, sex, IDCard, depID, phoneNumber, jobPosition, education, isCertificated, registeredResidence
                //Model.PersonManage person = new Model.PersonManage();               
                string IDCard = context.Request["IDCard"];

                if (new DAL.PersonManageDAL().DeletePersonbyIDCard(IDCard) != -1)
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
            else if (action == "editPerson")
            {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                Dictionary<string, string> kvs = new Dictionary<string, string>();
                //name, sex, IDCard, depID, phoneNumber, jobPosition, education, isCertificated, registeredResidence
                Model.PersonManage person = new Model.PersonManage();
                person.name = context.Request["name"];
                person.sex = context.Request["sex"];
                person.IDCard = context.Request["IDCard"];
                person.depID = context.Request["depID"];
                person.phoneNumber = context.Request["phoneNumber"];
                person.jobPosition = context.Request["jobPosition"];
                person.education = context.Request["education"];
                person.isCertificated = context.Request["isCertificated"];
                person.registeredResidence = context.Request["registeredResidence"];

                if (new DAL.PersonManageDAL().EditPerson(person) != -1)
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
            else if (action == "depInfor")
            {                
                List<Model.DepManage> list = new DAL.DepManageDAL().GetList();
                StringBuilder trs = new StringBuilder();
                if (list == null)
                {
                    trs.Append("<option value='nodata'>空数据</option>");
                    context.Response.Write(trs);
                    return;
                }
                for (int i = 0; i < list.Count; i++)
                {
                    trs.Append("<option value='" + list[i].depName + "'>" + list[i].depName + "</option>");
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