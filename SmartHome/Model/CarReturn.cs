using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartHome.Model
{
    public class CarReturn
    {
        //ID, name, IDCard, depName, carType, dateTime, fromTo, cellPhone, cost, runMiles
        public string name { get; set; }
        public string IDCard { get; set; }
        public string depName { get; set; }
        public string carType { get; set; }
        public string dateTime { get; set; }
        public string fromTo { get; set; }
        public string cellPhone { get; set; }
        public string cost { get; set; }
        public string runMiles { get; set; }
    }
}