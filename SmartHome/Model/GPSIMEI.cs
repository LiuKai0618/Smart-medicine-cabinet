using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartHome.Model
{
    public class GPSIMEI
    {
        //ID, IMEI, DateTime, Latitude, Longitude, Speed, RealTimeLocation, IsLocated, LongitudeEastWest, LatitudeSouthNorth, 
        //Direction, ACC, UploadMode, RealTimeOrSupply, AccumulatedMiles
        public string IMEI { get; set; }
        public string DateTime { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public string Speed { get; set; }
        public string RealTimeLocation { get; set; }
        public string IsLocated { get; set; }
        public string LongitudeEastWest { get; set; }
        public string LatitudeSouthNorth { get; set; }
        public string Direction { get; set; }
        public string ACC { get; set; }
        public string UploadMode { get; set; }
        public string RealTimeOrSupply { get; set; }
        public string AccumulatedMiles { get; set; }

    }
}