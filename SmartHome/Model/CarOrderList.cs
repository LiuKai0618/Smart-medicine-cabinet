using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartHome.Model
{
    public class CarOrderList
    {
        //ID, loginUser, name, carPlateNumber, carUseTime, fromTo, IDCard, depName, cellPhone, carState, bossUser, dateTime
        public string loginUser { get; set; }
        public string name { get; set; }
        public string carPlateNumber { get; set; }
        public string carUseTime { get; set; }
        public string fromTo { get; set; }
        public string IDCard { get; set; }
        public string depName { get; set; }
        public string cellPhone { get; set; }
        public string carState { get; set; }
        public string bossUser { get; set; }
        public string dateTime { get; set; }
    }
}