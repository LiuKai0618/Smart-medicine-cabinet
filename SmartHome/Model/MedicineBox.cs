using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartHome.Model
{
    public class MedicineBox
    {
        //ID, lnglat, userName, color, boxName
        public string lnglat { get; set; }
        public string userName { get; set; }
        public string color { get; set; }
        public string boxName { get; set; }
    }
}