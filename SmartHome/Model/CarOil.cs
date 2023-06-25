using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartHome.Model
{
    public class CarOil
    {
        //ID, dateTime, plateNumber, runMiles, oilNumber, oilCapacity, cost, oilStation
        public string dateTime { get; set; }
        public string plateNumber { get; set; }
        public string runMiles { get; set; }
        public string oilNumber { get; set; }
        public string oilCapacity { get; set; }
        public string cost { get; set; }
        public string oilStation { get; set; }
    }
}