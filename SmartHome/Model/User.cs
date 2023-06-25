using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartHome.Model
{
    public class User
    {
        //ID, UserName, UserPassword, UserLevel
        public string UserName { get; set; }
        public string UserPassword { get; set; }
        public string UserLevel { get; set; }
    }
}