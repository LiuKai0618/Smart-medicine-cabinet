using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using Newtonsoft.Json;

namespace SmartHome
{
    public class latlong
    {
        public string x { set; get; }
        public string y { set; get; }
    }
    public class resObject
    {
        public string status { get; set; }
        public latlong[] result { set; get; }
    }
    public class HttpClientHelper
    {
        public static string GetResponse(string url)
        {
            //string returnValue = string.Empty;
            HttpWebRequest webReq = (HttpWebRequest)WebRequest.Create(new Uri(url));
            webReq.Method = "GET";
            webReq.ContentType = "application/json";
            using (HttpWebResponse response = (HttpWebResponse)webReq.GetResponse())
            {
                using (StreamReader streamReader = new StreamReader(response.GetResponseStream(), Encoding.UTF8))
                {
                    //return streamReader.ReadToEnd();
                    resObject temp = JsonConvert.DeserializeObject<resObject>(streamReader.ReadToEnd());
                    string longitude = temp.result[0].x;
                    string latitude = temp.result[0].y;
                    return longitude + "*" + latitude;
                }
            }
        }
    }
}