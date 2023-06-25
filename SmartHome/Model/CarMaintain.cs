using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartHome.Model
{
    public class CarMaintain
    {
        //ID, brand, driver, dateTime, maintainDep, maintainItem, orderNumber, cost, carState
        public string brand { get; set; }
        public string driver { get; set; }
        public string dateTime { get; set; }
        public string maintainDep { get; set; }
        public string maintainItem { get; set; }
        public string orderNumber { get; set; }
        public string cost { get; set; }
        public string carState { get; set; }
    }
}