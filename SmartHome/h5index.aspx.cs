using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartHome
{
    public partial class h5index : System.Web.UI.Page
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
                this.welcome.InnerText = "小药箱管理[超级管理员:" + username+"]";
            }
            else if (userlevel == "1")
            {
                this.welcome.InnerText = "小药箱管理[管理员:" + username + "]";
            }
            else
            {
                this.welcome.InnerText = "小药箱管理[用户:" + username + "]";
            }
            //if (Session["userlevel"] == null || Session["username"] == null)
            //{
            //    Response.Redirect("h5login.html");
            //}
            //string userlevel = Session["userlevel"].ToString();
            //string username = Session["username"].ToString();
        }
    }
}