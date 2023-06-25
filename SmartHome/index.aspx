<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SmartHome.index1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>新左旗车辆管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/uniform.css" />
<link rel="stylesheet" href="css/select2.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'/>
<link rel="stylesheet" type="text/css" href="css/index.css" />
</head>
<body>
<div id="header">
    
  <h1><a href="index.aspx">新左旗车辆管理系统</a></h1>
</div>

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
      
       <li> <a href="map.aspx"><i class="icon icon-signal"></i> <span>车辆最新定位</span></a> </li>
       <li> <a href="maphistory.aspx"><i class="icon icon-pencil"></i> <span>车辆历史轨迹</span></a> </li>

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
       <li> <a href="CarException.aspx"><i class="icon icon-fullscreen"></i> <span>异常用车分析</span></a> </li>

      <li class="submenu"><a href="#"><i class="icon icon-th"></i> <span>基础数据维护</span></a>
           <ul>
                <li> <a href="personManage.aspx"> 人员管理</a> </li>
                 <li> <a href="depManage.aspx">部门管理</a> </li>
                  <li> <a href="userManager.aspx">系统权限</a> </li>
           </ul>   
       </li>
      <li> <a href="bigscreen.aspx"><i class="icon icon-facetime-video"></i> <span>大屏展示</span></a> </li>
        <%----------------------------------------------------------------------------------------------------------------------%>
      <li class="submenu open"><a href="#"><i class="icon icon-inbox"></i> <span>其他查询登记</span></a>
           <ul>
                <li class="active"> <a href="index.aspx"> 车辆最新信息</a> </li>
                 <li> <a href="stations.aspx">车辆历史信息</a> </li>
                  <li> <a href="carMaintain.aspx">维修登记</a> </li>
               <li> <a href="carOil.aspx">加油登记</a> </li>
                <li> <a href="mbManage.aspx">小药箱管理</a> </li>
               <li> <a href="trackManage.aspx">车辆轨迹管理</a> </li>
           </ul>   
       </li>
 
   
  </ul>
</div>
<!--sidebar-menu-->


<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.aspx" title="车辆最新信息" class="tip-bottom"><i class="icon-inbox"></i>车辆最新信息</a></div>
  </div>
<!--End-breadcrumbs-->
    <div class="container-fluid">
        <div class="widget-box">
            <div class="widget-title">
                <span class="icon"><i class="icon-th"></i></span>
                <h5>车辆最新信息</h5>
            </div>
<!--在这里写搜索框-->
             </div>
            <div class="form-group">
               
              <label class="control-label">请选择开始和结束日期：</label>
             
              <div class="controls">
                  <input class="form-control" id="startDate" type="date"/>
                   <input class="form-control" id="endDate" type="date"/>
                  <input class="btn btn-primary" type="button" value="确定" id="startendBtn" style="margin-left:40px;"/>
              </div> 
                        
          </div>
            <div class="widget-content nopadding">
                <!--<table id="mydatatable" class="table table-bordered data-table">-->
                <table id="mydatatable" class="table table-bordered table-striped table-hover table-condensed">
                    <thead>
                        <tr>
                              <%--//ID, IPPort, IMEI, GasElectricSwitch, LocationSwitch, Charging, ACC, Garrison, PowerLevel, SignalIntensity, DateTime--%>
                            <th>车牌号码</th>
                            <th>设备ID</th>
                            <th>油电状态</th>
                            <th>定位与否</th>
                            <th>充电状态</th>
                            <th>ACC</th>
                            <th>设防撤防</th>
                            <th>电量等级</th>
                            <th>信号强度</th>
                            <th>日期时间</th>
                            </tr>
                    </thead>
                    <tbody id="rtu2mms"></tbody>
                </table>
            </div>
        </div>
    </div>
<!--end-main-container-part-->


<!--Footer-part-->
<div class="row-fluid">
  <div id="footer" class="span12"> 2020 &copy;新左旗车辆管理系统. Brought to you by <a href="#">新左旗车辆管理系统</a> </div>
</div>

    
        <div id="myModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!--<div class="modal-header">
                        <h4 class="modal-title">提示</h4>
                    </div>-->
                    <div class="modal-body">
                        <!--<h4>模态框中的文本</h4>-->
                        <p>请稍后，数据努力加载中&hellip;</p>
                    </div>

                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
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
        <script type="text/javascript">
            $("#startendBtn").on('click', function () {
                var startDate = $("#startDate").val();
                var endDate = $("#endDate").val();
                $("#mydatatable").dataTable().fnDestroy();

                $('#myModal').modal({
                    backdrop:false,
                    keyboard: false,
                    show:true,

                });
                $("#rtu2mms").empty();//empty删除被选元素的子元素
                $.ajax({
                    type: "post",                          //提交方式
                    url: "index.ashx",        //一般处理程序的路径
                    data: { name: "rtu2mms", startdatetime: startDate, enddatetime: endDate },           //向后台传入的值
                    dataType: "html",                       //返回值格式
                    success: function (data) {
  
                        $("#rtu2mms").append(data);//append函数追加元素的功能  #选取id为rtu2mms的组件 也就是表格
                        
                    },
                    complete: function (XMLHttpRequest, textStatus) {
                        $('#myModal').modal('hide');
                        //set datatable  开始设置表格插件
                        $("#mydatatable").dataTable({
                            "sPaginationType": "full_numbers",//用于指定分页器风格
                            "bInfo": false,//开关，是否显示表格的一些信息
                            "bPaginate": true,//翻页的功能
                            "sSearch": true,
                            //"dom": 'iCflrtp',
                            //aoColumnDefs设置列的属性时，可以任意指定列，并且不需要给所有列都设置。
                            "aoColumnDefs": [{
                                sDefaultContent: '',
                                aTargets: ['_all']
                            }],
                            "bJQueryUI": true,//是否使用jquery ui themeroller的风格（不是很懂）
                            //国际化配置  否则生成的表格是英文的
                            "oLanguage": { 
                                "sProcessing": "正在获取数据，请稍后...",
                                "sLengthMenu": "显示 _MENU_ 条",
                                "sZeroRecords": "没有您要搜索的内容",
                                "sInfo": "从 _START_ 到  _END_ 条记录 总记录数为 _TOTAL_ 条",
                                "sInfoEmpty": "记录数为0",
                                "sInfoFiltered": "(全部记录数 _MAX_ 条)",
                                "sInfoPostFix": "",
                                "sSearch": "搜索",
                                "sUrl": "",
                                "oPaginate": {
                                    "sFirst": "第一页",
                                    "sPrevious": "上一页",
                                    "sNext": "下一页",
                                    "sLast": "最后一页"
                                }
                            },
                       




                        });

                    },


                });
            });
 
         
        </script>

</body>
</html>
