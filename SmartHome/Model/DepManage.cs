using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartHome.Model
{
    public class DepManage
    {
        //ID, depID, depParentID, depName, depHeader, depPhone, remark
        public string depID { get; set; }
        public string depParentID { get; set; }
        public string depName { get; set; }
        public string depHeader { get; set; }
        public string depPhone { get; set; }
        public string remark { get; set; }
    }
}