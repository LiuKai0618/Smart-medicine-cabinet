<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bigscreen.aspx.cs" Inherits="SmartHome.bigscreen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   
     <%--<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=8MZLMmFUIhAg2sI7ITa5RlsR6KEZdzAG"></script>--%>
     <script src="http://api.map.baidu.com/api?type=webgl&v=1.0&ak=8MZLMmFUIhAg2sI7ITa5RlsR6KEZdzAG"></script>
<title>新左旗车辆管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/fullcalendar.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link rel="stylesheet" href="css/uniform.css" />
<link rel="stylesheet" href="css/select2.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<!--<link rel="stylesheet" href="css/jquery.gritter.css" />-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'/>

    
<style type="text/css">
	body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
      .BMap_cpyCtrl {
            display: none;
        }
        .anchorBL {
            display: none;
        }

	</style>


</head>
<body style="margin-top:0px;width:100%;margin:auto;">
   <%-- <body style="margin-top:0px;width:650px;margin:auto;">--%>
     <div id="allmap" style="background-color:red;width:100%;height:100%;margin:0px;padding:0px;">

        </div>


      <script src="js/jquery.min.js"></script>
    <script src="js/jquery.ui.custom.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.uniform.js"></script>
    <script src="js/select2.min.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/matrix.js"></script>
    <script src="js/matrix.tables.js"></script>
    <%--<script src="js/timeout2login.js" type="text/javascript"></script>--%>
  <%--   <script src="js/feetbackdisplayornot.js" type="text/javascript"></script>--%>
     <%--<script src="js/warning.js" type="text/javascript"></script>--%>
    <script type="text/javascript">
        $(function () {
            //--------------------------------------------------------------------------------------------//
            var mbCount = 0;
            var lnglatList=[];
            function getallmb() {
                $.ajax({
                    type: "post",                          //提交方式
                    url: "h5marker.ashx",        //一般处理程序的路径
                    data: { action: "allmbs" },           //向后台传入的值
                    dataType: "text",                       //返回值格式
                    //dataType: "json",                       //返回值格式
                    success: function (data) {
                        if (data["err_message"]) {
                            //清除所有小药箱，个数为0
                            mbCount = 0;
                            //-----------------------------------------------------------
                            //清除地图上的小药箱
                            if (lnglatList.length > 0) {
                                for (var i = 0; i < lnglatList.length; i++) {
                                    map.removeOverlay(lnglatList[i]);
                                }
                            }
                            lnglatList = [];
                            //--------------------------------------------------------
                            return;
                        }
                        var maps = eval("(" + data + ")");
                        mbCount = maps.length;
                        //alert(mbCount);
                        //-----------------------------------------------------------
                        //清除地图上的小药箱
                        if (lnglatList.length > 0) {
                            for (var i = 0; i < lnglatList.length; i++) {
                                map.removeOverlay(lnglatList[i]);
                            }
                        }
                        lnglatList = [];
                        //--------------------------------------------------------
                        $.each(maps, function (idx, obj) {
                            var json = JSON.parse(obj);
                            var lnglat = json["lnglat"];
                            var color = json["color"];
                            var temp = lnglat.split('*');
                            //--------------------------------
                            //alert(temp[0]);
                            //alert(temp[1]);
                            //var baonew1 = new BMapGL.Icon("img/xyx" + color + ".png", new BMapGL.Size(32, 28));
                            var baonew1 = new BMapGL.Icon("img/xyx" + color + ".png", new BMapGL.Size(16, 14));
                            //var baonew1 = new BMapGL.Icon("img/baonew1.png", new BMapGL.Size(26, 13));
                            var markerbao = new BMapGL.Marker(new BMapGL.Point(temp[0], temp[1]), { icon: baonew1 });
                            map.addOverlay(markerbao);
                            lnglatList.push(markerbao);

                        });
                        //console.log(carOutCount);
                        //var outnumber = carOutCount["0868120253315557"] + carOutCount["0868120253318031"] + carOutCount["0868120253317967"] + carOutCount["0868120253317975"];
                        //var runmiles = carRunMiles["0868120253315557"] + carRunMiles["0868120253318031"] + carRunMiles["0868120253317967"] + carRunMiles["0868120253317975"];
                        //var runKM = runmiles / 1000;
                        //label.setContent('<span style="font-size:14px">新巴尔虎左旗</span><br/>出车总次数： ' + outnumber + '次<br/>出车总里程： ' + parseInt(runKM) + 'Km<br/>小药箱： 45678');


                    },
                    complete: function (XMLHttpRequest, textStatus) {

                    },
                });
            }
            //--------------------------------------------------------------------------------------------//
            //--------------------------------------------------------------------------------------------//

            //------------------------------------ajax 得到最新的出行次数-------------------------------------------------------//
            function getCarOutCount() {
                $.ajax({
                    type: "post",                          //提交方式
                    url: "bigscreen.ashx",        //一般处理程序的路径
                    data: { name: "outCounts" },           //向后台传入的值
                    dataType: "text",                       //返回值格式
                    //dataType: "json",                       //返回值格式
                    success: function (data) {
                        if (data.error_key) {
                            return;
                        }
                        var maps = eval("(" + data + ")");
                        $.each(maps, function (idx, obj) {
                            var json = JSON.parse(obj);
                            var imei = IMEIByPlateNumber(json["plateNumber"]);
                            carOutCount[imei] = parseInt(json["visitCount"]);
                            carRunMiles[imei] = parseInt(json["runMiles"]);

                        });                       
                        //console.log(carOutCount);
                        var outnumber = carOutCount["0868120253315557"] + carOutCount["0868120253318031"] + carOutCount["0868120253317967"] + carOutCount["0868120253317975"] + carOutCount["0868120253318080"] + carOutCount["0868120253315532"] + carOutCount["0868120253320144"] + carOutCount["0868120253317983"] + carOutCount["0868120253315474"];
                        var runmiles = carRunMiles["0868120253315557"] + carRunMiles["0868120253318031"] + carRunMiles["0868120253317967"] + carRunMiles["0868120253317975"] + carRunMiles["0868120253318080"] + carRunMiles["0868120253315532"] + carRunMiles["0868120253320144"] + carRunMiles["0868120253317983"] + carRunMiles["0868120253315474"];
                        var runKM = runmiles / 1000;
                        label.setContent('<span style="font-size:14px">新巴尔虎左旗</span><br/>出车总次数： ' + outnumber + '次<br/>出车总里程： ' + parseInt(runKM) + 'Km<br/>小药箱： '+mbCount);


                    },
                    complete: function (XMLHttpRequest, textStatus) {

                    },
                });

            }
            //--------------------------------------ajax将最新的出行次数发送至服务器更新------------------------------------------------------//
            function sendCarOutCount(plateNumber,outCount) {
                $.ajax({
                    type: "post",                          //提交方式
                    url: "bigscreen.ashx",        //一般处理程序的路径
                    data: { name: plateNumber,carout:outCount },           //向后台传入的值
                    dataType: "text",                       //返回值格式
                    //dataType: "json",                       //返回值格式
                    success: function (data) {
                        //if (data.error_key) {
                        //    return;
                        //}
                        //var maps = eval("(" + data + ")");
                        //$.each(maps, function (idx, obj) {
                        //    var json = JSON.parse(obj);
                        //    var imei = IMEIByPlateNumber(json["plateNumber"]);
                        //    carOutCount[imei] = parseInt(json["visitCount"]);
                        //});
                        //console.log(carOutCount);

                    },
                    complete: function (XMLHttpRequest, textStatus) {

                    },


                });
            }
            //--------------------------------------------------------------------------------------------//
            //--------------------------根据车牌号返回imei------------------------------------------------------------------//
            function IMEIByPlateNumber(plateNumber) {
                if (plateNumber == "蒙E9390B") {
                    return "0868120253315557";
                }
                else if (plateNumber == "蒙E7560P") {
                    return "0868120253317967";
                }
                else if (plateNumber == "蒙EFQ920") {
                    return "0868120253317975";
                }
                else if (plateNumber == "蒙E1759P") {
                    return "0868120253318031";
                }
                else if (plateNumber == "鲁A66666") {
                    return "0868120247900787";
                }
                else if (plateNumber == "蒙E0373F") {
                    return "0868120253318080";
                }
                else if (plateNumber == "蒙E1795P") {
                    return "0868120253315532";
                }
                else if (plateNumber == "蒙E2338M") {
                    return "0868120253320144";
                }
                else if (plateNumber == "蒙E2809N") {
                    return "0868120253317983";
                }
                else if (plateNumber == "蒙E2750N") {
                    return "0868120253315474";
                }
                else if (plateNumber == "蒙EHD909") {
                    return "0868120253315573";
                }
                else {
                    return "未知IMEI";
                }
            }
            //--------------------根据imei返回车牌号------------------------------------------------------------------------//
            function plateNumberByIMEI(imei) {
                if (imei == "0868120253315557") {
                    return "蒙E9390B";
                }
                else if (imei == "0868120253317967") {
                    return "蒙E7560P";
                }
                else if (imei == "0868120253317975") {
                    return "蒙EFQ920";
                }
                else if (imei == "0868120253318031") {
                    return "蒙E1759P";
                }
                else if (imei == "0868120247900787") {
                    return "鲁A66666";
                }
                else if (imei == "0868120253318080") {
                    return "蒙E0373F";
                }
                else if (imei == "0868120253315532") {
                    return "蒙E1795P";
                }
                else if (imei == "0868120253320144") {
                    return "蒙E2338M";
                }
                else if (imei == "0868120253317983") {
                    return "蒙E2809N";
                }
                else if (imei == "0868120253315474") {
                    return "蒙E2750N";
                }
                else if (imei == "0868120253315573") {
                    return "蒙EHD909";
                }
                else {
                    return "未知车牌";
                }
            }
            //--------------------------------------------------------------------------------------------//  
            //ID, IMEI, DateTime, Latitude, Longitude, Speed, RealTimeLocation, IsLocated, LongitudeEastWest, LatitudeSouthNorth, 
            //Direction, ACC, UploadMode, RealTimeOrSupply, AccumulatedMiles
            function GPSIMEI(IMEI, DateTime, Latitude, Longitude, Speed, RealTimeLocation, IsLocated, LongitudeEastWest, LatitudeSouthNorth,Direction, ACC, UploadMode, RealTimeOrSupply) {
                this.IMEI = IMEI;
                this.DateTime = DateTime;
                this.Latitude = Latitude;
                this.Longitude = Longitude;
                this.Speed = Speed;
                this.RealTimeLocation = RealTimeLocation;
                this.IsLocated = IsLocated;
                this.LongitudeEastWest = LongitudeEastWest;
                this.LatitudeSouthNorth = LatitudeSouthNorth;
                this.Direction = Direction;
                this.ACC = ACC;
                this.UploadMode = UploadMode;
                this.RealTimeOrSupply = RealTimeOrSupply;
            };
            //----------------------------------转换百度坐标，划线，小汽车marker----------------------------------------------------------//

            var carRunMiles = { "0868120253315557": 1, "0868120253318031": 2, "0868120253317967": 3, "0868120253317975": 4, "0868120253318080": 1, "0868120253315532": 2, "0868120253320144": 3, "0868120253317983": 4, "0868120253315474": 5, "0868120253315573": 6 };
            //---------------------------------------ajax 得到最新的出行次数--------------------------------------------
            var carOutCount = { "0868120253315557": 1, "0868120253318031": 2, "0868120253317967": 3, "0868120253317975": 4, "0868120253318080": 1, "0868120253315532": 2, "0868120253320144": 3, "0868120253317983": 4, "0868120253315474": 5, "0868120253315573": 6 };
            //var carOutCount = { "0868120253315557": 4, "0868120253318031": 5, "0868120253317967": 6, "0868120253317975": 7 };
            //------------每1分钟更新行驶里程和出车次数----------------------------------------------------------------------------------------//
            getallmb();
            setInterval(getallmb, 59000);
            getCarOutCount();
            setInterval(getCarOutCount, 60000);
            //getallmb();
            //setInterval(getallmb, 59000);
            //getCarOutCount();            
            //-----------------------------------------------------------------------------------------------------------------            
            //var carLastPosition = { "0868120253315557": 0, "0868120253318031": 0, "0868120253317967": 0, "0868120253317975": 0 };//0表示小于1千米，1表示大于1千米
            //-----------------------------------------------------------------------------------------------------------------
            function processGPSByMe(gpslist) {
                var points = [];
                for (var i = 0; i < gpslist.length; i++) {
                    points.push(new BMapGL.Point(gpslist[i].Longitude, gpslist[i].Latitude));
                }
                //-----------------------------------------------------------------------------------
                var lastIndex = points.length - 1;
                var tempPoint = points[lastIndex];
                //var myIconError = new BMapGL.Icon("img/car.png", new BMapGL.Size(25, 25));
                var myIconError = new BMapGL.Icon("img/car.png", new BMapGL.Size(30, 30));
                var marker = new BMapGL.Marker(tempPoint, { icon: myIconError });  
                marker.setTitle(plateNumberByIMEI(gpslist[lastIndex].IMEI));
                marker.customData = {
                    Speed: gpslist[lastIndex].Speed, RealTimeLocation: gpslist[lastIndex].RealTimeLocation, IsLocated: gpslist[lastIndex].IsLocated,
                    Direction: gpslist[lastIndex].Direction, UploadMode: gpslist[lastIndex].UploadMode, RealTimeOrSupply: gpslist[lastIndex].RealTimeOrSupply,
                    DateTime: gpslist[lastIndex].DateTime, LongitudeEastWest: gpslist[lastIndex].LongitudeEastWest, LatitudeSouthNorth: gpslist[lastIndex].LatitudeSouthNorth,
                    ACC: gpslist[lastIndex].ACC, PlateNumber: plateNumberByIMEI(gpslist[lastIndex].IMEI), IMEI: gpslist[lastIndex].IMEI
                };
                map.addOverlay(marker);              
                marker.addEventListener("click", test);
                //---------------------------------------------------------------------------------------
                var polyline = new BMapGL.Polyline(points, {
                    enableEditing: false,//是否启用线编辑，默认为false
                    enableClicking: false,//是否响应点击事件，默认为true
                    //strokeStyle: 'solid',
                    //geodesic:true,
                    //icons: [icons],
                    strokeWeight: '1',//折线的宽度，以像素为单位
                    strokeOpacity: 1,//折线的透明度，取值范围0 - 1
                    strokeColor: "#ff0000" //折线颜色18a45b
                });

                map.addOverlay(polyline);
                //-------------------------------------------------------------------------------------------

            }
            //--------------------------------------------------------------------------------------------//
            function processGPS(gpslist)
            {
                //points
                var points = [];
                for (var i = 0; i < gpslist.length; i++)
                {
                    points.push(new BMapGL.Point(gpslist[i].Longitude, gpslist[i].Latitude));
                }
                //------------------------------------------------------------------------------------------
                //坐标转换完之后的回调函数
                translateCallback = function (data) {
                    if (data.status === 0) {
                        //-------------------------根据最新的点计算和所属医院的距离，判断出行次数--------
                        var lastIndex = data.points.length - 1;
                        //var tempIMEI = gpslist[lastIndex].IMEI;
                        //-------------------------根据最新的点计算和所属医院的距离，判断出行次数--------
                        //var startPoint = new BMapGL.Point(118.252051, 48.214831);

                        //if (tempIMEI == "0868120253315557") {
                        //    //蒙E9390B 锡林社区卫生服务中心 0868120253315557
                        //    startPoint = new BMapGL.Point(118.252051, 48.214831);
                        //}
                        //else if (tempIMEI == "0868120253318031") {
                        //    startPoint = new BMapGL.Point(118.244368, 48.482403);
                        //}
                        //else if (tempIMEI == "0868120253317967") {
                        //    startPoint = new BMapGL.Point(118.587308, 48.318963);
                        //}
                        //else if (tempIMEI == "0868120253317975") {
                        //    startPoint = new BMapGL.Point(118.405940, 48.814551);
                        //}
                        

                        //var endPoint = data.points[lastIndex];
                        //var dis = map.getDistance(startPoint, endPoint);
                        //console.log(gpslist[lastIndex].IMEI);
                        //console.log(dis);
                        //console.log(parseInt(dis));
                        //var tempIMEI = gpslist[lastIndex].IMEI;
                        //更新出行次数，和上次位置比对，同时将最新位置信息写入最新位置字典
                        //if (parseInt(dis) < 1000) {
                        //    if (carLastPosition[tempIMEI] == 1) {
                        //        //出行归来,更新出行次数
                        //        //var temp = carOutCount[tempIMEI];
                        //        //carOutCount[tempIMEI] = temp + 1;
                        //        //ajax 将出行次数更新至服务器
                        //        sendCarOutCount(plateNumberByIMEI(tempIMEI), 1);                               
                        //        ////更新map上的label
                        //        //var outnumber = carOutCount["0868120253315557"] + carOutCount["0868120253318031"] + carOutCount["0868120253317967"] + carOutCount["0868120253317975"]
                        //        //label.setContent('新巴尔虎左旗<br/>出车总次数：' + outnumber + '<br/>出车总里程：56789Km<br/>小药箱：45678');
                                
                        //        //console.log(map.getOverlays().length);
                        //        //console.log(map.getOverlays());
                        //    }
                        //    carLastPosition[tempIMEI] = 0;
                        //}
                        //else {
                        //    carLastPosition[tempIMEI] = 1;
                        //}
                        //---------------------------此处更新lable显示，出行次数和行驶里程----------------------------------------------------------------------
                        //更新map上的label
                        //var outnumber = carOutCount["0868120253315557"] + carOutCount["0868120253318031"] + carOutCount["0868120253317967"] + carOutCount["0868120253317975"];
                        //var runmiles = carRunMiles["0868120253315557"] + carRunMiles["0868120253318031"] + carRunMiles["0868120253317967"] + carRunMiles["0868120253317975"];
                        //var runKM = runmiles / 1000;
                        //label.setContent('<span style="font-size:14px">新巴尔虎左旗</span><br/>出车总次数： ' + outnumber + '次<br/>出车总里程： ' + parseInt(runKM) + 'Km<br/>小药箱： 45678');

                        //sendCarOutCount("蒙E9390B", 12);
                        //------------------------------------------------------------------------------------------
                        //最后一个点加maker和注册点击事件，所有的点连线
                        //------------------------------------------------------------------------------------------
                        //console.log(gpslist);
                        //var outnumber = carOutCount["0868120253315557"] + carOutCount["0868120253318031"] + carOutCount["0868120253317967"] + carOutCount["0868120253317975"]
                        //label.setContent('新巴尔虎左旗<br/>出车总次数：'+outnumber+'<br/>出车总里程：56789Km<br/>小药箱：45678');
                        //console.log(map.getOverlays().length);
                        //console.log(map.getOverlays());
                        //------------------------------------------------------------------------------------------

                        var tempPoint = data.points[lastIndex];
                        var myIconError = new BMapGL.Icon("img/car.png", new BMapGL.Size(25, 25));
                        var marker = new BMapGL.Marker(tempPoint, { icon: myIconError });  // 创建标注

                        //marker.setTitle(gpslist[lastIndex].IMEI);
                        marker.setTitle(plateNumberByIMEI(gpslist[lastIndex].IMEI));
                        //console.log(gpslist[lastIndex].IMEI);
                        //console.log(gpslist[lastIndex].IMEI);
                       
                        //console.log(plateNumberByIMEI(gpslist[lastIndex].IMEI));

                        marker.customData = {
                            Speed: gpslist[lastIndex].Speed, RealTimeLocation: gpslist[lastIndex].RealTimeLocation, IsLocated: gpslist[lastIndex].IsLocated,
                            Direction: gpslist[lastIndex].Direction, UploadMode: gpslist[lastIndex].UploadMode, RealTimeOrSupply: gpslist[lastIndex].RealTimeOrSupply,
                            DateTime: gpslist[lastIndex].DateTime, LongitudeEastWest: gpslist[lastIndex].LongitudeEastWest, LatitudeSouthNorth: gpslist[lastIndex].LatitudeSouthNorth,
                            ACC: gpslist[lastIndex].ACC, PlateNumber:plateNumberByIMEI(gpslist[lastIndex].IMEI),IMEI:gpslist[lastIndex].IMEI
                        };
                        map.addOverlay(marker);              // 将标注添加到地图中
                        marker.addEventListener("click", test);
                        //------------------------------------------------------------------------------------------
                        //for (var i = 0; i < data.points.length; i++) {
                        //点划线
                        var polyline = new BMapGL.Polyline(data.points, {
                            enableEditing: false,//是否启用线编辑，默认为false
                            enableClicking: false,//是否响应点击事件，默认为true
                            //strokeStyle: 'solid',
                            //geodesic:true,
                            //icons: [icons],
                            strokeWeight: '2',//折线的宽度，以像素为单位
                            strokeOpacity: 1,//折线的透明度，取值范围0 - 1
                            strokeColor: "#ff0000" //折线颜色18a45b
                        });

                        map.addOverlay(polyline);
                        //for (var i = 0; i < data.points.length; i++) {
                        //    //var tempPoint = data.points[i];
                        //    //var myIconError = new BMap.Icon("img/car.png", new BMap.Size(52, 26));
                        //    //var marker = new BMap.Marker(tempPoint, { icon: myIconError });  // 创建标注
                        //    //marker.setTitle(gpslist[i].IMEI);
                        //    //marker.customData = {
                        //    //    Speed: gpslist[i].Speed, RealTimeLocation: gpslist[i].RealTimeLocation, IsLocated: gpslist[i].IsLocated,
                        //    //    Direction: gpslist[i].Direction, UploadMode: gpslist[i].UploadMode, RealTimeOrSupply: gpslist[i].RealTimeOrSupply,
                        //    //    DateTime: gpslist[i].DateTime, LongitudeEastWest: gpslist[i].LongitudeEastWest, LatitudeSouthNorth: gpslist[i].LatitudeSouthNorth,
                        //    //    ACC: gpslist[i].ACC
                        //    //};
                        //    //map.addOverlay(marker);              // 将标注添加到地图中
                        //    //marker.addEventListener("click", test);
                        //    //bm.addOverlay(new BMap.Marker(data.points[i]));
                        //    //bm.setCenter(data.points[i]);
                        //}
                    }
                }
                //---------------------------------------------------------------------------------------
                setTimeout(function () {
                    var convertor = new BMapGL.Convertor();
                    convertor.translate(points, 1, 5, translateCallback)
                }, 1000);
                //------------------------------------------------------------------------------------



                //var point = new BMap.Point(json["Longitude"], json["Latitude"]);
                //var myIconError = new BMap.Icon("http://lbsyun.baidu.com/jsdemo/img/car.png", new BMap.Size(52, 26));
                //var marker = new BMap.Marker(point, { icon: myIconError });  // 创建标注
                //marker.setTitle(json["IMEI"]);
                //marker.customData = { Speed: json["Speed"], RealTimeLocation: json["RealTimeLocation"], IsLocated: json["IsLocated"], Direction: json["Direction"], UploadMode: json["UploadMode"], RealTimeOrSupply: json["RealTimeOrSupply"] };//自定义参数id
                //map.addOverlay(marker);              // 将标注添加到地图中
                //marker.addEventListener("click", test);
            }
            //--------------------------------------------------------------------------------------------//
            // 百度地图API功能
            //var map = new BMap.Map("allmap");
            var map = new BMapGL.Map('allmap', {
                enableDblclickZoom: false,
                displayOptions: {
                    building: false
                }
            });
            //118.26989   48.21842
            //var point = new BMap.Point(116.8177699684, 36.5642704788);
            //var point = new BMap.Point(118.26989, 48.21842);
            //map.centerAndZoom(point, 11);
            //map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
            //map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
            //118.27394951265872    48.22223333208361
            map.centerAndZoom(new BMapGL.Point(118.98813, 48.33396), 10);
            map.enableScrollWheelZoom(true);
            //map.setZoom(8.65);
            map.setZoom(9.5);
            map.setMapType(BMAP_EARTH_MAP); 
            //BMAP_EARTH_MAP
            //map.setMapType(BMAP_EARTH_MAP);
            //map.addEventListener('click', function (e) {
            //    //alert('点击位置经纬度：' + e.latlng.lng + ',' + e.latlng.lat);
            //    var cen = map.getCenter(); // 获取地图中心点
            //    alert('地图中心点: (' + cen.lng.toFixed(5) + ', ' + cen.lat.toFixed(5) + ')');
            //});
            //var top_left_control = new BMap.ScaleControl({ anchor: BMAP_ANCHOR_TOP_LEFT });// 左上角，添加比例尺
            //var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
            //var top_right_navigation = new BMap.NavigationControl({ anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL }); //右上角，仅包含平移和缩放按钮
            //*缩放控件type有四种类型:
            //BMAP_NAVIGATION_CONTROL_SMALL：仅包含平移和缩放按钮；BMAP_NAVIGATION_CONTROL_PAN:仅包含平移按钮；BMAP_NAVIGATION_CONTROL_ZOOM：仅包含缩放按钮*/
            //map.addControl(top_left_control);
            //map.addControl(top_left_navigation);
            //map.addControl(top_right_navigation);
            ////----------------------------画边界线----------------------------------------
            var bd = new BMapGL.Boundary();
            bd.get('新巴尔虎左旗', function (rs) {
                // console.log('外轮廓：', rs.boundaries[0]);
                // console.log('内镂空：', rs.boundaries[1]);
                var hole = new BMapGL.Polygon(rs.boundaries, {
                    fillColor: '#49a9ee',
                    fillOpacity: 0.9
                });
                map.addOverlay(hole);
            });
            //-------------------------倾斜角度和镂空地图-------------------------------------------------
            map.setTilt(40);
            //bd.get('新巴尔虎左旗', function (rs) {
            //    var count = rs.boundaries.length; //行政区域的点有多少个
            //    var pointArray = [];
            //    for (var i = 0; i < count; i++) {
            //        var path = [];
            //        str = rs.boundaries[i].replace(' ', '');
            //        points = str.split(';');
            //        for (var j = 0; j < points.length; j++) {
            //            var lng = points[j].split(',')[0];
            //            var lat = points[j].split(',')[1];
            //            path.push(new BMapGL.Point(lng, lat));
            //        }
            //        var prism = new BMapGL.Prism(path, 5000, {
            //            //topFillColor: '#5679ea',
            //            topFillColor: '#5679ea',//49a9ee
            //            topFillOpacity: 0.5,
            //            //sideFillColor: '#5679ea',
            //            sideFillColor: '#ffffff',
            //            sideFillOpacity: 0.8
            //        });
            //        map.addOverlay(prism);   
            //    }
            //});
            //---------------------------------------------------------------------------------
            var styleJson = [{
                "featureType": "land",
                "elementType": "geometry",
                "stylers": {
                    "color": "#242f3eff"
                }
            }, {
                "featureType": "manmade",
                "elementType": "geometry",
                "stylers": {
                    "color": "#242f3eff"
                }
            }, {
                "featureType": "water",
                "elementType": "geometry",
                "stylers": {
                    "color": "#17263cff"
                }
            }, {
                "featureType": "road",
                "elementType": "geometry.fill",
                "stylers": {
                    "color": "#9e7d60ff"
                }
            }, {
                "featureType": "road",
                "elementType": "geometry.stroke",
                "stylers": {
                    "color": "#554631ff"
                }
            }, {
                "featureType": "districtlabel",
                "elementType": "labels.text.fill",
                "stylers": {
                    "color": "#d69563ff"
                }
            }, {
                "featureType": "districtlabel",
                "elementType": "labels.text.stroke",
                "stylers": {
                    "color": "#17263cff",
                    "weight": 3
                }
            }, {
                "featureType": "poilabel",
                "elementType": "labels.text.fill",
                "stylers": {
                    "color": "#d69563ff"
                }
            }, {
                "featureType": "poilabel",
                "elementType": "labels.text.stroke",
                "stylers": {
                    "color": "#17263cff",
                    "weight": 3
                }
            }, {
                "featureType": "subway",
                "elementType": "geometry",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "railway",
                "elementType": "geometry",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "poilabel",
                "elementType": "labels.icon",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "subwaylabel",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "subwaylabel",
                "elementType": "labels.icon",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "tertiarywaysign",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "tertiarywaysign",
                "elementType": "labels.icon",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "provincialwaysign",
                "elementType": "labels.icon",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "provincialwaysign",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "nationalwaysign",
                "elementType": "labels.icon",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "nationalwaysign",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "highwaysign",
                "elementType": "labels.icon",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "highwaysign",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "green",
                "elementType": "geometry",
                "stylers": {
                    "color": "#263b3eff"
                }
            }, {
                "featureType": "nationalwaysign",
                "elementType": "labels.text.fill",
                "stylers": {
                    "color": "#d0021bff"
                }
            }, {
                "featureType": "nationalwaysign",
                "elementType": "labels.text.stroke",
                "stylers": {
                    "color": "#ffffffff"
                }
            }, {
                "featureType": "city",
                "elementType": "labels",
                "stylers": {
                    "visibility": "on"
                }
            }, {
                "featureType": "city",
                "elementType": "labels.icon",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "city",
                "elementType": "labels.text.fill",
                "stylers": {
                    "color": "#d69563ff"
                }
            }, {
                "featureType": "city",
                "elementType": "labels.text.stroke",
                "stylers": {
                    "color": "#17263cff"
                }
            }, {
                "featureType": "water",
                "elementType": "labels.text.fill",
                "stylers": {
                    "color": "#d69563ff"
                }
            }, {
                "featureType": "water",
                "elementType": "labels.text.stroke",
                "stylers": {
                    "color": "#242f3eff"
                }
            }, {
                "featureType": "local",
                "elementType": "geometry.fill",
                "stylers": {
                    "color": "#38414eff"
                }
            }, {
                "featureType": "local",
                "elementType": "geometry.stroke",
                "stylers": {
                    "color": "#ffffff00"
                }
            }, {
                "featureType": "fourlevelway",
                "elementType": "geometry.fill",
                "stylers": {
                    "color": "#38414eff"
                }
            }, {
                "featureType": "fourlevelway",
                "elementType": "geometry.stroke",
                "stylers": {
                    "color": "#ffffff00"
                }
            }, {
                "featureType": "tertiaryway",
                "elementType": "geometry.fill",
                "stylers": {
                    "color": "#38414eff"
                }
            }, {
                "featureType": "tertiaryway",
                "elementType": "geometry.stroke",
                "stylers": {
                    "color": "#ffffff00"
                }
            }, {
                "featureType": "tertiaryway",
                "elementType": "labels.text.fill",
                "stylers": {
                    "color": "#759879ff"
                }
            }, {
                "featureType": "fourlevelway",
                "elementType": "labels.text.fill",
                "stylers": {
                    "color": "#759879ff"
                }
            }, {
                "featureType": "highway",
                "elementType": "labels.text.fill",
                "stylers": {
                    "color": "#759879ff"
                }
            }, {
                "featureType": "highway",
                "elementType": "geometry.fill",
                "stylers": {
                    "color": "#9e7d60ff"
                }
            }, {
                "featureType": "highway",
                "elementType": "geometry.stroke",
                "stylers": {
                    "color": "#554631ff"
                }
            }, {
                "featureType": "provincialway",
                "elementType": "geometry.fill",
                "stylers": {
                    "color": "#9e7d60ff"
                }
            }, {
                "featureType": "provincialway",
                "elementType": "geometry.stroke",
                "stylers": {
                    "color": "#554631ff"
                }
            }, {
                "featureType": "tertiaryway",
                "elementType": "labels.text.stroke",
                "stylers": {
                    "color": "#1a2e1cff"
                }
            }, {
                "featureType": "fourlevelway",
                "elementType": "labels.text.stroke",
                "stylers": {
                    "color": "#1a2e1cff"
                }
            }, {
                "featureType": "highway",
                "elementType": "labels.text.stroke",
                "stylers": {
                    "color": "#1a2e1cff"
                }
            }, {
                "featureType": "nationalway",
                "elementType": "labels.text.stroke",
                "stylers": {
                    "color": "#1a2e1cff"
                }
            }, {
                "featureType": "nationalway",
                "elementType": "labels.text.fill",
                "stylers": {
                    "color": "#759879ff"
                }
            }, {
                "featureType": "nationalway",
                "elementType": "geometry.fill",
                "stylers": {
                    "color": "#9e7d60ff"
                }
            }, {
                "featureType": "nationalway",
                "elementType": "geometry.stroke",
                "stylers": {
                    "color": "#554631ff"
                }
            }, {
                "featureType": "cityhighway",
                "elementType": "geometry.fill",
                "stylers": {
                    "color": "#9e7d60ff"
                }
            }, {
                "featureType": "cityhighway",
                "elementType": "geometry.stroke",
                "stylers": {
                    "color": "#554631ff"
                }
            }, {
                "featureType": "arterial",
                "elementType": "geometry.fill",
                "stylers": {
                    "color": "#9e7d60ff"
                }
            }, {
                "featureType": "arterial",
                "elementType": "geometry.stroke",
                "stylers": {
                    "color": "#554631fa"
                }
            }, {
                "featureType": "medicallabel",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "medicallabel",
                "elementType": "labels.icon",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "entertainmentlabel",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "entertainmentlabel",
                "elementType": "labels.icon",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "estatelabel",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "estatelabel",
                "elementType": "labels.icon",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "businesstowerlabel",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "businesstowerlabel",
                "elementType": "labels.icon",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "companylabel",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "companylabel",
                "elementType": "labels.icon",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "governmentlabel",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "governmentlabel",
                "elementType": "labels.icon",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "restaurantlabel",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "restaurantlabel",
                "elementType": "labels.icon",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "hotellabel",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "hotellabel",
                "elementType": "labels.icon",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "shoppinglabel",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "shoppinglabel",
                "elementType": "labels.icon",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "lifeservicelabel",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "lifeservicelabel",
                "elementType": "labels.icon",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "carservicelabel",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "carservicelabel",
                "elementType": "labels.icon",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "financelabel",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "financelabel",
                "elementType": "labels.icon",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "otherlabel",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "otherlabel",
                "elementType": "labels.icon",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "airportlabel",
                "elementType": "labels",
                "stylers": {
                    "visibility": "on"
                }
            }, {
                "featureType": "airportlabel",
                "elementType": "labels.text.fill",
                "stylers": {
                    "color": "#d69563ff"
                }
            }, {
                "featureType": "airportlabel",
                "elementType": "labels.text.stroke",
                "stylers": {
                    "color": "#17263cff"
                }
            }, {
                "featureType": "airportlabel",
                "elementType": "labels.icon",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "highway",
                "stylers": {
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "6"
                }
            }, {
                "featureType": "highway",
                "stylers": {
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "7"
                }
            }, {
                "featureType": "highway",
                "stylers": {
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "8"
                }
            }, {
                "featureType": "highway",
                "stylers": {
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "9"
                }
            }, {
                "featureType": "highway",
                "stylers": {
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "10"
                }
            }, {
                "featureType": "highway",
                "elementType": "geometry",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "6"
                }
            }, {
                "featureType": "highway",
                "elementType": "geometry",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "7"
                }
            }, {
                "featureType": "highway",
                "elementType": "geometry",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "8"
                }
            }, {
                "featureType": "highway",
                "elementType": "geometry",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "9"
                }
            }, {
                "featureType": "highway",
                "elementType": "geometry",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "10"
                }
            }, {
                "featureType": "nationalway",
                "stylers": {
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "6"
                }
            }, {
                "featureType": "nationalway",
                "stylers": {
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "7"
                }
            }, {
                "featureType": "nationalway",
                "stylers": {
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "8"
                }
            }, {
                "featureType": "nationalway",
                "stylers": {
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "9"
                }
            }, {
                "featureType": "nationalway",
                "stylers": {
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "10"
                }
            }, {
                "featureType": "nationalway",
                "elementType": "geometry",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "6"
                }
            }, {
                "featureType": "nationalway",
                "elementType": "geometry",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "7"
                }
            }, {
                "featureType": "nationalway",
                "elementType": "geometry",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "8"
                }
            }, {
                "featureType": "nationalway",
                "elementType": "geometry",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "9"
                }
            }, {
                "featureType": "nationalway",
                "elementType": "geometry",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "10"
                }
            }, {
                "featureType": "nationalway",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "6"
                }
            }, {
                "featureType": "nationalway",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "7"
                }
            }, {
                "featureType": "nationalway",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "8"
                }
            }, {
                "featureType": "nationalway",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "9"
                }
            }, {
                "featureType": "nationalway",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "10"
                }
            }, {
                "featureType": "highway",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "6"
                }
            }, {
                "featureType": "highway",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "7"
                }
            }, {
                "featureType": "highway",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "8"
                }
            }, {
                "featureType": "highway",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "9"
                }
            }, {
                "featureType": "highway",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "10"
                }
            }, {
                "featureType": "provincialway",
                "stylers": {
                    "curZoomRegionId": "0",
                    "curZoomRegion": "8,9",
                    "level": "8"
                }
            }, {
                "featureType": "provincialway",
                "stylers": {
                    "curZoomRegionId": "0",
                    "curZoomRegion": "8,9",
                    "level": "9"
                }
            }, {
                "featureType": "provincialway",
                "elementType": "geometry",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "8,9",
                    "level": "8"
                }
            }, {
                "featureType": "provincialway",
                "elementType": "geometry",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "8,9",
                    "level": "9"
                }
            }, {
                "featureType": "provincialway",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "8,9",
                    "level": "8"
                }
            }, {
                "featureType": "provincialway",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "8,9",
                    "level": "9"
                }
            }, {
                "featureType": "cityhighway",
                "stylers": {
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "6"
                }
            }, {
                "featureType": "cityhighway",
                "stylers": {
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "7"
                }
            }, {
                "featureType": "cityhighway",
                "stylers": {
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "8"
                }
            }, {
                "featureType": "cityhighway",
                "stylers": {
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "9"
                }
            }, {
                "featureType": "cityhighway",
                "stylers": {
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "10"
                }
            }, {
                "featureType": "cityhighway",
                "elementType": "geometry",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "6"
                }
            }, {
                "featureType": "cityhighway",
                "elementType": "geometry",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "7"
                }
            }, {
                "featureType": "cityhighway",
                "elementType": "geometry",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "8"
                }
            }, {
                "featureType": "cityhighway",
                "elementType": "geometry",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "9"
                }
            }, {
                "featureType": "cityhighway",
                "elementType": "geometry",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "10"
                }
            }, {
                "featureType": "cityhighway",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "6"
                }
            }, {
                "featureType": "cityhighway",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "7"
                }
            }, {
                "featureType": "cityhighway",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "8"
                }
            }, {
                "featureType": "cityhighway",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "9"
                }
            }, {
                "featureType": "cityhighway",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "6,10",
                    "level": "10"
                }
            }, {
                "featureType": "arterial",
                "stylers": {
                    "curZoomRegionId": "0",
                    "curZoomRegion": "9,10",
                    "level": "9"
                }
            }, {
                "featureType": "arterial",
                "stylers": {
                    "curZoomRegionId": "0",
                    "curZoomRegion": "9,10",
                    "level": "10"
                }
            }, {
                "featureType": "arterial",
                "elementType": "geometry",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "9,10",
                    "level": "9"
                }
            }, {
                "featureType": "arterial",
                "elementType": "geometry",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "9,10",
                    "level": "10"
                }
            }, {
                "featureType": "arterial",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "9,10",
                    "level": "9"
                }
            }, {
                "featureType": "arterial",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off",
                    "curZoomRegionId": "0",
                    "curZoomRegion": "9,10",
                    "level": "10"
                }
            }, {
                "featureType": "building",
                "elementType": "geometry.topfill",
                "stylers": {
                    "color": "#2a3341ff"
                }
            }, {
                "featureType": "building",
                "elementType": "geometry.sidefill",
                "stylers": {
                    "color": "#313b4cff"
                }
            }, {
                "featureType": "building",
                "elementType": "geometry.stroke",
                "stylers": {
                    "color": "#1a212eff"
                }
            }, {
                "featureType": "road",
                "elementType": "labels.text.fill",
                "stylers": {
                    "color": "#759879ff"
                }
            }, {
                "featureType": "road",
                "elementType": "labels.text.stroke",
                "stylers": {
                    "color": "#1a2e1cff"
                }
            }, {
                "featureType": "provincialway",
                "elementType": "labels.text.fill",
                "stylers": {
                    "color": "#759879ff"
                }
            }, {
                "featureType": "cityhighway",
                "elementType": "labels.text.fill",
                "stylers": {
                    "color": "#759879ff"
                }
            }, {
                "featureType": "arterial",
                "elementType": "labels.text.fill",
                "stylers": {
                    "color": "#759879ff"
                }
            }, {
                "featureType": "provincialway",
                "elementType": "labels.text.stroke",
                "stylers": {
                    "color": "#1a2e1cff"
                }
            }, {
                "featureType": "cityhighway",
                "elementType": "labels.text.stroke",
                "stylers": {
                    "color": "#1a2e1cff"
                }
            }, {
                "featureType": "arterial",
                "elementType": "labels.text.stroke",
                "stylers": {
                    "color": "#1a2e1cff"
                }
            }, {
                "featureType": "local",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "manmade",
                "elementType": "labels.text.fill",
                "stylers": {
                    "color": "#d69563ff"
                }
            }, {
                "featureType": "manmade",
                "elementType": "labels.text.stroke",
                "stylers": {
                    "color": "#17263cff"
                }
            }, {
                "featureType": "subwaystation",
                "elementType": "geometry",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "transportationlabel",
                "elementType": "labels.icon",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "transportationlabel",
                "elementType": "labels",
                "stylers": {
                    "visibility": "off"
                }
            }, {
                "featureType": "estate",
                "elementType": "geometry",
                "stylers": {
                    "color": "#2a3341ff"
                }
            }];
            //map.setMapStyleV2({ styleJson: styleJson });
            //-----------------------------文字说明------------------------------------------------------
            var opts = {
                position: new BMapGL.Point(118.74437, 48.58156), // 指定文本标注所在的地理位置
                offset: new BMapGL.Size(80, -50) // 设置文本偏移量
            };
            // 创建文本标注对象
            //var label = new BMapGL.Label('新巴尔虎左旗<br/>出车总次数：0<br/>出车总里程：0Km<br/>小药箱：45678', opts);
            var label = new BMapGL.Label('<span style="font-size:14px">新巴尔虎左旗</span><br/>出车总次数： 0次<br/>出车总里程： 0Km<br/>小药箱： 0', opts);
            // 自定义文本标注样式
            label.setStyle({
                color: 'white',
                borderRadius: '5px',
                borderColor: '#ff0000',
                padding: '10px',
                fontSize: '12px',
                fontWeight:'bold',
                //height: '90px',
                //lineHeight: '30px',
                fontFamily: '微软雅黑',
                backgroundColor: 'blue'
                
            });
            map.addOverlay(label);
            //-------------------------------------------------------------------------
            //var bd = new BMapGL.Boundary();
            //bd.get('新巴尔虎左旗', function (rs) {
            //    // console.log('外轮廓：', rs.boundaries[0]);
            //    // console.log('内镂空：', rs.boundaries[1]);
            //    var hole = new BMapGL.Polygon(rs.boundaries, {
            //        fillColor: 'blue',
            //        fillOpacity: 0.2
            //    });
            //    map.addOverlay(hole);
            //});
            //------------------------------------?????????????????-------------------------------------------------
            //var sy = new BMap.Symbol(BMap_Symbol_SHAPE_BACKWARD_OPEN_ARROW, {
            //    scale: 0.6,//图标缩放大小
            //    strokeColor: '#f00',//设置矢量图标的线填充颜色,fff
            //    strokeWeight: '2',//设置线宽
            //});
            //var icons = new BMap.IconSequence(sy, '10', '30');
            ////-----------------------------轨迹连线-----------------------------------------------------
            //var pois = new Array();            
            //pois.push(new BMapGL.Point(118.14814992185924, 48.3502942854155));
            //pois.push(new BMapGL.Point(118.40390637300325, 48.2665068238102));
            //pois.push(new BMapGL.Point(118.98849254704677, 48.00511958887493));
            //pois.push(new BMapGL.Point(119.40866385964051, 47.81319966940731));
            //pois.push(new BMapGL.Point(119.5479597839243, 47.962191755395764));
            //var polyline = new BMapGL.Polyline(pois, {
            //    enableEditing: false,//是否启用线编辑，默认为false
            //    enableClicking: false,//是否响应点击事件，默认为true
            //    //strokeStyle: 'solid',
            //    //geodesic:true,
            //    //icons: [icons],
            //    strokeWeight: '1',//折线的宽度，以像素为单位
            //    strokeOpacity: 1,//折线的透明度，取值范围0 - 1
            //    strokeColor: "#000000" //折线颜色18a45b
            //});
            //map.addOverlay(polyline);
            //-------------------------------终点画出汽车marker-------------------------------------------------------------
            //var point1 = pois[pois.length - 1];
            //var myIcon = new BMapGL.Icon("img/car.png", new BMapGL.Size(25, 25));


            //var marker2 = new BMapGL.Marker(point1, { icon: myIcon });
            //map.addOverlay(marker2);
            //----------------------------------蒙古包 marker---------------------------------------------------
            //var baonew1 = new BMapGL.Icon("img/baonew1.png", new BMapGL.Size(26, 13));
            //var markerbao = new BMapGL.Marker(new BMapGL.Point(118.37269646101011, 48.82185395613529), { icon: baonew1 });
            //map.addOverlay(markerbao);
            //--------------------------------------12家医院marker-----------------------------------------------
            //var hospital = new BMapGL.Icon("img/hospital.png", new BMapGL.Size(25, 25));
            var hospital = new BMapGL.Icon("img/hospital.png", new BMapGL.Size(20, 20));


            //新巴尔虎左旗人民政府 118.276559,48.223876
            var h1 = new BMapGL.Marker(new BMapGL.Point(118.276559, 48.223876), { icon: hospital });
            map.addOverlay(h1);
            h1.setTitle("新巴尔虎左旗人民政府");
            h1.addEventListener("click", hospitalClick);
            h1.customData = {
                textTitle: "新巴尔虎左旗人民政府简介", textContent: "新巴尔虎左旗（又称东旗，新左旗）是隶属内蒙古自治区呼伦贝尔市的一个旗，位于东经117°33′～120°12′，北纬46°10′～49°47′，地处大兴安岭北麓，呼伦贝尔市西南端。土地面积2.2万平方公里，人口4.2万人（2011年）。2011年12月，新巴尔虎左旗辖2个镇、5个苏木。 2013年，新巴尔虎左旗地区生产总值完成327562万元。", picName: "zhengfu.jpg"
            };
            h1.setTop(true);
            //新巴尔虎左旗人民医院 118.272289,48.215807
            //var h1 = new BMapGL.Marker(new BMapGL.Point(118.272289, 48.215807), { icon: hospital });
            //map.addOverlay(h1);
            //h1.setTitle("新巴尔虎左旗人民医院");
            //h1.addEventListener("click", hospitalClick);

            //新巴尔虎左旗蒙医医院 118.266361,48.219580
            //var h2 = new BMapGL.Marker(new BMapGL.Point(118.266361, 48.219580), { icon: hospital });
            //map.addOverlay(h2);
            //h2.addEventListener("click", hospitalClick);
            //h2.setTitle("新巴尔虎左旗蒙医医院");

            //善都卫生院   118.405940,48.814551
            var h3 = new BMapGL.Marker(new BMapGL.Point(118.405940, 48.814551), { icon: hospital });
            map.addOverlay(h3);
            h3.addEventListener("click", hospitalClick);
            h3.setTitle("善都卫生院");
            h3.customData = {
                textTitle: "善都卫生院简介", textContent: "新宝力格苏木善都卫生院建于2012年10月15日。因基层医疗机构的改造2012年建现在的业务用房480平方，职工用房180平米，占地面积6800平米，服务面积1960平方公里，辖区有五个行政嘎查，总人口1304人。善都卫生院基本情况：有7个编制，在编人员7人，在职人员6人，一位在通辽规培、编外1人。在编卫生技术人员6人，其中蒙医4人、西医1人、护士1人，编外1名护士。内设蒙医科、免疫科、妇幼科、注射室、静点室、药房、医生办公室等。", picName: "sd.jpg"
            };
            h3.setTop(true);

            //罕达盖苏木卫生院    119.446551,47.470373
            var h4 = new BMapGL.Marker(new BMapGL.Point(119.446551, 47.470373), { icon: hospital });
            map.addOverlay(h4);
            h4.addEventListener("click", hospitalClick);
            h4.setTitle("罕达盖苏木卫生院");
            h4.customData = {
                textTitle: "罕达盖苏木卫生院简介", textContent: "罕达盖苏木卫生院坐落于罕达盖苏木、罕达盖嘎查，东接壤新巴尔虎左旗乌布尔宝力格苏木，南接壤兴安盟，西接壤蒙古国。罕达盖苏木卫生院成立于2011年11月，编制总数9人，医师5人、护士3人、药剂师1人。内设蒙医科、外科、内科、预防保健科、公共卫生科、医学检验科等科室。服务半径50公里，下设四个嘎查：罕达盖嘎查、巴音布日德嘎查、诺门罕布日德嘎查、查干诺尔嘎查。服务人口：1340人。", picName: "hdgsm.jpg"
            };
            h4.setTop(true);

            //巴日图卫生院   119.484789,47.842308
            var h5 = new BMapGL.Marker(new BMapGL.Point(119.484789, 47.842308), { icon: hospital });
            map.addOverlay(h5);
            h5.addEventListener("click", hospitalClick);
            h5.setTitle("巴日图卫生院");
            h5.customData = {
                textTitle: "巴日图卫生院简介", textContent: "乌布尔宝力格苏木巴日图卫生院始建于2010年位于新左旗的北部人口1766人辖区有1个林场2个嘎查。业务用房改扩建于2010年建筑面积400平方米承担常见病和多发病的诊疗、基本公共卫生服务、计划生育技术服务、健康管理、危急重症病人的初步现场急救和转诊等功能任务；院内设基本医疗区、基本公共卫生区等分区和共8个临床医技科室；核定全额事业编制为7名，现有在编职工5人，空2编制，编外职工2人，药剂、医技、护理等专业技术人员8人；卫生院全科医生1名，设立蒙医科，蒙医医师4名。", picName: "brt.jpg"
            };
            h5.setTop(true);

            //甘珠尔苏木坤都伦卫生院 117.817986,48.073333
            var h6 = new BMapGL.Marker(new BMapGL.Point(117.817986, 48.073333), { icon: hospital });
            map.addOverlay(h6);
            h6.addEventListener("click", hospitalClick);
            h6.setTitle("甘珠尔苏木坤都伦卫生院");
            h6.customData = {
                textTitle: "甘珠尔苏木坤都伦卫生院简介", textContent: "甘珠尔苏木坤都伦卫生院建于2016年7月1日。卫生院面积460㎡，距旗所在地在阿木古郎镇44公厘。服务面积为3140平方公里，辖区内有12个行政嘎查。总户数939户常住人口2833。卫生院在职人员9人.其中临床医学专业2人，蒙医医生4人，护士2人，药剂师1人。职称：中级职称2人，初级职称3人。卫生院内有免疫规划科，妇幼保健计划生育科，全科诊室，药房，辅助科，注射室等床位4张。代担着全苏木12项公共卫生和基本医疗服务。", picName: "gzer.jpg"
            };
            h6.setTop(true);

            //呼吉日诺尔   118.587308,48.318963
            var h7 = new BMapGL.Marker(new BMapGL.Point(118.587308, 48.318963), { icon: hospital });
            map.addOverlay(h7);
            h7.addEventListener("click", hospitalClick);
            h7.setTitle("呼吉日诺尔");
            h7.customData = {
                textTitle: "呼吉日诺尔卫生院简介", textContent: "卫生院位于塔日根诺尔的东部，2016年7月1日和塔日根诺尔卫生院合并，是一所非营利性公立综合卫生院，。卫生院成立1962年，建筑面积210平方米，院内设置内科，外科，蒙医科，公共卫生，计划免疫，妇幼保健科，院内职工9人，其中编外1人，自聘1人，卫生院服务面积2948.2平方公里，人口数2963人，辖区共有11个嘎查，砖厂，煤矿各一个，其中5公里以外小药箱工程覆盖牧户，为使基层医疗机构卫生服务，走进每户家庭，对居牧民健康状况实行有效干预，我呼吉日诺尔卫生院全面铺开家庭责任医生签约工作。", picName: "hjrner.jpg"
            };
            h7.setTop(true);

            //新宝力格苏木中心卫生院  118.244368,48.482403
            var h8 = new BMapGL.Marker(new BMapGL.Point(118.244368, 48.482403), { icon: hospital });
            map.addOverlay(h8);
            h8.addEventListener("click", hospitalClick);
            h8.setTitle("新宝力格苏木中心卫生院");
            h8.customData = {
                textTitle: "新宝力格苏木中心卫生院简介", textContent: "新宝力格苏木中心卫生院始建于1952年,位于新巴尔虎左旗新宝力格苏木莫达木吉嘎查,占地500平方米,业务用房1100平方米,服务面积724平方公里,人口2659人,有4四个嘎查。卫生院是一所公益性、综合性的卫生院,包括了公共卫生科、蒙医科、检验科、彩超室、心电室为一体的临床医技科室。卫生院编制床位有10张,核定全额事业编制16人,现有在编职工15人，全科医生2名,蒙医医师3名，现有药品228种，基本药物215，急救药品13种。优先服务于辖区内的贫困人口、65岁以上老年人、孕产妇、0-6岁儿童、残疾人以及高血压、糖尿病、结核病等慢性疾病和严重精神病障碍患者,与他们签约服务。", picName: "xblgsm.jpg"
            };
            h8.setTop(true);

            //吉布胡郎图苏木卫生院   117.774274,48.971426
            var h9 = new BMapGL.Marker(new BMapGL.Point(117.774274, 48.971426), { icon: hospital });
            map.addOverlay(h9);
            h9.addEventListener("click", hospitalClick);
            h9.setTitle("吉布胡郎图苏木卫生院");
            h9.customData = {
                textTitle: "吉布胡郎图苏木卫生院简介", textContent: "吉布胡郎图苏木卫生院位于新左旗的西北部，服务面积2046.4平方公里，人口2050人，辖区内1个卫生院，1个卫生室，7个行政嘎查。其中5公里以外小药箱工程覆盖牧户242户，牧民1430人。吉布胡郎图苏木卫生院成立于1956年7月，业务用房改扩建于2017年，建筑面积1100平方米。院内设基本医疗区、基本公共卫生区、分区共8个临床医技科室。现有在编职工7人，聘用3人。现有药品235种，基本药品223种，急救药品12种。城镇医保实行现场核销。主要承担辖区内基本医疗、基本公共卫生服务、传染病防治、康复保健等医疗卫生服务。", picName: "jbhlt.jpg"
            };
            h9.setTop(true);

            //乌布尔宝力格苏木中心卫生院   119.484864,47.84237   
            var h10 = new BMapGL.Marker(new BMapGL.Point(119.057931, 48.075818), { icon: hospital });//119.484864,47.84237
            map.addOverlay(h10);
            h10.addEventListener("click", hospitalClick);
            h10.setTitle("乌布尔宝力格苏木中心卫生院");
            h10.customData = {
                textTitle: "乌布尔宝力格苏木中心卫生院简介", textContent: "乌布尔宝力格苏木中心卫生院位于新巴尔虎左旗的南部，服务面积约3332平方公里，人口4636人，辖1个社区，6个嘎查。其中5公里以外小药箱工程覆盖牧户650户，牧民3800人。乌布尔宝力格苏木中心卫生院成立于1950年，业务用房改扩建于2013年，建筑面积850平方米。现有在编职工19人、编外2人、聘用职工4人。主要承担辖区内基本医疗、基本公共卫生服务、传染病防治、康复保健等医疗卫生服务。", picName: "wberbl.jpg"
            };
            h10.setTop(true);

            //嵯岗镇中心卫生院  118.109420,49.263761
            var h11 = new BMapGL.Marker(new BMapGL.Point(118.109420, 49.263761), { icon: hospital });
            map.addOverlay(h11);
            h11.addEventListener("click", hospitalClick);
            h11.setTitle("嵯岗镇中心卫生院");
            h11.customData = {
                textTitle: "嵯岗镇中心卫生院简介", textContent: "卫生院成立于1953年，位于嵯岗镇九道街 。卫生院占地面积6490㎡，现有业务用房2420㎡，服务面积为3260平方公里，承担着辖区内7714余人口的基本公共卫生、基本医疗、预防保健服务。院内开设内科、妇科、儿科、蒙医科、口腔科、计划免疫科、B超、X光室、化验室、蒙西药房、注射室、处置室，开设病床10张。卫生院现有职工20人，其中医生13人，护士2人，医技2人，药剂1人，非专业技术人员2人。，副高级职称2人，中级职称8人，初级职称10人。嵯岗镇中心卫生院院内环境优雅，全体医务人员本着一切以病人为中心的服务理念，为您提供优质的医疗服务。", picName: "chagang.jpg"
            };
            h11.setTop(true);

            //锡林社区卫生服务中心  118.252051,48.214831
            var h12 = new BMapGL.Marker(new BMapGL.Point(118.252051, 48.214831), { icon: hospital });
            map.addOverlay(h12);
            h12.addEventListener("click", hospitalClick);
            h12.setTitle("锡林社区卫生服务中心");
            h12.customData = {
                textTitle: "锡林社区卫生服务中心简介", textContent: "新左旗锡林社区卫生服务中心成立于2007年。现有职工22人，其中专业技术人员19人，副高级职称人员3名，中级职称人员2人，初级职称人员11人，科员3名。服务中心为辖区提供公共卫生服务和基本医疗服务，具有公益性质，不以营利为目的。基本公共卫生服务包括居民健康档案管理、健康教育、预防接种、0～6岁儿童健康管理、孕产妇健康管理、老年人健康管理、高血压患者健康管理、2型糖尿病患者健康管理、重性精神疾病患者管理、传染病及突发公共卫生事件报告和处理以及卫生监督协管服务。", picName: "xilin.jpg"
            };
            h12.setTop(true);
            //----------------------医院marker点击事件---------------------------------------------------------------
            function hospitalClick(e) {

                //var infoWindow = new BMap.InfoWindow("纬度:" + p.lat + ",经度:" + p.lng + "</br><a style='color:red' href='stations.aspx?rtuid=" + this.getTitle() + "'>详细信息</a>", opts);
                //var speed = e.target.customData.Speed;
                //var realtimelocation = e.target.customData.RealTimeLocation;
                //var islocated = e.target.customData.IsLocated;
                //var direction = e.target.customData.Direction;
                //var uploadmode = e.target.customData.UploadMode;
                //var realtimesupply = e.target.customData.RealTimeOrSupply;
                //var latitudesouthnorth = e.target.customData.LatitudeSouthNorth;
                //var longitudeeastwest = e.target.customData.LongitudeEastWest;
                //var acc = e.target.customData.ACC;
                //var datetime = e.target.customData.DateTime;
                //marker.customData = { Speed: gpslist[i].Speed, RealTimeLocation: gpslist[i].RealTimeLocation, IsLocated: gpslist[i].IsLocated, Direction: gpslist[i].Direction, UploadMode: gpslist[i].UploadMode, RealTimeOrSupply: gpslist[i].RealTimeOrSupply };
                //ID, IMEI, DateTime, Latitude, Longitude, Speed, RealTimeLocation, IsLocated, LongitudeEastWest, LatitudeSouthNorth, 
                //Direction, ACC, UploadMode, RealTimeOrSupply, AccumulatedMiles
                ////------------------------------------old----------------------------------------------------------------------------------////
                //var p = this.getPosition();       //获取marker的位置

                //var opts = {
                //    width: 200,     // 信息窗口宽度
                //    height: 40,     // 信息窗口高度
                //    title: "地点 : " + this.getTitle(), // 信息窗口标题
                //}
                //var infoWindow = new BMapGL.InfoWindow("北纬 : " + p.lat + "<br/>东经: " + p.lng, opts);
                //map.openInfoWindow(infoWindow, p);
                ////---------------------------------new-------------------------------------------------------------------------------------////
                var p = this.getPosition();
                var sContent = "<h4 style='margin:0 0 5px 0;'>" + e.target.customData.textTitle + "</h4><img style='float:right;margin:0 4px 22px' id='imgDemo' src='imgHospital/"+e.target.customData.picName+"' width='139' height='104'/><p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+e.target.customData.textContent+"</p></div>";
                var infoWindow = new BMapGL.InfoWindow(sContent);
                map.openInfoWindow(infoWindow,p);
            }
            //-------------------------------------------------------------------------------------
            //-------------------------------------------------------------------------------------
            //-------------------------------------------------------------------------------------
            //new BMap.Convertor().translate(1,2,3,4);
            //BMap.Convertor.translate(point, 0, translateCallback);
            //var marker = new BMap.Marker(point);  // 创建标注
            //map.addOverlay(marker);              // 将标注添加到地图中
            //marker.addEventListener("click", getAttr);
            //marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
            //function getAttr() {
            //    //var p = marker.getPosition();       //获取marker的位置
            //    var opts = {
            //        width: 200,     // 信息窗口宽度
            //        height: 100,     // 信息窗口高度
            //        title: "经纬度信息", // 信息窗口标题
            //        //enableMessage: true,//设置允许信息窗发送短息
            //        //message: "亲耐滴，晚上一起吃个饭吧？戳下面的链接看下地址喔~"
            //    }
            //    var infoWindow = new BMap.InfoWindow("纬度经度纬度经度纬度经度纬度经度正文", opts);
            //    map.openInfoWindow(infoWindow, p);
            //    //alert("marker的位置是" + p.lng + "," + p.lat);
            //}
            // 随机向地图添加25个标注
            //var bounds = map.getBounds();
            //var sw = bounds.getSouthWest();
            //var ne = bounds.getNorthEast();
            //var lngSpan = Math.abs(sw.lng - ne.lng);
            //var latSpan = Math.abs(ne.lat - sw.lat);
            //for (var i = 0; i < 25; i++) {
            //    var point = new BMap.Point(sw.lng + lngSpan * (Math.random() * 0.7), ne.lat - latSpan * (Math.random() * 0.7));
            //    var marker = new BMap.Marker(point);
            //    map.addOverlay(marker);
            //    marker.addEventListener("click", test);
            //    //marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画	    
            //}
            ////-------------------------------------------------------------------------------------------------------------------------------------
            //ajax 
            var gpsimeilist = [];
            function ajaxmap() {
                $.ajax({
                    type: "post",                          //提交方式
                    url: "map.ashx",        //一般处理程序的路径
                    data: { name: "all" },           //向后台传入的值
                    dataType: "text",                       //返回值格式
                    //dataType: "json",                       //返回值格式
                    success: function (data) {
                        if (data.error_key) {
                            return;
                        }

                        var maps = eval("(" + data + ")");//转换为json对象 
                        gpsimeilist = [];
                        //console.log(maps);
                        //alert(maps);
                        //ID, RTUID, ParRTUID, Latitude, Longitude
                        $.each(maps, function (idx, obj) {
                            var temp = [];
                            $.each(obj, function (idxx, objj) {
                                var json = JSON.parse(objj);
                                //ID, IMEI, DateTime, Latitude, Longitude, Speed, RealTimeLocation, IsLocated, LongitudeEastWest, LatitudeSouthNorth, 
                                //Direction, ACC, UploadMode, RealTimeOrSupply, AccumulatedMiles

                                temp.push(new GPSIMEI(json["IMEI"], json["DateTime"], json["Latitude"], json["Longitude"], json["Speed"], json["RealTimeLocation"],
                                                 json["IsLocated"], json["LongitudeEastWest"], json["LatitudeSouthNorth"], json["Direction"], json["ACC"], json["UploadMode"], json["RealTimeOrSupply"]));

                            });
                            gpsimeilist.push(temp);

                            //var point = new BMap.Point(json["Longitude"], json["Latitude"]);
                            //var point = new BMap.Point(json["Latitude"], json["Longitude"]);
                            //jsdemo/img/car.png
                            //var myIcon = new BMapGL.Icon("http://lbsyun.baidu.com/jsdemo/img/car.png", new BMapGL.Size(52, 26));
                            //var myIconError = new BMap.Icon("http://lbsyun.baidu.com/jsdemo/img/car.png", new BMap.Size(52, 26));
                            //var marker = new BMap.Marker(point, { icon: myIconError });  // 创建标注
                            //marker.setTitle(json["RTUID"]);
                            //---------------------------------
                            //ID, IMEI, DateTime, Latitude, Longitude, Speed, RealTimeLocation, IsLocated, LongitudeEastWest, LatitudeSouthNorth, 
                            //Direction, ACC, UploadMode, RealTimeOrSupply, AccumulatedMiles
                            //var myIcon = new BMap.Icon("img/m_red.png", new BMap.Size(23, 25), {
                            //    offset: new BMap.Size(10, 25), // 指定定位位置
                            //    imageOffset: new BMap.Size(0, 0) // 设置图片偏移
                            //});
                            //var marker=new BMap.Marker(point,{icon:myIcon});
                            //----------------------------------
                            //marker.setTitle(json["IMEI"]);
                            //marker.customData = { Speed: json["Speed"], RealTimeLocation: json["RealTimeLocation"], IsLocated: json["IsLocated"], Direction: json["Direction"], UploadMode: json["UploadMode"], RealTimeOrSupply: json["RealTimeOrSupply"] };//自定义参数id
                            //map.addOverlay(marker);              // 将标注添加到地图中
                            //marker.addEventListener("click", test);
                            //marker.addEventListener('click', function (event,json) { test(event, json["RTUID"]); }, false);
                            //marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画	 
                            //alert(json["Longitude"]);
                            //ID, RTUID, ParRTUID, Latitude, Longitude
                            //for (var p in json) {//遍历json对象的每个key/value对,p为key
                            //    alert(json[p]);
                            //}
                        });
                        //console.log(gpsimeilist);
                        
                        for (var i = 0; i < gpsimeilist.length; i++) {
                            //console.log(gpsimeilist[i]);
                            //processGPS(gpsimeilist[i]);
                            //setTimeout(processGPS, 1200 * i, gpsimeilist[i]);
                            //processGPSByMe
                            processGPSByMe(gpsimeilist[i]);

                        }


                    },
                    complete: function (XMLHttpRequest, textStatus) {

                    },


                });
            }
            //$.ajax({
            //    type: "post",                          //提交方式
            //    url: "map.ashx",        //一般处理程序的路径
            //    data: { name: "map" },           //向后台传入的值
            //    dataType: "text",                       //返回值格式
            //    //dataType: "json",                       //返回值格式
            //    success: function (data) {
            //        if (data.error_key) {
            //            return;
            //        }
            //        var maps = eval("(" + data + ")");//转换为json对象 
            //        //alert(maps);
            //        //ID, RTUID, ParRTUID, Latitude, Longitude
            //        $.each(maps, function (idx, obj) {
            //            var json = JSON.parse(obj);
            //            //ID, IMEI, DateTime, Latitude, Longitude, Speed, RealTimeLocation, IsLocated, LongitudeEastWest, LatitudeSouthNorth, 
            //            //Direction, ACC, UploadMode, RealTimeOrSupply, AccumulatedMiles
            //            gpsimeilist.push(new GPSIMEI(json["IMEI"], json["DateTime"], json["Latitude"], json["Longitude"], json["Speed"], json["RealTimeLocation"],
            //                             json["IsLocated"], json["LongitudeEastWest"], json["LatitudeSouthNorth"], json["Direction"], json["ACC"], json["UploadMode"], json["RealTimeOrSupply"]));                         
            //            //var point = new BMap.Point(json["Longitude"], json["Latitude"]);
            //            ////var point = new BMap.Point(json["Latitude"], json["Longitude"]);
            //            /////jsdemo/img/car.png
            //            ////var myIcon = new BMapGL.Icon("http://lbsyun.baidu.com/jsdemo/img/car.png", new BMapGL.Size(52, 26));
            //            //var myIconError = new BMap.Icon("http://lbsyun.baidu.com/jsdemo/img/car.png", new BMap.Size(52, 26));
            //            //var marker = new BMap.Marker(point, { icon: myIconError });  // 创建标注
            //            ////marker.setTitle(json["RTUID"]);
            //            ////---------------------------------
            //            //////ID, IMEI, DateTime, Latitude, Longitude, Speed, RealTimeLocation, IsLocated, LongitudeEastWest, LatitudeSouthNorth, 
            //            ////Direction, ACC, UploadMode, RealTimeOrSupply, AccumulatedMiles
            //            ////var myIcon = new BMap.Icon("img/m_red.png", new BMap.Size(23, 25), {
            //            ////    offset: new BMap.Size(10, 25), // 指定定位位置
            //            ////    imageOffset: new BMap.Size(0, 0) // 设置图片偏移
            //            ////});
            //            ////var marker=new BMap.Marker(point,{icon:myIcon});
            //            ////----------------------------------
            //            //marker.setTitle(json["IMEI"]);
            //            //marker.customData = { Speed: json["Speed"], RealTimeLocation: json["RealTimeLocation"], IsLocated: json["IsLocated"], Direction: json["Direction"], UploadMode: json["UploadMode"], RealTimeOrSupply: json["RealTimeOrSupply"] };//自定义参数id
            //            //map.addOverlay(marker);              // 将标注添加到地图中
            //            //marker.addEventListener("click", test);
            //            ////marker.addEventListener('click', function (event,json) { test(event, json["RTUID"]); }, false);
            //            ////marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画	
            //            ////alert(json["Longitude"]);
            //            ////ID, RTUID, ParRTUID, Latitude, Longitude
            //            ////for (var p in json) {//遍历json对象的每个key/value对,p为key
            //            ////    alert(json[p]);
            //            ////}
            //        });
            //        processGPS(gpsimeilist);                  
            //    },
            //    complete: function (XMLHttpRequest, textStatus) {
            //    },
            //});
            ////--------------------------------------------------------------------------------
            setInterval(ajaxmap,60000);
            ajaxmap();
            ////---------------------------------------汽车marker点击事件-----------------------------------------------------------------------------
            function test(e) {

                var p = this.getPosition();       //获取marker的位置

                var opts = {
                    width: 200,     // 信息窗口宽度
                    height: 280,     // 信息窗口高度
                    title: "IMEI : "+e.target.customData.IMEI, // 信息窗口标题
                    //title: "车牌号 : " + e.target.customData.PlateNumber,
                    //enableMessage: true,//设置允许信息窗发送短息
                    //message: "亲耐滴，晚上一起吃个饭吧？戳下面的链接看下地址喔~"
                }
                //var infoWindow = new BMap.InfoWindow("纬度:" + p.lat + ",经度:" + p.lng + "</br><a style='color:red' href='stations.aspx?rtuid=" + this.getTitle() + "'>详细信息</a>", opts);
                var speed = e.target.customData.Speed;
                var realtimelocation = e.target.customData.RealTimeLocation;
                var islocated = e.target.customData.IsLocated;
                var direction = e.target.customData.Direction;
                var uploadmode = e.target.customData.UploadMode;
                var realtimesupply = e.target.customData.RealTimeOrSupply;
                var latitudesouthnorth = e.target.customData.LatitudeSouthNorth;
                var longitudeeastwest = e.target.customData.LongitudeEastWest;
                var acc = e.target.customData.ACC;
                var datetime = e.target.customData.DateTime;
                var plateNumber = e.target.customData.PlateNumber;
                //var imei = e.target.customData.IMEI;
                //marker.customData = { Speed: gpslist[i].Speed, RealTimeLocation: gpslist[i].RealTimeLocation, IsLocated: gpslist[i].IsLocated, Direction: gpslist[i].Direction, UploadMode: gpslist[i].UploadMode, RealTimeOrSupply: gpslist[i].RealTimeOrSupply };
                //ID, IMEI, DateTime, Latitude, Longitude, Speed, RealTimeLocation, IsLocated, LongitudeEastWest, LatitudeSouthNorth, 
                //Direction, ACC, UploadMode, RealTimeOrSupply, AccumulatedMiles
                var infoWindow = new BMapGL.InfoWindow("车牌号： " + plateNumber + "<br/>" + latitudesouthnorth + " : " + p.lat + "<br/>" + longitudeeastwest + " : " + p.lng + "<br/>速度 : " + speed + " km/h<br/>定位方式 ： " +
                              realtimelocation + "<br/>定位与否 ： " + islocated + "<br/>方向 ： " + direction + "<br/>上报方式 ：" +
                                uploadmode + "<br/>实时补传 ： " + realtimesupply + "<br/>ACC ： " + acc + "<br/>最新时间 ： " + datetime, opts);
                map.openInfoWindow(infoWindow, p);
            }


        });
    </script>
</body>
</html>
