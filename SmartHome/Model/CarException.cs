using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartHome.Model
{
    public class CarException
    {
        //ID, brand, name, oilConsumption, insurance, breakRules, maintain, carState
        public string brand { get; set; }
        public string name { get; set; }
        public string oilConsumption { get; set; }
        public string insurance { get; set; }
        public string breakRules { get; set; }
        public string maintain { get; set; }
        public string carState { get; set; }

    }
}