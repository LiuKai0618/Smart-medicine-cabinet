<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="maphistory.aspx.cs" Inherits="SmartHome.maphistory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
     <%--<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=8MZLMmFUIhAg2sI7ITa5RlsR6KEZdzAG"></script>--%>
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
</head>
<body>

<!--Header-part-->
<div id="header">
  <h1><a href="index.aspx">新左旗车辆管理系统</a></h1>
</div>
<!--close-Header-part--> 


<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text" id="loginuser" runat="server">用户</span><b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a href="#"><i class="icon-user"></i> 简介</a></li>
        <li class="divider"></li>
        <li><a href="userManager.aspx"><i class="icon-check"></i> 用户管理</a></li>
        <li class="divider"></li>
        <li><a href="login.html"><i class="icon-key"></i> 注销</a></li>
      </ul>
    </li>
    <li class="dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">消息</span> <span class="label label-important">5</span> <b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a class="sAdd" title="" href="#"><i class="icon-plus"></i> 发消息</a></li>
        <li class="divider"></li>
        <li><a class="sInbox" title="" href="#"><i class="icon-envelope"></i> 收件箱</a></li>
        <li class="divider"></li>
        <li><a class="sOutbox" title="" href="#"><i class="icon-arrow-up"></i> 发件箱</a></li>
        <li class="divider"></li>
        <li><a class="sTrash" title="" href="#"><i class="icon-trash"></i> 垃圾箱</a></li>
      </ul>
    </li>
    <li class=""><a title="" href="#"><i class="icon icon-cog"></i> <span class="text">设置</span></a></li>
    <li class=""><a title="" href="login.html"><i class="icon icon-share-alt"></i> <span class="text">注销</span></a></li>
  </ul>
</div>
<!--close-top-Header-menu-->
<!--start-top-serch-->
<div id="search">
  <input type="text" placeholder="搜索..."/>
  <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
</div>
<!--close-top-serch-->
<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard11</a>
  <ul>
     

       <%--<li class="active"> <a href="map.aspx"><i class="icon icon-signal"></i> <span>车辆历史轨迹</span></a> </li>--%>
      <li> <a href="map.aspx"><i class="icon icon-signal"></i> <span>车辆最新定位</span></a> </li>
       <li class="active"> <a href="maphistory.aspx"><i class="icon icon-pencil"></i> <span>车辆历史轨迹</span></a> </li>
             <li> <a href="carMaphistory.aspx"><i class="icon icon-pencil"></i> <span>查看车辆历史轨迹</span></a> </li>

        <li class="submenu"><a href="#"><i class="icon icon-cog"></i> <span>车辆信息管理</span></a>
        <ul>
            <li><a href="carManage.aspx">用车申请</a></li>
            <li><a href="carCheck.aspx">用车审批</a></li>
            <li><a href="carReturn.aspx">归还登记</a></li>
           <%-- <li><a href="carMaintain.aspx">维修登记</a></li>
            <li><a href="carOil.aspx">加油登记</a></li>--%>
        </ul>    
      </li>
      <%-- <li> <a href="#"><i class="icon icon-fullscreen"></i> <span>异常用车分析</span></a> </li>--%>
      <li> <a href="CarException.aspx"><i class="icon icon-fullscreen"></i> <span>异常用车分析</span></a> </li>
      <%-- <li> <a href="personManage.aspx"><i class="icon icon-th"></i> <span>人员管理</span></a> </li>
       <li> <a href="depManage.aspx"><i class="icon icon-home"></i> <span>部门管理</span></a> </li>
      <li> <a href="userManager.aspx"><i class="icon icon-user"></i> <span>系统权限</span></a> </li>--%>
      <li class="submenu"><a href="#"><i class="icon icon-th"></i> <span>基础数据维护</span></a>
           <ul>
                <li> <a href="personManage.aspx"> 人员管理</a> </li>
                 <li> <a href="depManage.aspx">部门管理</a> </li>
                  <li> <a href="userManager.aspx">系统权限</a> </li>
           </ul>   
       </li>
     <li> <a href="bigscreen.aspx"><i class="icon icon-facetime-video"></i> <span>大屏展示</span></a> </li>
       <%----------------------------------------------------------------------------------------------------------------------%>
      <li class="submenu"><a href="#"><i class="icon icon-inbox"></i> <span>其他查询登记</span></a>
           <ul>
                <li> <a href="index.aspx"> 车辆最新信息</a> </li>
                 <li> <a href="stations.aspx">车辆历史信息</a> </li>
                  <li> <a href="carMaintain.aspx">维修登记</a> </li>
               <li> <a href="carOil.aspx">加油登记</a> </li>
                <li> <a href="mbManage.aspx">小药箱管理</a> </li>
               <li> <a href="trackManage.aspx">车辆轨迹管理</a> </li>
           </ul>   
       </li>
      <%----------------------------------------------------------------------------------------------------------------------%>
       <%--<li> <a href="index.aspx"><i class="icon icon-inbox"></i> <span>车辆最新信息</span></a> </li>
       <li><a href="stations.aspx"><i class="icon icon-tint"></i> <span>车辆历史信息</span></a></li>--%>
  </ul>
