using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartHome.Model
{
    public class PersonManage
    {
        //ID, name, sex, IDCard, depID, phoneNumber, jobPosition, education, isCertificated, registeredResidence
        public string name { get; set; }
        public string sex { get; set; }
        public string IDCard { get; set; }
        public string depID { get; set; }
        public string phoneNumber { get; set; }
        public string jobPosition { get; set; }
        public string education { get; set; }
        public string isCertificated { get; set; }
        public string registeredResidence { get; set; }

    }
}