<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mbManage.aspx.cs" Inherits="SmartHome.mbManage" %>

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
    <link rel="stylesheet" type="text/css" href="css/stations.css" />
    
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
      

    
      <li> <a href="map.aspx"><i class="icon icon-signal"></i> <span>车辆最新定位</span></a> </li>
       <li> <a href="maphistory.aspx"><i class="icon icon-pencil"></i> <span>车辆历史轨迹</span></a> </li>
             <li> <a href="carMaphistory.aspx"><i class="icon icon-pencil"></i> <span>查看车辆历史轨迹</span></a> </li>
        <li class="submenu"><a href="#"><i class="icon icon-cog"></i> <span>车辆信息管理</span></a>
        <ul>
            <li><a href="carManage.aspx">用车申请</a></li>
            <li><a href="carCheck.aspx">用车审批</a></li>
            <li><a href="carReturn.aspx">归还登记</a></li>
        </ul>    
      </li>
       <li> <a href="CarException.aspx"><i class="icon icon-fullscreen"></i> <span>异常用车分析</span></a> </li>
    
      <li class="submenu"><a href="#"><i class="icon icon-th"></i> <span>基础数据维护</span></a>
           <ul>
                <li class="active"> <a href="personManage.aspx"> 人员管理</a> </li>
                 <li> <a href="depManage.aspx">部门管理</a> </li>
                  <li> <a href="userManager.aspx">系统权限</a> </li>
           </ul>   
       </li>
   <li> <a href="bigscreen.aspx"><i class="icon icon-facetime-video"></i> <span>大屏展示</span></a> </li>
       <%----------------------------------------------------------------------------------------------------------------------%>
      <li class="submenu open"><a href="#"><i class="icon icon-inbox"></i> <span>其他查询登记</span></a>
           <ul>
                <li> <a href="index.aspx"> 车辆最新信息</a> </li>
                 <li> <a href="stations.aspx">车辆历史信息</a> </li>
                  <li> <a href="carMaintain.aspx">维修登记</a> </li>
               <li> <a href="carOil.aspx">加油登记</a> </li>
               <li class="active"> <a href="mbManage.aspx">小药箱管理</a> </li>
               <li> <a href="trackManage.aspx">车辆轨迹管理</a> </li>
           </ul>   
       </li>
      <%----------------------------------------------------------------------------------------------------------------------%>

    
  </ul>
</div>
<!--sidebar-menu-->


<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="mbManage.aspx" title="小药箱管理" class="tip-bottom"><i class="icon-th"></i>小药箱管理</a></div>
  </div>
<!--End-breadcrumbs-->
    <div class="container-fluid">
       
        <div style="margin-top:6px;" class="row-fluid">
            <div style="" class="span2 offset11">
                <button id="detailBtn" type="button" style="" class="btn btn-mini btn-success">小药箱报表</button> 
            </div>
        </div>
        <div style="margin-top:0px;" class="widget-box">
            <div class="widget-title">
                <span class="icon"><i class="icon-th"></i></span>
                <h5>小药箱管理</h5>   
                <%--<button id="addBtn" type="button" style="margin-right:15px;" class="btn btn-mini btn-success">新增人员</button>    --%>         
                </div>
            <div class="widget-content nopadding">
                <!--<table class="table table-bordered data-table">-->
                <table id="mydatatable" class="table table-bordered table-striped table-hover table-condensed">
                    <thead>
                        <tr>
                            <th>东经</th>
                            <th>北纬</th>
                            <th>登录用户</th>
                            <th>小药箱标签</th>
                            <th>小药箱名字</th>
                            <th>操作</th>
                            </tr>
                    </thead>
                    <tbody id="station">
                        <tr><td colspan='10' style='text-align:center;font-size:10px;font-weight:bold;color:#666666;background:#efefef'>表 格 数 据 为 空！</td></tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

  
</div>
<!--end-main-container-part-->


<!--Footer-part-->
<div class="row-fluid">
  <div id="footer" class="span12"> 2020 &copy;新左旗车辆管理系统. Brought to you by <a href="#">新左旗车辆管理系统</a> </div>
