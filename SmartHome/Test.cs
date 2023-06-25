using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

namespace SmartHome
{
    //public class latlong
    //{
    //    public string x { set; get; }
    //    public string y { set; get; }
    //}
    //public class resObject
    //{
    //    public string status { get; set; }
    //    public latlong[] result { set; get; } 
    //}
    public class Test
    {
        //0x78,0x78,0x11,0x01,0x08,0x68,0x12,0x02,0x47,0x90,0x07,0x87,0x50,0x04,0x32,0x02,0x00,0x2b,0x21,0xfa,0x0d,0x0a
        //{"status":0,"result":[{"x":114.2307519546763,"y":29.57908428837437}]}
        public void tt()
        {
            //http://api.map.baidu.com/geoconv/v1/?coords=114.21892734521,29.575429778924&from=1&to=5&ak=8MZLMmFUIhAg2sI7ITa5RlsR6KEZdzAG
            string Longitude = "114.21892734521";
            string Latitude = "29.575429778924";
            string urltemp = "http://api.map.baidu.com/geoconv/v1/?coords=" + Longitude + "," + Latitude + "&from=1&to=5&ak=8MZLMmFUIhAg2sI7ITa5RlsR6KEZdzAG";
            string[] res = HttpClientHelper.GetResponse(urltemp).Split('*');
            string t1 = res[0];
            string t2 = res[1];
            //resObject temp= JsonConvert.DeserializeObject<resObject>(res);
            //string longitude=temp.result[0].x;
            //string latitude = temp.result[0].y;



            //byte[] receiveBytes = new byte[] { 0x78, 0x78, 0xc5, 0x43, 0x15, 0x01, 0x12, 0x12, 0x07, 0x00, 0x07, 0x87, 0x50, 0x04, 0x32, 0x02, 0x00, 0x2b, 0x21, 0xfa, 0x0 };
            //int yearint = Convert.ToInt32(receiveBytes[4])+2000;
            //int monthint = Convert.ToInt32(receiveBytes[5]);
            //int dateint = Convert.ToInt32(receiveBytes[6]);
            //int hourint = Convert.ToInt32(receiveBytes[7]);
            //int minuteint = Convert.ToInt32(receiveBytes[8]);
            //int secondint = Convert.ToInt32(receiveBytes[9]);

            //int hournew = (hourint + 8) % 24;
            //int datenew = dateint + (hourint + 8) / 24;
            //int mou=date
            //DateTime gpsdatetime = new DateTime(yearint, monthint, dateint, hourint, minuteint, secondint);

            //string beijingtime = gpsdatetime.AddHours(8).ToString();

            //byte[] receiveBytes =new byte[] { 0x78, 0x78, 0xc5, 0x43, 0x08, 0x68, 0x12, 0x02, 0x47, 0x90, 0x07, 0x87, 0x50, 0x04, 0x32, 0x02, 0x00, 0x2b, 0x21, 0xfa, 0x0d, 0x0a };

            //int degree = (receiveBytes[2] & 2) * 512 + (receiveBytes[2] & 1) * 256 + Convert.ToInt32(receiveBytes[3]);
            //byte[] receive = new byte[] { 0x78, 0x78, 0x03, 0xee, 0x3b, 0xc4, 0x00, 0x00, 0x0d, 0x0a };
            //int ddd = receive[2] << 24;
            //int www = receive[3] << 16;
            //int yyy = receive[4] << 8;
            //int ooo = receive[5];
            //int ssss = ddd + www + yyy + ooo;
            //double d = Convert.ToDouble(ssss);
            //double jjj = d / 1800000;

            //int pppp = receive[2] << 24 + receive[3] << 16 + receive[4] << 8 + receive[5];
            //double uuuuuuu = Convert.ToDouble(pppp) / 1800000;
            //byte[] receive = new byte[] { 0x78, 0x78, 0x05, 0x01, 0x00, 0x05, 0x00, 0x00, 0x0d, 0x0a };
            //Crc.AutoFillXorBytes(receive);
            //byte[] receive = new byte[] { 0x78, 0x78, 0x11, 0x01, 0x08, 0x68, 0x12, 0x02, 0x47, 0x90, 0x07, 0x87, 0x50, 0x04, 0x32, 0x02, 0x00, 0x2b, 0x21, 0xfa, 0x0d, 0x0a };
            //bool que = Crc.IsCrcGoodByAllBytes(receive);
            //byte[] xorbyte = new byte[2];
            //Crc.GetCrc16(receive,receive.Length,ref xorbyte);
            //byte[] xorbyte2 = new byte[] { 0x21, 0xfa };
        }
    }
}