using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartHome.Model
{
    public class CarTrack
    {
        //ID, plateNumber, startTime, endTime, userName, trackName
        public string plateNumber { get; set; }
        public string startTime { get; set; }
        public string endTime { get; set; }
        public string userName { get; set; }
        public string trackName { get; set; }

        public string orgin { get; set; }

        public string destination { get; set; }
    }
}