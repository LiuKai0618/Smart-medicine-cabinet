using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartHome
{
    public partial class mbManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userlevel"] == null || Session["username"] == null)
            {
                Response.Redirect("login.html");
            }
            string userlevel = Session["userlevel"].ToString();
            string username = Session["username"].ToString();
            if (userlevel == "0")
            {
                this.loginuser.InnerText = "超级管理员：" + username;
            }
            else if (userlevel == "1")
            {
                this.loginuser.InnerText = "管理员：" + username;
            }
            else
            {
                this.loginuser.InnerText = "用户：" + username;
            }
        }
    }
}