</div>
<!--sidebar-menu-->


<!--main-container-part-->
<div id="content" style="padding-bottom:0px">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="maphistory.aspx" title="车辆历史轨迹" class="tip-bottom"><i class="icon-pencil"></i>车辆历史轨迹</a></div>
  </div>

    <%--horizontal--%>








      <form action="#" method="get" class="form-horizontal">
            <div class="form-group">
                <label class="control-label">请选择查询的车牌号码：</label>               
                <div class="controls">
                    <select id="rtuidselect" class="select2">
                    </select>                  
                    
                </div>              
            </div>
           <div class="form-group">
               
                <label class="control-label">请选择开始和结束日期：</label>
               
                <div class="controls">
                    <input class="form-control" id="startDate" type="date"/>
                     <input class="form-control" id="endDate" type="date"/>
                    <input class="btn btn-primary" type="button" value="确定" id="startendBtn" style="margin-left:40px;"/>
                </div> 
                          
            </div>
          

        </form>

<!--End-breadcrumbs-->
    <!--<div class="container-fluid">-->

     <%--<form action="#" method="get" class="form-horizontal">
         <div class="control-group">
           <label class="control-label" for="startTime">请选择开始时间：</label>
           <div class="controls">
            <input id="startTime" type="text" placeholder="请输入开始时间！" data-title="请输入开始时间！" class="tip" data-original-title=""/>
            </div>


             <label class="control-label" for="endTime">请选择结束时间：</label>
           <div class="controls">
            <input id="endTime" type="text" placeholder="请选择结束时间！" data-title="请选择结束时间！" class="tip" data-original-title=""/>
            </div>

             <button id="okBtn" type="button" class="btn btn-primary">查询</button>


         </div>--%>
          <%--<div class="control-group">
           <label class="control-label" for="endTime">请选择结束时间：</label>
           <div class="controls">
            <input id="endTime" type="text" placeholder="请选择结束时间！" data-title="请选择结束时间！" class="tip" data-original-title=""/>
            </div>
         </div>--%>
      <%--   <div class="form-actions">
          <button id="okBtn" type="button" class="btn btn-primary">查询</button>
          </div>--%>


           <%-- <div class="control-group">
                <label class="control-label">请选择查询的设备ID：</label>
                <div class="controls">
                    <select id="rtuidselect" class="select2">
                    </select>
                </div>
            </div>--%>
       <%-- </form>--%>
    <div class="container" style="width:auto">
        <div id="allmap" style="background-color:red;width:100%;height:863px;margin-bottom:0px">

        </div>
        <!--<hr>-->
    </div>

  
</div>
<!--end-main-container-part-->


<!--Footer-part-->
<div class="row-fluid">
  <div id="footer" class="span12"> 2020 &copy;新左旗车辆管理系统. Brought to you by <a href="#">新左旗车辆管理系统</a> </div>
