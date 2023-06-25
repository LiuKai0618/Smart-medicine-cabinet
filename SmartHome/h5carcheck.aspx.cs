using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartHome
{
    public partial class h5carcheck : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userlevel"] == null || Session["username"] == null)
            {
                Response.Redirect("h5login.html");
            }
            string userlevel = Session["userlevel"].ToString();
            string username = Session["username"].ToString();
            if (userlevel == "0")
            {
                this.welcome.InnerText = "用车审批[超级管理员:" + username + "]";
                //this.loginuser.InnerText = "超级管理员：" + username;
            }
            else if (userlevel == "1")
            {
                this.welcome.InnerText = "用车审批[管理员:" + username + "]";
                //this.loginuser.InnerText = "管理员：" + username;
                //Response.Redirect("login.html");
            }
            else
            {
                this.welcome.InnerText = "用车审批[用户:" + username + "]";
                //this.carcheck.Style.Add("display", "none");
                //this.loginuser.InnerText = "用户：" + username;
                //Response.Redirect("h5login.html");
            }
            //if (userlevel == "0")
            //{
            //    this.welcome.InnerText = "用车审批[超级管理员:" + username + "]";
            //}
            //else if (userlevel == "1")
            //{
            //    this.welcome.InnerText = "用车审批[管理员:" + username + "]";
            //}
            //else
            //{
            //    this.welcome.InnerText = "用车审批[用户:" + username + "]";
            //}




        }
    }
}