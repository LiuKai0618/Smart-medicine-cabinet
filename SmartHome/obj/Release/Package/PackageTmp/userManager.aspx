<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userManager.aspx.cs" Inherits="SmartHome.userManager" %>

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
    <link rel="stylesheet" type="text/css" href="css/feetback.css" />
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
      

       <%--<li> <a href="map.aspx"><i class="icon icon-signal"></i> <span>车辆历史轨迹</span></a> </li>--%>
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
      <%-- <li> <a href="personManage.aspx"><i class="icon icon-th"></i> <span>人员管理</span></a> </li>
       <li> <a href="depManage.aspx"><i class="icon icon-home"></i> <span>部门管理</span></a> </li>
      <li class="active"> <a href="userManager.aspx"><i class="icon icon-user"></i> <span>系统权限</span></a> </li>--%>
         <li class="submenu open"><a href="#"><i class="icon icon-th"></i> <span>基础数据维护</span></a>
           <ul>
                <li> <a href="personManage.aspx"> 人员管理</a> </li>
                 <li> <a href="depManage.aspx">部门管理</a> </li>
                  <li class="active"> <a href="userManager.aspx">系统权限</a> </li>
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
      <%--  <li> <a href="index.aspx"><i class="icon icon-inbox"></i> <span>车辆最新信息</span></a> </li>
       <li><a href="stations.aspx"><i class="icon icon-tint"></i> <span>车辆历史信息</span></a></li>--%>
  </ul>
</div>
<!--sidebar-menu-->


<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="userManager.aspx" title="系统权限" class="tip-bottom"><i class="icon-user"></i>系统权限</a></div>
  </div>
<!--End-breadcrumbs-->
    <div class="container-fluid">
        <!--<hr>-->        
        <div id="mmscontent" class="row-fluid">
            <div class="span12">
                <div class="widget-box">
                    <div class="widget-title">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#tab1">增加用户</a></li>
                            <li><a data-toggle="tab" href="#tab2">删除用户</a></li>
                            <li><a data-toggle="tab" href="#tab3">编辑用户</a></li>
                        </ul>
                    </div>
                    <div class="widget-content tab-content">
                        <div id="tab1" class="tab-pane active">
                            <form class="form-horizontal">
                                <div class="control-group">
                                    <label class="control-label" for="addUsername">用户名：</label>
                                    <div class="controls">
                                        <input id="addUsername" type="text" placeholder="请输入用户名！" data-title="请输入用户名！" class="span11 tip" data-original-title=""/>
                                    </div>
                                </div>
                               <div class="control-group">
                                    <label class="control-label" for="addPassword1">密码：</label>
                                    <div class="controls">
                                        <input id="addPassword1" type="password" placeholder="请输入用户密码！" data-title="请输入用户密码！" class="span11 tip" data-original-title=""/>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="addPassword2">再次输入密码：</label>
                                    <div class="controls">
                                        <input id="addPassword2" type="password" placeholder="请再次输入用户密码！" data-title="请再次输入用户密码！" class="span11 tip" data-original-title=""/>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="addUserlevel">用户权限：</label>
                                    <div class="controls">
                                        <select id="addUserlevel" class="select2">
                                            <option value="2" selected="selected">一般用户</option>
                                            <option value="1">管理员</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <button id="addBtn" type="button" class="btn btn-primary">增加</button>
                                </div>
                            </form>
                        </div>
                        <div id="tab2" class="tab-pane">
                             <form class="form-horizontal">                               
                                <div class="control-group">
                                    <label class="control-label" for="delUsername">请选择要删除的用户：</label>
                                    <div class="controls">
                                        <select id="delUsername" class="select2">
                                            <option value="2" selected="selected">user1</option>
                                            <option value="1">admin1</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <button id="delBtn" type="button" class="btn btn-danger">删除</button>
                                </div>
                            </form>
                        </div>
                        <div id="tab3" class="tab-pane">
                            <form class="form-horizontal">                               
                                <div class="control-group">
                                    <label class="control-label" for="editUsername">请选择要编辑的用户：</label>
                                    <div class="controls">
                                        <select id="editUsername" class="select2">
                                            <option value="2" selected="selected">user1</option>
                                            <option value="1">admin1</option>
                                        </select>
                                    </div>                                    
                                </div> 
                                <%--<div class="control-group" id="rtuids">
                                    <label class="control-label" for="">请勾选要访问的站点：</label>
                                    <div class="controls">
                                        <label class="span3"><input type="checkbox" id="" value="1"/> 12345678901</label>
                                        <label class="span3"><input type="checkbox" id="" value="1"/> 12345678901</label>
                                        <label class="span3"><input type="checkbox" id="" value="1"/> 12345678901</label>
                                        <label class="span3"><input type="checkbox" id="" value="1"/> 12345678901</label>
                                    </div>
                                    <div class="controls">
                                        <label class="span3"><input type="checkbox" id="" value="1"/> 12345678901</label>
                                        <label class="span3"><input type="checkbox" id="" value="1"/> 12345678901</label>
                                        <label class="span3"><input type="checkbox" id="" value="1"/> 12345678901</label>
                                        <label class="span3"><input type="checkbox" id="" value="1"/> 12345678901</label>
                                    </div> 
                                    <div class="controls">
                                        <label class="span3"><input type="checkbox" id="" value="1"/> 12345678901</label>
                                        <label class="span3"><input type="checkbox" id="" value="1"/> 12345678901</label>
                                    </div>                                     
                                </div>  --%>      
                                 <div class="control-group">
                                    <label class="control-label" for="editPassword">请输入新密码：</label>
                                    <div class="controls">
                                        <input id="editPassword" type="password" placeholder="请输入新密码！" data-title="请输入新密码！" class="span11 tip" data-original-title=""/>
                                    </div>
                                </div>                                                    
                                <div class="control-group">
                                    <label class="control-label" for="editUserlevel">请选择用户权限：</label>
                                    <div class="controls">
                                        <select id="editUserlevel" class="select2">
                                            <option value="2" >一般用户</option>
                                            <option value="1">管理员</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-actions">
                                    <button id="editBtn" type="button" class="btn btn-success">修改</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

  
</div>
<!--end-main-container-part-->


<!--Footer-part-->
<div class="row-fluid">
  <div id="footer" class="span12"> 2018 &copy;QILU University. Brought to you by <a href="http://www.qlu.edu.cn/">齐鲁工业大学电子学院</a> </div>
</div>
<!--end-Footer-part-->
    <!--------------------------------------------------------------------------------------------------------------->
    <div class="modal fade" id="deleteUserModal" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">确认要删除此用户信息吗？</h4>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                <button id="SaveDelete" type="button" class="btn btn-danger" data-dismiss="modal">删除</button>
                            </div>
                        </div>
                    </div>
                </div>
    <!--------------------------------------------------------------------------------------------------------------->
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
                    <!--<div class="modal-footer">-->
                        <!--<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>-->
                        <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                    <!--</div>-->
                </div>
            </div>
        </div>
        <!--------------------------------------------------------------------------------------------------------------->

    <div id="myModal1" class="modal fade">
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
     <script src="js/userManager.js" type="text/javascript"></script>
     <%--<script src="js/warning.js" type="text/javascript"></script>--%>
    
</body>
</html>