</div>
    <%-----------------------------------------------------------------------------------------------------------------------------------------------------------%>
     <!-------------------------------------------add mb------------------------------------------->
    
                <!-------------------------------------------edit person------------------------------------------->
                <div class="modal fade" id="editMbModal" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">编辑小药箱</h4>
                            </div>
                            <div id="editMbModalBody" class="modal-body">                               
                                <form class="form-horizontal">
                                    <%-- lnglat, userName, color, boxName--%>
                                    <!-----------------------------------------editLng---------------------------------------------->
                                    <div class="form-group">
                                        <label for="editLng" class="control-label">东经:</label>
                                        <div class="controls">
                                            <input class="form-control" id="editLng" type="text" readonly="readonly"/>
                                        </div>
                                    </div>
                                      <!-----------------------------------------editLat---------------------------------------------->
                                    <div class="form-group">
                                        <label for="editLat" class="control-label">北纬:</label>
                                        <div class="controls">
                                            <input class="form-control" id="editLat" type="text" readonly="readonly"/>
                                        </div>
                                    </div>
                                    <!--------------------------------------editUserName----------------------------------------------->
                                     <div class="form-group">
                                        <label for="editUserName" class="control-label">登录用户:</label>
                                        <div class="controls">
                                            <input class="form-control" id="editUserName" type="text" readonly="readonly"/>
                                        </div>
                                    </div>
                                    <!-----------------------------------------editMbOldColor---------------------------------------------->
                                    <div style="display:none" class="form-group">
                                        <label for="editMbOldColor" class="control-label">旧颜色:</label>
                                        <div class="controls">
                                            <input class="form-control" id="editMbOldColor" type="text"/>
                                        </div>
                                    </div>
                                    <!--------------------------------------editUserName----------------------------------------------->
                                    <!------------------------------------editMbColor-------------------------------------------------->
                                     <div class="form-group">
                                        <label for="editMbColor" class="control-label">小药箱标签:</label>
                                        <div class="controls">
                                            <select id="editMbColor">
                                                <option value="blue">老年人</option>
                                                <option value="red">高血压</option>
                                                <option value="green">糖尿病</option>
                                                <option value="pink">孕产妇</option>
                                                <option value="orange">婴幼儿</option>
                                                <option value="yellow">结核</option>
                                                <option value="purple">严重精神障碍</option>
                                                <option value="white">一般人群</option>
                                            </select>
                                        </div>
                                    </div>
                                    <!----------------------------------editMbName------------------------------------------------------>
                                    <div class="form-group">
                                        <label for="editMbName" class="control-label">小药箱名字:</label>
                                        <div class="controls">
                                            <input class="form-control" id="editMbName" type="text"/>
                                        </div>
                                    </div>
                                    <!------------------------------------------------------------------------------------------------->
                                </form>
                            </div>
                            <div class="modal-footer">
                                <div class="center-block">
                                    <button id="cancelEdit" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    <button id="saveEdit" type="button" class="btn btn-success">保存</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-------------------------------------------delete------------------------------------------->
                <div class="modal fade" id="deleteMbModal" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">确认要删除此小药箱信息吗？</h4>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                <button id="SaveDelete" type="button" class="btn btn-danger" data-dismiss="modal">删除</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-------------------------------------------end------------------------------------------->
                <div class="modal fade" id="detailMbModal" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">小药箱报表</h4>
                            </div>
                            <div id="detailMbModalBody" class="modal-body">
                                <form class="form-horizontal"> 
                                    <%--"老年人": "blue", "高血压": "red", "糖尿病": "green", "孕产妇": "pink", "婴幼儿": "orange", "结核": "yellow", "严重精神障碍": "purple", "一般人群": "white"--%>                                   
                                    <!----------------------------------老年人----------------------------------------------------------->  
                                   <div class="form-group">
                                        <label for="blue" class="control-label">老年人:</label>
                                        <div class="controls">
                                            <input class="form-control" id="blue" type="text" readonly="readonly"/>
                                        </div>
                                    </div>                                    
                                    <!----------------------------------高血压----------------------------------------------------------->
                                      <div class="form-group">
                                        <label for="red" class="control-label">高血压:</label>
                                        <div class="controls">
                                            <input class="form-control" id="red" type="text" readonly="readonly"/>
                                        </div>
                                    </div>
                                   <!----------------------------------糖尿病----------------------------------------------------------->
                                      <div class="form-group">
                                        <label for="green" class="control-label">糖尿病:</label>
                                        <div class="controls">
                                            <input class="form-control" id="green" type="text" readonly="readonly"/>
                                        </div>
                                    </div>
                                     <!----------------------------------孕产妇----------------------------------------------------------->
                                      <div class="form-group">
                                        <label for="pink" class="control-label">孕产妇:</label>
                                        <div class="controls">
                                            <input class="form-control" id="pink" type="text" readonly="readonly"/>
                                        </div>
                                    </div>
                                     <!----------------------------------婴幼儿----------------------------------------------------------->
                                      <div class="form-group">
                                        <label for="orange" class="control-label">婴幼儿:</label>
                                        <div class="controls">
                                            <input class="form-control" id="orange" type="text" readonly="readonly"/>
                                        </div>
                                    </div>
                                     <!----------------------------------结核----------------------------------------------------------->
                                      <div class="form-group">
                                        <label for="yellow" class="control-label">结核:</label>
                                        <div class="controls">
                                            <input class="form-control" id="yellow" type="text" readonly="readonly"/>
                                        </div>
                                    </div>
                                     <!----------------------------------严重精神障碍----------------------------------------------------------->
                                      <div class="form-group">
                                        <label for="purple" class="control-label">严重精神障碍:</label>
                                        <div class="controls">
                                            <input class="form-control" id="purple" type="text" readonly="readonly"/>
                                        </div>
                                    </div>
                                     <!----------------------------------一般人群----------------------------------------------------------->
                                      <div class="form-group">
                                        <label for="white" class="control-label">一般人群:</label>
                                        <div class="controls">
                                            <input class="form-control" id="white" type="text" readonly="readonly"/>
                                        </div>
                                    </div>
                                    <!-------------------------------------总计-------------------------------------------------------->                                  
                                    <div class="form-group">
                                        <label for="allColor" class="control-label">小药箱总计:</label>
                                        <div class="controls">
                                            <input class="form-control" id="allColor" type="text" readonly="readonly"/>
                                        </div>
                                    </div>
                                    
                                    <!--------------------------------------------------------------------------------------------->
                                    <!---------------------------------------------------------------------------------------------> 
                                   
                                    <!--------------------------------------------------------------------------------------------->
                                    <!------------------------------------------------------------------------------------------------------------------>
                                    
                                    <!--------------------------------------------------------------------------------------------------->
                                </form>
                            </div>
                            <div class="modal-footer">
                                <div class="center-block">
                                    <button id="cancelAdd" type="button" class="btn btn-default" data-dismiss="modal">确定</button>
                                    <%--<button id="saveAdd" type="button" class="btn btn-success">确定</button>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>









    <%--------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
<!--end-Footer-part-->
    <div id="loadDataModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <!--<div class="modal-header">
                    <h4 class="modal-title">提示</h4>
                </div>-->
                <div class="modal-body">
                    <!--<h4>模态框中的文本</h4>-->
                    <p>请稍后，数据努力加载中&hellip;</p>
                </div>
                <!--<div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>-->
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

 <div id="myModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">提示信息</h4>
                    </div>
                    <div class="modal-body">
                        <!--<h4>模态框中的文本</h4>-->
                        <p id="jinggaomodel"></p>
                    </div>
                   <%-- <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" id="modelWarnBtn" class="btn btn-primary">确定</button>
                    </div>--%>
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
    <script src="js/mbManage.js" type="text/javascript"></script>
     <script src="js/feetbackdisplayornot.js" type="text/javascript"></script>
    
  

</body>
</html>