</div>
<!--end-Footer-part-->
    <audio src="img/warn.mp3" id="myaudio" loop="loop" hidden="hidden" ></audio>
 <div id="myModalWarn" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">异常信息</h4>
                    </div>
                    <div class="modal-body">
                        <!--<h4>模态框中的文本</h4>-->
                        <p id="jinggaomodelWarn"></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" id="modelWarnBtn" class="btn btn-primary">确定</button>
                    </div>
                </div>
            </div>
        </div>
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.ui.custom.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.uniform.js"></script>
    <script src="js/select2.min.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/matrix.js"></script>
    <script src="js/matrix.tables.js"></script>
    <script src="js/timeout2login.js" type="text/javascript"></script>
     <script src="js/feetbackdisplayornot.js" type="text/javascript"></script>
     <%--<script src="js/warning.js" type="text/javascript"></script>--%>
    <script type="text/javascript">
        $(function () {
            //--------------------------------------------------------------------------------------------//
            var tempstartdatetime;
            var tempenddatetime;
            //--------------------------------------------------------------------------------------------//
            $('#myModal').modal({
                backdrop: false,
                keyboard: false,
                show: true,

            });
            //--------------------------------------------------------------------------------------------//
            var imei;
            //--------------------------------------------------------------------------------------------//
            $.ajax({
                type: "post",                          //提交方式
                url: "index.ashx",        //一般处理程序的路径
                //data: { name: "rtuid" },                    //向后台传入的值
                data: { name: "rtuidselect" },
                dataType: "html",                       //返回值格式
                success: function (data) {
                    //console.log(data);
                    $("#rtuidselect").append(data);
                    var sel2 = $("#rtuidselect").select2();
                    var first = $("#rtuidselect option:first").attr("value");
                    //console.log(first);
                    if (first != "nodata") {
                        imei = first;
                        loaddata();
                        //setmydatatable();
                        sel2.val(first).trigger("change");
                        sel2.change(function () {
                            //alert(sel2.val());
                            //$("#mydatatable").dataTable().fnClearTable();
                            //$("#mydatatable").dataTable().fnDestroy();
                            //setmydatatable();
                            imei = sel2.val();
                            //loaddata();
                            $("#startendBtn").trigger('click');

                        });
                    }
                    //alert(first);
                    //setmydatatable();


                },
                complete: function (XMLHttpRequest, textStatus) {
                    $('#myModal').modal('hide');
                },


            });

            //--------------------------------------------------------------------------------------------//
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
            //--------------------------------------------------------------------------------------------//
            function processGPSByMe(gpslist) {
                //-------------------------------第一个点的时间和最后一个点的时间-----------------------------------------------------------
                var listlength = gpslist.length;
                var enddatetime = new Date(gpslist[listlength - 1].DateTime);
                var startdatetime = new Date(gpslist[0].DateTime);
                //------------------------------------------------------------------------------------------
                var day1 = ("0" + startdatetime.getDate()).slice(-2);
                //格式化月，如果小于9，前面补0
                var month1 = ("0" + (startdatetime.getMonth() + 1)).slice(-2);
                //拼装完整日期格式
                var today1 = startdatetime.getFullYear() + "-" + (month1) + "-" + (day1);
                //完成赋值
                if (tempstartdatetime) {
                    $('#startDate').val(tempstartdatetime);
                }
                else {
                    tempstartdatetime = today1;
                    $('#startDate').val(today1);
                }
                //$('#startDate').val(today1);
                //------------------------------------------------------------------------------------------
                var day2 = ("0" + enddatetime.getDate()).slice(-2);
                //格式化月，如果小于9，前面补0
                var month2 = ("0" + (enddatetime.getMonth() + 1)).slice(-2);
                //拼装完整日期格式
                var today2 = enddatetime.getFullYear() + "-" + (month2) + "-" + (day2);
                //完成赋值
                if (tempenddatetime) {
                    $('#endDate').val(tempenddatetime);
                }
                else {
                    tempenddatetime = today2;
                    $('#endDate').val(today2);
                }

                //$('#endDate').val(today2);
                //------------------------------------------------------------------------------------------
                //console.log("startdatetime" + startdatetime.toLocaleDateString());
                //console.log("enddatetime" + enddatetime.toLocaleDateString());

                //------------------------------------------------------------------------------------------




                //------------------------------------------------------------------------------------------
                var points = [];
                for (var i = 0; i < gpslist.length; i++) {
                    points.push(new BMapGL.Point(gpslist[i].Longitude, gpslist[i].Latitude));
                }
                //------------------------------------------------------------------------------------------
                //最后一个点加maker和注册点击事件，所有的点连线
                //------------------------------------------------------------------------------------------
                var lastIndex = points.length - 1;
                var tempPoint = points[lastIndex];
                var myIconError = new BMapGL.Icon("img/car.png", new BMapGL.Size(25, 25));
                var marker = new BMapGL.Marker(tempPoint, { icon: myIconError });  // 创建标注
                //定位到当前车辆的最新位置为地图的中心点
                map.panTo(tempPoint);
                //marker.setTitle(gpslist[lastIndex].IMEI);
                marker.setTitle(plateNumberByIMEI(gpslist[lastIndex].IMEI));
                marker.customData = {
                    Speed: gpslist[lastIndex].Speed, RealTimeLocation: gpslist[lastIndex].RealTimeLocation, IsLocated: gpslist[lastIndex].IsLocated,
                    Direction: gpslist[lastIndex].Direction, UploadMode: gpslist[lastIndex].UploadMode, RealTimeOrSupply: gpslist[lastIndex].RealTimeOrSupply,
                    DateTime: gpslist[lastIndex].DateTime, LongitudeEastWest: gpslist[lastIndex].LongitudeEastWest, LatitudeSouthNorth: gpslist[lastIndex].LatitudeSouthNorth,
                    ACC: gpslist[lastIndex].ACC, PlateNumber: plateNumberByIMEI(gpslist[lastIndex].IMEI), IMEI: gpslist[lastIndex].IMEI
                };
                map.addOverlay(marker);              // 将标注添加到地图中
                marker.addEventListener("click", test);
                //------------------------------------------------------------------------------------------
                //for (var i = 0; i < data.points.length; i++) {
                //点划线
                var polyline = new BMapGL.Polyline(points, {
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
            }
            //--------------------------------------------------------------------------------------------//
            //--------------------------------------------------------------------------------------------//
            function processGPS(gpslist)
            {
                //先清除覆盖物，所有的
                //map.clearOverlays();
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
                        //最后一个点加maker和注册点击事件，所有的点连线
                        //------------------------------------------------------------------------------------------
                        var lastIndex = data.points.length - 1;
                        var tempPoint = data.points[lastIndex];
                        var myIconError = new BMapGL.Icon("img/car.png", new BMapGL.Size(25, 25));
                        var marker = new BMapGL.Marker(tempPoint, { icon: myIconError });  // 创建标注

                        //marker.setTitle(gpslist[lastIndex].IMEI);
                        marker.setTitle(plateNumberByIMEI(gpslist[lastIndex].IMEI));
                        marker.customData = {
                            Speed: gpslist[lastIndex].Speed, RealTimeLocation: gpslist[lastIndex].RealTimeLocation, IsLocated: gpslist[lastIndex].IsLocated,
                            Direction: gpslist[lastIndex].Direction, UploadMode: gpslist[lastIndex].UploadMode, RealTimeOrSupply: gpslist[lastIndex].RealTimeOrSupply,
                            DateTime: gpslist[lastIndex].DateTime, LongitudeEastWest: gpslist[lastIndex].LongitudeEastWest, LatitudeSouthNorth: gpslist[lastIndex].LatitudeSouthNorth,
                            ACC: gpslist[lastIndex].ACC, PlateNumber: plateNumberByIMEI(gpslist[lastIndex].IMEI), IMEI: gpslist[lastIndex].IMEI
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



                            //var tempPoint = data.points[i];
                            //var myIconError = new BMap.Icon("img/car.png", new BMap.Size(25, 25));
                            //var marker = new BMap.Marker(tempPoint, { icon: myIconError });  // 创建标注
                            //marker.setTitle(gpslist[i].IMEI);
                            //marker.customData = {
                            //    Speed: gpslist[i].Speed, RealTimeLocation: gpslist[i].RealTimeLocation, IsLocated: gpslist[i].IsLocated,
                            //    Direction: gpslist[i].Direction, UploadMode: gpslist[i].UploadMode, RealTimeOrSupply: gpslist[i].RealTimeOrSupply,
                            //    DateTime: gpslist[i].DateTime, LongitudeEastWest: gpslist[i].LongitudeEastWest, LatitudeSouthNorth: gpslist[i].LatitudeSouthNorth,
                            //    ACC: gpslist[i].ACC
                            //};
                            //map.addOverlay(marker);              // 将标注添加到地图中
                            //marker.addEventListener("click", test);
                            //bm.addOverlay(new BMap.Marker(data.points[i]));
                            //bm.setCenter(data.points[i]);
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
            var map = new BMapGL.Map("allmap");
            //var point = new BMap.Point(116.8177699684, 36.5642704788);
            var point = new BMapGL.Point(119.734658, 48.639497);
            //map.centerAndZoom(point, 8);
            map.centerAndZoom(point, 11);
            map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
            map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用

            //var top_left_control = new BMapGL.ScaleControl({ anchor: BMAP_ANCHOR_TOP_LEFT });// 左上角，添加比例尺
            //var top_left_navigation = new BMapGL.NavigationControl();  //左上角，添加默认缩放平移控件
            //var top_right_navigation = new BMapGL.NavigationControl({ anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL }); //右上角，仅包含平移和缩放按钮
            /*缩放控件type有四种类型:
            BMAP_NAVIGATION_CONTROL_SMALL：仅包含平移和缩放按钮；BMAP_NAVIGATION_CONTROL_PAN:仅包含平移按钮；BMAP_NAVIGATION_CONTROL_ZOOM：仅包含缩放按钮*/

            //map.addControl(top_left_control);
            //map.addControl(top_left_navigation);
            //map.addControl(top_right_navigation);
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
            //ajax 
            
            var gpsimeilist = [];
            function loaddata() {
                $.ajax({
                    type: "post",                          //提交方式
                    async:false,
                    url: "map.ashx",        //一般处理程序的路径
                    data: { name: imei },           //向后台传入的值
                    dataType: "text",                       //返回值格式
                    //dataType: "json",                       //返回值格式
                    success: function (data) {
                        if (data.error_key) {
                            return;
                        }

                        var maps = eval("(" + data + ")");//转换为json对象 
                        gpsimeilist = [];
                        map.clearOverlays();
                        //alert(maps);
                        //ID, RTUID, ParRTUID, Latitude, Longitude
                        $.each(maps, function (idx, obj) {
                            var json = JSON.parse(obj);
                            //ID, IMEI, DateTime, Latitude, Longitude, Speed, RealTimeLocation, IsLocated, LongitudeEastWest, LatitudeSouthNorth, 
                            //Direction, ACC, UploadMode, RealTimeOrSupply, AccumulatedMiles

                            gpsimeilist.push(new GPSIMEI(json["IMEI"], json["DateTime"], json["Latitude"], json["Longitude"], json["Speed"], json["RealTimeLocation"],
                                             json["IsLocated"], json["LongitudeEastWest"], json["LatitudeSouthNorth"], json["Direction"], json["ACC"], json["UploadMode"], json["RealTimeOrSupply"]));


                            //var point = new BMap.Point(json["Longitude"], json["Latitude"]);
                            //var point = new BMap.Point(json["Latitude"], json["Longitude"]);
                            //jsdemo/img/car.png
                            //var myIcon = new BMapGL.Icon("http://lbsyun.baidu.com/jsdemo/img/car.png", new BMapGL.Size(52, 26));
                            //var myIconError = new BMap.Icon("http://lbsyun.baidu.com/jsdemo/img/car.png", new BMap.Size(52, 26));
                            //var marker = new BMap.Marker(point, { icon: myIconError });  // 创建标注
                            //marker.setTitle(json["RTUID"]);
                            //---------------------------------
                            //ID, IMEI, DateTime, Latitude, Longitude, Speed, RealTimeLocation, IsLocated, LongitudeEastWest, LatitudeSouthNorth, 
                            ////Direction, ACC, UploadMode, RealTimeOrSupply, AccumulatedMiles
                            ////var myIcon = new BMap.Icon("img/m_red.png", new BMap.Size(23, 25), {
                            ////    offset: new BMap.Size(10, 25), // 指定定位位置
                            ////    imageOffset: new BMap.Size(0, 0) // 设置图片偏移
                            ////});
                            ////var marker=new BMap.Marker(point,{icon:myIcon});
                            ////----------------------------------
                            //marker.setTitle(json["IMEI"]);
                            //marker.customData = { Speed: json["Speed"], RealTimeLocation: json["RealTimeLocation"], IsLocated: json["IsLocated"], Direction: json["Direction"], UploadMode: json["UploadMode"], RealTimeOrSupply: json["RealTimeOrSupply"] };//自定义参数id
                            //map.addOverlay(marker);              // 将标注添加到地图中
                            //marker.addEventListener("click", test);
                            ////marker.addEventListener('click', function (event,json) { test(event, json["RTUID"]); }, false);
                            ////marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画	 

                            ////alert(json["Longitude"]);
                            ////ID, RTUID, ParRTUID, Latitude, Longitude
                            ////for (var p in json) {//遍历json对象的每个key/value对,p为key
                            ////    alert(json[p]);

                            ////}
                        });
                        //processGPS(gpsimeilist); 
                        processGPSByMe(gpsimeilist);


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

            //setInterval(loaddata, 60000);
            setInterval(loaddatanew, 60000);
            function test(e) {

                var p = this.getPosition();       //获取marker的位置

                var opts = {
                    width: 200,     // 信息窗口宽度
                    height: 280,     // 信息窗口高度
                    title: "IMEI : " + e.target.customData.IMEI,
                    //title: "IMEI : "+this.getTitle(), // 信息窗口标题
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
                //marker.customData = { Speed: gpslist[i].Speed, RealTimeLocation: gpslist[i].RealTimeLocation, IsLocated: gpslist[i].IsLocated, Direction: gpslist[i].Direction, UploadMode: gpslist[i].UploadMode, RealTimeOrSupply: gpslist[i].RealTimeOrSupply };
                //ID, IMEI, DateTime, Latitude, Longitude, Speed, RealTimeLocation, IsLocated, LongitudeEastWest, LatitudeSouthNorth, 
                //Direction, ACC, UploadMode, RealTimeOrSupply, AccumulatedMiles
                var infoWindow = new BMapGL.InfoWindow("车牌号： " + plateNumber + "<br/>" + latitudesouthnorth + " : " + p.lat + "<br/>" + longitudeeastwest + " : " + p.lng + "<br/>速度 : " + speed + " km/h<br/>定位方式 ： " +
                              realtimelocation + "<br/>定位与否 ： " + islocated + "<br/>方向 ： " + direction + "<br/>上报方式 ：" +
                                uploadmode + "<br/>实时补传 ： " + realtimesupply + "<br/>ACC ： " + acc + "<br/>最新时间 ： " + datetime, opts);
                map.openInfoWindow(infoWindow, p);
            }
            function loaddatanew() {
                $("#startendBtn").trigger('click');
            }
            function loaddataStartEnd(startdate, enddate) {
                $.ajax({
                    type: "post",                          //提交方式
                    url: "map.ashx",        //一般处理程序的路径
                    data: { name: "startend", startdatetime: startdate, enddatetime: enddate,platenumber:imei },           //向后台传入的值
                    dataType: "text",                       //返回值格式
                    //dataType: "json",                       //返回值格式
                    success: function (data) {

                        var maps = eval("(" + data + ")");//转换为json对象 

                        //console.log(maps);
                        //console.log();
                        //console.log("---------------------------");
                        if (maps["error_key"]) {
                            //console.log(maps["error_key"]);
                            return;
                        }

                        var maps = eval("(" + data + ")");//转换为json对象 
                        gpsimeilist = [];
                        map.clearOverlays();
                        $.each(maps, function (idx, obj) {
                            var json = JSON.parse(obj);

                            gpsimeilist.push(new GPSIMEI(json["IMEI"], json["DateTime"], json["Latitude"], json["Longitude"], json["Speed"], json["RealTimeLocation"],
                                             json["IsLocated"], json["LongitudeEastWest"], json["LatitudeSouthNorth"], json["Direction"], json["ACC"], json["UploadMode"], json["RealTimeOrSupply"]));


                        });
                        processGPSByMe(gpsimeilist);


                    },
                    complete: function (XMLHttpRequest, textStatus) {

                    },


                });
            }
            $("#startendBtn").on('click', function () {
                var startDate = $("#startDate").val();
                var endDate = $("#endDate").val();

                if (startDate == "" || startDate == "") {
                    alert("请将开始日期或结束日期等信息填写完整！");
                    return;
                }

                //console.log(new Date(startDate));
                //console.log(new Date(endDate));

                //console.log(new Date(startDate).getTime());
                //console.log(new Date(endDate).getTime());

                if (new Date(startDate).getTime() > new Date(endDate).getTime()) {
                    alert("开始日期不能大于结束日期！");
                    endDate = $("#startDate").val();
                    $("#endDate").val(startDate);
                }
                

                tempstartdatetime = startDate;
                tempenddatetime = endDate;
                loaddataStartEnd(startDate, endDate);
            });
        });
    </script>
</body>
</html>
