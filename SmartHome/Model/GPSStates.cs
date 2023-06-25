using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartHome.Model
{
    public class GPSStates
    {
        //ID, IPPort, IMEI, GasElectricSwitch, LocationSwitch, Charging, ACC, Garrison, PowerLevel, SignalIntensity, DateTime
        public string IPPort { get; set; }
        public string IMEI { get; set; }
        public string GasElectricSwitch { get; set; }
        public string LocationSwitch { get; set; }
        public string Charging { get; set; }
        public string ACC { get; set; }
        public string Garrison { get; set; }
        public string PowerLevel { get; set; }
        public string SignalIntensity { get; set; }
        public string DateTime { get; set; }

    }
}