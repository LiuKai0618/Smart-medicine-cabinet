using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartHome
{
    public class mapDistance1
    {
        private const double EARTH_RADIUS = 6378137;
        /// 计算两点位置的距离，返回两点的距离，单位 米
        /// 该公式为GOOGLE提供，误差小于0.2米
        ///

        ///第一点纬度 ///第一点经度 ///第二点纬度 ///第二点经度 ///
        public static double GetDistance(double lat1, double lng1, double lat2, double lng2)
        {
            double radLat1 = Rad(lat1);
            double radLng1 = Rad(lng1);
            double radLat2 = Rad(lat2);
            double radLng2 = Rad(lng2);
            double a = radLat1 - radLat2;
            double b = radLng1 - radLng2;
            double result = 2 * Math.Asin(Math.Sqrt(Math.Pow(Math.Sin(a / 2), 2) + Math.Cos(radLat1) * Math.Cos(radLat2) * Math.Pow(Math.Sin(b / 2), 2))) * EARTH_RADIUS;
            return result;
        }

        ///

        /// 经纬度转化成弧度
        ///

        //////
        private static double Rad(double d)
        {
            return (double)d * Math.PI / 180d;
        }
    }
}