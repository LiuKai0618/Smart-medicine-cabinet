using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace SmartHome
{
    public class Global : System.Web.HttpApplication
    {
        public MyTcpServer tcpServer = null;

        protected void Application_Start(object sender, EventArgs e)
        {
            //new FileReadHelper().test(@"C:\123.xlsx");
            //new Test().tt();
            //tcpServer = new MyTcpServer();
            tcpServer = MyTcpServer.GetInstance();
            //tcpServer.OpenServer(8080);
            tcpServer.OpenServer();
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {
            tcpServer.CloseServer();
        }
    }
}