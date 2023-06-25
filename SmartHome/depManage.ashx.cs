using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.Script.Serialization;

namespace SmartHome
{
    /// <summary>
    /// depManage1 的摘要说明
    /// </summary>
    public class depManage1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string action = context.Request["action"].Trim().ToString();
            context.Response.ContentType = "text/html";

            if (action == "depInfor")
            {
                //ID, depID, depParentID, depName, depHeader, depPhone, remark
                List<Model.DepManage> list = new DAL.DepManageDAL().GetList();
                StringBuilder trs = new StringBuilder();
                if (list == null)
                {
                    trs.Append("<tr><td colspan='7' style='text-align:center;font-size:10px;font-weight:bold;color:#666666;background:#efefef'>表 格 数 据 为 空！</td></tr>");
                    context.Response.Write(trs);
                }
                else if (list.Count == 0)
                {
                    trs.Append("<tr><td colspan='7' style='text-align:center;font-size:10px;font-weight:bold;color:#666666;background:#efefef'>表 格 数 据 为 空！</td></tr>");
                    context.Response.Write(trs);
                }
                else
                {
                    for (int i = 0; i < list.Count; i++)
                    {
                        //ID, depID, depParentID, depName, depHeader, depPhone, remark
                        trs.Append("<tr>");
                        trs.Append("<td>" + list[i].depID + "</td>");
                        trs.Append("<td>" + list[i].depParentID + "</td>");
                        trs.Append("<td>" + list[i].depName + "</td>");
                        trs.Append("<td>" + list[i].depHeader + "</td>");
                        trs.Append("<td>" + list[i].depPhone + "</td>");
                        trs.Append("<td>" + list[i].remark + "</td>");
                        trs.Append("<td><button type='button' class='btn btn-mini btn-primary'>修改</button>");
                        trs.Append("<button type='button' class='btn btn-mini btn-danger' style='margin-left:3px;'>删除</button></td>");
                        trs.Append("</tr>");
                    }
                    context.Response.Write(trs);
                }
               

            }
            else if (action == "addDep")
            {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                Dictionary<string, string> kvs = new Dictionary<string, string>();
                //ID, depID, depParentID, depName, depHeader, depPhone, remark
                Model.DepManage dep = new Model.DepManage();
                dep.depID = context.Request["depID"];
                dep.depParentID = context.Request["depParentID"];
                dep.depName = context.Request["depName"];
                dep.depHeader = context.Request["depHeader"];
                dep.depPhone = context.Request["depPhone"];
                dep.remark = context.Request["remark"];

                if (new DAL.DepManageDAL().GetDepbyDepID(dep.depID) != null)
                {
                    kvs["err_message"] = "depIsExist";
                    string send = serializer.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(send);
                    return;
                }
                if (new DAL.DepManageDAL().AddDep(dep) != -1)
                {
                    kvs["success"] = "success";
                    string send = serializer.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(send);
                }
                else
                {
                    kvs["err_message"] = "addFailure";
                    string send = serializer.Serialize(kvs);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(send);
                }

            }
            else if (action == "delDep")
            {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                Dictionary<string, string> kvs = new Dictionary<string, string>();
                //ID, depID, depParentID, depName, depHeader, depPhone, remark              
                string depID = context.Request["depID"];

                if (new DAL.DepManageDAL().DeleteDepbyDepID(depID) != -1)
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
            else if (action == "editDep")
            {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                Dictionary<string, string> kvs = new Dictionary<string, string>();
                //ID, depID, depParentID, depName, depHeader, depPhone, remark 
                Model.DepManage dep = new Model.DepManage();
                dep.depID = context.Request["depID"];
                dep.depParentID = context.Request["depParentID"];
                dep.depName = context.Request["depName"];
                dep.depHeader = context.Request["depHeader"];
                dep.depPhone = context.Request["depPhone"];
                dep.remark = context.Request["remark"];

                if (new DAL.DepManageDAL().EditDep(dep) != -1)
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