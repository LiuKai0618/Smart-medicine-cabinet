 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="h5index.aspx.cs" Inherits="SmartHome.h5index" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head runat="server">
   <%-- <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>--%>
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />



     <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">


    <%--<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>--%>
    <link href="css/bootstrap-3.3.7.min.css?saasd=2" rel="stylesheet" />
    <style>
        body,
        html,
        #container {
            overflow: hidden;
            width: 100%;
            height: 100%;
            margin: 0;
            font-family: "微软雅黑";
        }
    </style>
    <!--<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.0&ak=8MZLMmFUIhAg2sI7ITa5RlsR6KEZdzAG"></script>-->
    <script src="https://api.map.baidu.com/api?&v=3.0&ak=8MZLMmFUIhAg2sI7ITa5RlsR6KEZdzAG"></script>
    <title></title>
</head>
<body>
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#" id="welcome" runat="server">欢迎您:</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">         
          <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="h5index.aspx">小药箱管理</a></li>
            <li><a href="h5carmanage.aspx">用车申请</a></li>
            <li><a href="h5carcheck.aspx">用车审批</a></li>
              <li><a href="h5carorderlist.aspx">历史订单</a></li>
          </ul>
        </div>
      </div>
    </nav>



    <%--<div style="background-color:red;margin-top:100px">
    <form action="#" method="get" class="form-horizontal">
            <div class="control-group">
                <label class="control-label">请选择查询的车牌号码：</label>
                <div class="controls">
                    <select id="rtuidselect" class="select2">
                    </select>
                </div>
            </div>
        </form>
        </div>--%>
   
    <div style="margin-top:51px" class="form-group">


                                              <div class="input-group">
                                                      <span class="input-group-addon" id="">车辆实时定位:</span>
                                                      <select class="form-control" id="rtuidselect">                                              
                                                    </select>
                                            </div>   

                                              <div class="input-group">
                                                        <%--  <span class="input-group-addon" id="">小药箱标签:</span>--%>
                                                          
                                                          <span class="input-group-addon">
                                                             <%-- 标签选择:--%>
                                                              <input type="checkbox" id="blue" checked="checked">老年人
                                                               <input type="checkbox" id="red" checked="checked">高血压
                                                              <input type="checkbox" id="green" checked="checked">糖尿病
                                                              <input type="checkbox" id="pink" checked="checked">孕产妇
                                                             <%-- <input type="checkbox" id="orange" checked="checked">婴幼儿
                                                              <input type="checkbox" id="yellow" checked="checked">结核
                                                              <input type="checkbox" id="purple" checked="checked">严重精神障碍
                                                              <input type="checkbox" id="white" checked="checked">一般人群--%>
                                                          </span>                                                  
                                                 
                                                 <%-- <span class="input-group-addon col-xs-2">
                                                            <input type="checkbox" id="red">高血压
                                                          </span>
                                                  <span class="input-group-addon">
                                                            <input type="checkbox" id="green">糖尿病
                                                          </span>
                                                  <span class="input-group-addon">
                                                            <input type="checkbox" id="pink">孕产妇
                                                          </span>
                                                  <span class="input-group-addon">
                                                            <input type="checkbox" id="orange">婴幼儿
                                                          </span>--%>

                                                         <%--<span class="input-group-addon" id="blue">老年人</span>--%>
                                                        
                                                          <%--<select class="form-control" id="boxselect1">
                                                            <option value="allcolors"  selected="selected">显示所有小药箱</option>
                                                             <option value="blue">老年人</option>
                                                            <option value="red">高血压</option>
                                                            <option value="green">糖尿病</option>
                                                            <option value="pink">孕产妇</option>
                                                            <option value="orange">婴幼儿</option>
                                                        </select>--%>
                                                                                            </div>   
                                                         <div class="input-group">
                                                             <span class="input-group-addon">
                                                              <input type="checkbox" id="orange" checked="checked">婴幼儿
                                                              <input type="checkbox" id="yellow" checked="checked">结核
                                                              <input type="checkbox" id="purple" checked="checked">严重精神障碍
                                                              <input type="checkbox" id="white" checked="checked">一般人群
                                                             </span>  
                                                         </div>
        
                                               



        
                                             <div class="input-group">
                                              <span class="input-group-addon" id="">当前车辆历史轨迹:</span>
                                              <select class="form-control" id="trackSelect">
                                                <%--<option value="nodata" selected="selected">--下拉选择历史轨迹--</option>--%>
                                                <%--<option value="track2">track2</option>--%>
                                            </select>
                                            </div>

                                          <div class="btn-group btn-group-justified">
                                          <div class="btn-group" role="group">
                                            <button id="startTrack" type="button" class="btn btn-primary">新轨迹记录开始</button>
                                          </div>
                                          <div class="btn-group" role="group">
                                            <button id="endTrack" type="button" class="btn btn-success" disabled="disabled">新轨迹记录结束</button>
                                          </div>  
                                              <div class="btn-group" role="group">
                                            <button id="supplyMB" type="button" class="btn btn-warning">补录小药箱</button>
                                          </div>                                       
                                        </div>
        
                                             
         </div>





                                            


 <%--   <div class="form-group">
        
                                              <div class="input-group">
                                              <span class="input-group-addon" id="">小药箱标签选择:</span>
                                              <select class="form-control" id="boxselect">
                                                <option value="allcolors"  selected="selected">显示所有小药箱</option>
                                                 <option value="blue">老年人</option>
                                                <option value="red">高血压</option>
                                                <option value="green">糖尿病</option>
                                                <option value="pink">孕产妇</option>
                                                <option value="orange">婴幼儿</option>
                                            </select>
                                            </div>       
                                     
                                      
                                    </div>--%>
                                     <%-- <div class="form-group">

                                          <div class="input-group">
                                              <span class="input-group-addon" id="">当前车辆轨迹查询:</span>
                                              <select class="form-control" id="trackSelect1">
                                                <option value="track1" selected="selected">track1</option>
                                                <option value="track2">track2</option>
                                            </select>
                                            </div>

                                          <div class="btn-group btn-group-justified">
                                          <div class="btn-group" role="group">
                                            <button id="startTrack" type="button" class="btn btn-primary">轨迹记录开始</button>
                                          </div>
                                          <div class="btn-group" role="group">
                                            <button id="endTrack" type="button" class="btn btn-success">轨迹记录结束</button>
                                          </div>                                         
                                        </div>
                                      

                                    </div>--%>
    <%--                                       <div class="form-inline">

                                        <label for="trackSelect" class="col-sm-3 control-label">历史轨迹查询:</label>
                                        <div class="col-sm-5">
                                             <select class="form-control" id="trackSelect">
                                                <option value="track1" selected="selected">track1</option>
                                                <option value="track2">track2</option>
                                            </select>
                                        </div>



                                        <div class="col-sm-4">
                                            <button id="startTrack" type="button" class="btn btn-primary">开始记录</button>
                                            <button id="endTrack" type="button" class="btn btn-success">结束记录</button>
                                        </div>

                                    </div>--%>

     <div id="container"></div>

     <div id="addBoxModal" class="modal">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">增加小药箱</h4>
                    </div>
                    <div class="modal-body">
                       <form class="form-horizontal">
                                   <div class="form-group">
                                        <label for="addBoxName" class="col-sm-2 control-label">请输入小药箱的名字:</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="addBoxName" type="text"/>
                                        </div>
                                    </div>
                           <%--//---------------------------------------------------------------------------------------------------------------------------%>
                                      <%--<div class="form-group">
                                        <label for="addBoxLabel" class="col-sm-2 control-label">请选择小药箱的标签:</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" id="addBoxLabel" multiple="multiple">
                                                <option value="blue" selected="selected">老年人</option>
                                                <option value="red">高血压</option>
                                                <option value="green">糖尿病</option>
                                                <option value="pink">孕产妇</option>
                                                <option value="orange">婴幼儿</option>
                                            </select>
                                        </div>
                                    </div>--%>
                           <%--//-----------------------------------------------------------------------------------------------------------------------------%>
                            <div class="form-group">
                                        <label for="addBoxLabel" class="col-sm-2 control-label">请选择小药箱的标签:</label>
                                        <div class="col-sm-12">
                                             <input type="checkbox" id="addblue" value="blue">老年人
                                              <input type="checkbox" id="addred" value="red">高血压
                                            <input type="checkbox" id="addgreen" value="green">糖尿病
                                              <input type="checkbox" id="addpink" value="pink">孕产妇
                                             <%--<input type="checkbox" id="addorange" value="orange">婴幼儿
                                             <input type="checkbox" id="addyellow" value="yellow">结核
                                             <input type="checkbox" id="addpurple" value="purple">严重精神障碍
                                            <input type="checkbox" id="addwhite" value="white">一般人群--%>
                                           <%-- <label class="checkbox-inline">
                                              <input type="checkbox" id="addblue" value="blue"> 老年人
                                            </label>
                                            <label class="checkbox-inline">
                                              <input type="checkbox" id="addred" value="red"> 高血压
                                            </label>
                                            <label class="checkbox-inline">
                                              <input type="checkbox" id="addgreen" value="green"> 糖尿病
                                            </label>
                                            <label class="checkbox-inline">
                                              <input type="checkbox" id="addpink" value="pink"> 孕产妇
                                            </label>
                                            <label class="checkbox-inline">
                                              <input type="checkbox" id="addorange" value="orange"> 婴幼儿
                                            </label>--%>
                                        </div>
                                 <div class="col-sm-12">
                                             <input type="checkbox" id="addorange" value="orange">婴幼儿
                                             <input type="checkbox" id="addyellow" value="yellow">结核
                                             <input type="checkbox" id="addpurple" value="purple">严重精神障碍
                                            <input type="checkbox" id="addwhite" value="white">一般人群
                                             <%-- <input type="checkbox" id="addpink" value="pink">孕产妇
                                           &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="addorange" value="orange">婴幼儿
                                           &nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" id="addwhite" value="white">一般人群--%>
                                          
                                        </div>
                                    </div>



                           <%--//--------------------------------------------------------------------------------------------------------------------------------%>
                        </form>



                        <!--<h4>模态框中的文本</h4>-->
                        <%--<p id="jinggaomodel"></p>--%>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="cancelBtn" class="btn btn-info" data-dismiss="modal">取消</button>
                        <button type="button" id="addBtn" class="btn btn-primary">确定</button>
                    </div>
                </div>
            </div>
        </div>
    <div id="editBoxModal" class="modal">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">编辑删除小药箱</h4>
                    </div>
                    <div class="modal-body">
                       <form class="form-horizontal">
                                   <div class="form-group">
                                        <label for="editBoxName" class="col-sm-2 control-label">请输入小药箱的新名字:</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="editBoxName" type="text"/>
                                        </div>
                                    </div>
                           <%--//---------------------------------------------------------------------------------------------------------------------------%>
                                      <%--<div class="form-group">
                                        <label for="addBoxLabel" class="col-sm-2 control-label">请选择小药箱的标签:</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" id="addBoxLabel" multiple="multiple">
                                                <option value="blue" selected="selected">老年人</option>
                                                <option value="red">高血压</option>
                                                <option value="green">糖尿病</option>
                                                <option value="pink">孕产妇</option>
                                                <option value="orange">婴幼儿</option>
                                            </select>
                                        </div>
                                    </div>--%>
                           <%--//-----------------------------------------------------------------------------------------------------------------------------%>
                            <div class="form-group">
                                          <input class="form-control" id="hiddenlnglat" type="hidden" value=""/>
                                        <label for="" class="col-sm-2 control-label">请选择小药箱的新标签:</label>
                                        <div class="col-sm-12">
                                             <input type="checkbox" id="editblue" value="blue">老年人
                                              <input type="checkbox" id="editred" value="red">高血压
                                            <input type="checkbox" id="editgreen" value="green">糖尿病
                                              <input type="checkbox" id="editpink" value="pink">孕产妇
                                             <%--<input type="checkbox" id="addorange" value="orange">婴幼儿
                                             <input type="checkbox" id="addyellow" value="yellow">结核
                                             <input type="checkbox" id="addpurple" value="purple">严重精神障碍
                                            <input type="checkbox" id="addwhite" value="white">一般人群--%>
                                           <%-- <label class="checkbox-inline">
                                              <input type="checkbox" id="addblue" value="blue"> 老年人
                                            </label>
                                            <label class="checkbox-inline">
                                              <input type="checkbox" id="addred" value="red"> 高血压
                                            </label>
                                            <label class="checkbox-inline">
                                              <input type="checkbox" id="addgreen" value="green"> 糖尿病
                                            </label>
                                            <label class="checkbox-inline">
                                              <input type="checkbox" id="addpink" value="pink"> 孕产妇
                                            </label>
                                            <label class="checkbox-inline">
                                              <input type="checkbox" id="addorange" value="orange"> 婴幼儿
                                            </label>--%>
                                        </div>
                                 <div class="col-sm-12">
                                             <input type="checkbox" id="editorange" value="orange">婴幼儿
                                             <input type="checkbox" id="edityellow" value="yellow">结核
                                             <input type="checkbox" id="editpurple" value="purple">严重精神障碍
                                            <input type="checkbox" id="editwhite" value="white">一般人群
                                             <%-- <input type="checkbox" id="addpink" value="pink">孕产妇
                                           &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="addorange" value="orange">婴幼儿
                                           &nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" id="addwhite" value="white">一般人群--%>
                                          
                                        </div>
                                    </div>



                           <%--//--------------------------------------------------------------------------------------------------------------------------------%>
                        </form>



                        <!--<h4>模态框中的文本</h4>-->
                        <%--<p id="jinggaomodel"></p>--%>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="cancelEditBtn" class="btn btn-info" data-dismiss="modal">取消</button>
                        <button type="button" id="editBtn" class="btn btn-primary">修改</button>
                        <button type="button" id="delBtn" class="btn btn-danger">删除</button>
                    </div>
                </div>
            </div>
        </div>

         <div id="popModal" class="modal">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">新轨迹开始</h4>
                    </div>
                    <div class="modal-body">
                       <form class="form-horizontal">
                                   <div class="form-group">
                                        <label for="supplyBoxNameone" class="col-sm-2 control-label">请输入您的起点:</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="supplyBoxNameone" type="text"/>
                                        </div>
                                    </div>
                          
                        </form>
                     <!--<h4>模态框中的文本</h4>-->
                        <%--<p id="jinggaomodel"></p>--%>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="cancelpopBtn" class="btn btn-info" data-dismiss="modal">取消</button>
                        <button type="button" id="popBtn" class="btn btn-primary">确定</button>
                    </div>
                </div>
            </div>
        </div>
             <div id="popModaltwo" class="modal">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">轨迹结束</h4>
                    </div>
                    <div class="modal-body">
                       <form class="form-horizontal">
                                   <div class="form-group">
                                        <label for="supplyBoxNametwo" class="col-sm-2 control-label">请输入您的目的地:</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="supplyBoxNametwo" type="text"/>
                                        </div>
                                    </div>
                          
                        </form>
                     <!--<h4>模态框中的文本</h4>-->
                        <%--<p id="jinggaomodel"></p>--%>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="cancelpopBtntwo" class="btn btn-info" data-dismiss="modal">取消</button>
                        <button type="button" id="popBtntwo" class="btn btn-primary">确定</button>
                    </div>
                </div>
            </div>
        </div>
     <div id="supplyBoxModal" class="modal">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">补录小药箱</h4>
                    </div>
                    <div class="modal-body">
                       <form class="form-horizontal">
                                   <div class="form-group">
                                        <label for="supplyBoxName" class="col-sm-2 control-label">请输入小药箱的名字:</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="supplyBoxName" type="text"/>
                                        </div>
                                    </div>
                           <div class="form-group">
                                        <label for="supplyBoxlng" class="col-sm-2 control-label">请输入经纬度（东经）:</label>
                                        <div class="col-sm-10">
                                            <div class="input-group">
                                                  
                                                  <input type="number" class="form-control" id="supplyBoxlngdu" min="0" max="180"/>
                                                  <span class="input-group-addon">°</span>
                                                <input type="number" class="form-control" id="supplyBoxlngfen" min="0" max="60"/>
                                                  <span class="input-group-addon">′</span>
                                                <input type="number" class="form-control" id="supplyBoxlngmiao" step="0.01" min="0" max="60"/>
                                                  <span class="input-group-addon">″</span>
                                                </div>
                                            <%--<input class="form-control" id="supplyBoxlng" type="text"/>--%>
                                        </div>
                                    </div>
                           <div class="form-group">
                                        <label for="supplyBoxlat" class="col-sm-2 control-label">请输入经纬度（北纬）:</label>
                                        <div class="col-sm-10">
                                            <div class="input-group">
                                                  
                                                  <input type="number" class="form-control" id="supplyBoxlatdu" min="0" max="90"/>
                                                  <span class="input-group-addon">°</span>
                                                <input type="number" class="form-control" id="supplyBoxlatfen" min="0" max="60"/>
                                                  <span class="input-group-addon">′</span>
                                                <input type="number" class="form-control" id="supplyBoxlatmiao" step="0.01" min="0" max="60"/>
                                                  <span class="input-group-addon">″</span>
                                                </div>


                                            <%--<input class="form-control" id="supplyBoxlat" type="text"/>--%>
                                        </div>
                                    </div>
                           <%--//---------------------------------------------------------------------------------------------------------------------------%>
                                      <%--<div class="form-group">
                                        <label for="addBoxLabel" class="col-sm-2 control-label">请选择小药箱的标签:</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" id="addBoxLabel" multiple="multiple">
                                                <option value="blue" selected="selected">老年人</option>
                                                <option value="red">高血压</option>
                                                <option value="green">糖尿病</option>
                                                <option value="pink">孕产妇</option>
                                                <option value="orange">婴幼儿</option>
                                            </select>
                                        </div>
                                    </div>--%>
                           <%--//-----------------------------------------------------------------------------------------------------------------------------%>
                            <div class="form-group">
                                        <label for="" class="col-sm-2 control-label">请选择小药箱的标签:</label>
                                        <div class="col-sm-12">
                                             <input type="checkbox" id="supplyblue" value="blue">老年人
                                              <input type="checkbox" id="supplyred" value="red">高血压
                                            <input type="checkbox" id="supplygreen" value="green">糖尿病
                                              <input type="checkbox" id="supplypink" value="pink">孕产妇
                                             <%--<input type="checkbox" id="addorange" value="orange">婴幼儿
                                             <input type="checkbox" id="addyellow" value="yellow">结核
                                             <input type="checkbox" id="addpurple" value="purple">严重精神障碍
                                            <input type="checkbox" id="addwhite" value="white">一般人群--%>
                                           <%-- <label class="checkbox-inline">
                                              <input type="checkbox" id="addblue" value="blue"> 老年人
                                            </label>
                                            <label class="checkbox-inline">
                                              <input type="checkbox" id="addred" value="red"> 高血压
                                            </label>
                                            <label class="checkbox-inline">
                                              <input type="checkbox" id="addgreen" value="green"> 糖尿病
                                            </label>
                                            <label class="checkbox-inline">
                                              <input type="checkbox" id="addpink" value="pink"> 孕产妇
                                            </label>
                                            <label class="checkbox-inline">
                                              <input type="checkbox" id="addorange" value="orange"> 婴幼儿
                                            </label>--%>
                                        </div>
                                 <div class="col-sm-12">
                                             <input type="checkbox" id="supplyorange" value="orange">婴幼儿
                                             <input type="checkbox" id="supplyyellow" value="yellow">结核
                                             <input type="checkbox" id="supplypurple" value="purple">严重精神障碍
                                            <input type="checkbox" id="supplywhite" value="white">一般人群
                                             <%-- <input type="checkbox" id="addpink" value="pink">孕产妇
                                           &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="addorange" value="orange">婴幼儿
                                           &nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" id="addwhite" value="white">一般人群--%>
                                          
                                        </div>
                                    </div>



                           <%--//--------------------------------------------------------------------------------------------------------------------------------%>
                        </form>



                        <!--<h4>模态框中的文本</h4>-->
                        <%--<p id="jinggaomodel"></p>--%>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="cancelsupplyBtn" class="btn btn-info" data-dismiss="modal">取消</button>
                        <button type="button" id="supplyBtn" class="btn btn-primary">补录</button>
                    </div>
                </div>
            </div>
        </div>

    <%--<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>--%>
    <script src="js/jquery-1.12.4.min.js"></script>
    <%--<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
    <script src="js/bootstrap-3.3.7.min.js"></script>
    <script>
        //--------------------------小药箱 checkbox---------------------------------------------------------
        var blueboxlist = [];
        var redboxlist = [];
        var greenboxlist = [];
        var pinkboxlist = [];
        var orangeboxlist = [];
        var whiteboxlist = [];
        var yellowboxlist = [];
        var purpleboxlist = [];
        //-----------------------------------------------------------------------------------
        var fullName1 = $("#welcome").text().split(":")[1];
        var userName = fullName1.split("]")[0];
        //-----------------------------------------------------------------------------------
        var map = new BMap.Map('container');
        //map.centerAndZoom(new BMap.Point(118.98813, 48.33396), 15);
        //118.98813, 48.33396
        //117.02496707, 36.68278473

        map.centerAndZoom(new BMap.Point(118.98813, 48.33396), 13);
        map.enableScrollWheelZoom(true);

        //-----------------------------------------------------------------------------------
        //var medicineboxlabeldic = { "blue": 1, "red": 1, "green": 1, "pink": 1, "orange": 1 };
        //----------------------------------purpleboxlist-------------------------------------------------
        $("#purple").click(function () {
            if ($(this).prop("checked")) {
                //alert("选中blue");
                //getallmbbyusername(userName, "purple");
                setTimeout(loadallmbsbyusernamepurple, 100);
            } else {
                //alert("没有选中blue");
                //console.log(blueboxlist);
                if (purpleboxlist.length > 0) {
                    for (var i = 0; i < purpleboxlist.length; i++) {
                        map.removeOverlay(purpleboxlist[i]);
                    }
                }
                purpleboxlist = [];

            }
        });
        //-----------------------------------------------------------------------------------
        //----------------------------------yellowboxlist-------------------------------------------------
        $("#yellow").click(function () {
            if ($(this).prop("checked")) {
                //alert("选中blue");
                //getallmbbyusername(userName, "yellow");
                setTimeout(loadallmbsbyusernameyellow, 100);
            } else {
                //alert("没有选中blue");
                //console.log(blueboxlist);
                if (yellowboxlist.length > 0) {
                    for (var i = 0; i < yellowboxlist.length; i++) {
                        map.removeOverlay(yellowboxlist[i]);
                    }
                }
                yellowboxlist = [];

            }
        });
        //-----------------------------------------------------------------------------------
        //----------------------------------whiteboxlist-------------------------------------------------
        $("#white").click(function () {
            if ($(this).prop("checked")) {
                //alert("选中blue");
                setTimeout(loadallmbsbyusernamewhite, 100);
                //getallmbbyusername(userName, "white");
            } else {
                //alert("没有选中blue");
                //console.log(blueboxlist);
                if (whiteboxlist.length > 0) {
                    for (var i = 0; i < whiteboxlist.length; i++) {
                        map.removeOverlay(whiteboxlist[i]);
                    }
                }
                whiteboxlist = [];

            }
        });
        //-----------------------------------------------------------------------------------
        //----------------------------------blueboxlist-------------------------------------------------
        $("#blue").click(function () {
                     if ($(this).prop("checked")) {
                         //alert("选中blue");
                         //getallmbbyusername(userName, "blue");
                         setTimeout(loadallmbsbyusernameblue, 100);
                     } else {
                         //alert("没有选中blue");
                         //console.log(blueboxlist);
                         if (blueboxlist.length > 0) {
                             for (var i = 0; i < blueboxlist.length; i++) {
                                 map.removeOverlay(blueboxlist[i]);
                             }
                         }
                         blueboxlist = [];
                             
                       }
        });
        //-----------------------------------------------------------------------------------
        //--------------------------------redboxlist---------------------------------------------------
        $("#red").click(function () {
            if ($(this).prop("checked")) {
                //alert("选中red");
                //getallmbbyusername(userName, "red");
                setTimeout(loadallmbsbyusernamered, 100);
            } else {
                //console.log(redboxlist);
                if (redboxlist.length > 0) {
                    for (var i = 0; i < redboxlist.length; i++) {
                        map.removeOverlay(redboxlist[i]);
                    }
                }
                redboxlist = [];
                //alert("没有选中red");
            }
        });


        //-----------------------------------------------------------------------------------
        //-----------------------------------greenboxlist------------------------------------------------
        $("#green").click(function () {
            if ($(this).prop("checked")) {
                //alert("选中blue");
                //getallmbbyusername(userName, "green");
                setTimeout(loadallmbsbyusernamegreen, 100);
            } else {
                if (greenboxlist.length > 0) {
                    for (var i = 0; i < greenboxlist.length; i++) {
                        map.removeOverlay(greenboxlist[i]);
                    }
                }
                greenboxlist = [];
                //alert("没有选中blue");
            }
        });


        //-----------------------------------------------------------------------------------
        //------------------------------------pinkboxlist-----------------------------------------------
        $("#pink").click(function () {
            if ($(this).prop("checked")) {
                //alert("选中blue");
                //getallmbbyusername(userName, "pink");
                setTimeout(loadallmbsbyusernamepink, 100);
            } else {
                if (pinkboxlist.length > 0) {
                    for (var i = 0; i < pinkboxlist.length; i++) {
                        map.removeOverlay(pinkboxlist[i]);
                    }
                }
                pinkboxlist = [];
                //alert("没有选中blue");
            }
        });


        //-----------------------------------------------------------------------------------
        //----------------------------------orangeboxlist-------------------------------------------------
        $("#orange").click(function () {
            if ($(this).prop("checked")) {
                //alert("选中blue");
                //getallmbbyusername(userName, "orange");
                setTimeout(loadallmbsbyusernameorange, 100);
            } else {
                if (orangeboxlist.length > 0) {
                    for (var i = 0; i < orangeboxlist.length; i++) {
                        map.removeOverlay(orangeboxlist[i]);
                    }
                }
                orangeboxlist = [];
                //alert("没有选中blue");
            }
        });


        //-----------------------------------------------------------------------------------
        //var firstlng=map.getCenter().lng;
        //var firstlat=map.getCenter().lat;
        //var banjingmi = map.getDistance(map.getCenter(), map.getBounds().getNorthEast());

        //console.log(map.getCenter());
        //console.log(map.getBounds().getNorthEast());
        //console.log(banjingmi);


        //setTimeout(loadallmbsbyusernameblue, 2000);
        //setTimeout(loadallmbsbyusernamered, 4000);
        //setTimeout(loadallmbsbyusernamegreen, 6000);
        //setTimeout(loadallmbsbyusernamepink, 8000);
        //setTimeout(loadallmbsbyusernameorange, 10000);
        //setTimeout(loadallmbsbyusernamewhite, 12000); 
        //setTimeout(loadallmbsbyusernameyellow, 14000);
        //setTimeout(loadallmbsbyusernamepurple, 16000);


        //getallmbbyusernamenew(userName, "blue", firstlng, firstlat, banjingmi, "1");
        //getallmbbyusernamenew(userName, "red", firstlng, firstlat, banjingmi, "1");
        //getallmbbyusernamenew(userName, "green", firstlng, firstlat, banjingmi, "1");
        //getallmbbyusernamenew(userName, "pink", firstlng, firstlat, banjingmi, "1");
        //getallmbbyusernamenew(userName, "orange", firstlng, firstlat, banjingmi, "1");
        //getallmbbyusernamenew(userName, "white", firstlng, firstlat, banjingmi, "1");
        //getallmbbyusernamenew(userName, "yellow", firstlng, firstlat, banjingmi, "1");
        //getallmbbyusernamenew(userName, "purple", firstlng, firstlat, banjingmi, "1");

        function loadallmbsbyusernamebyallcolornumber2() {
            getallmbbyusernamenew(userName, "blue", firstlng, firstlat, banjingmi, "2");
            getallmbbyusernamenew(userName, "red", firstlng, firstlat, banjingmi, "2");
            getallmbbyusernamenew(userName, "green", firstlng, firstlat, banjingmi, "2");
            getallmbbyusernamenew(userName, "pink", firstlng, firstlat, banjingmi, "2");
            getallmbbyusernamenew(userName, "orange", firstlng, firstlat, banjingmi, "2");
            getallmbbyusernamenew(userName, "white", firstlng, firstlat, banjingmi, "2");
            getallmbbyusernamenew(userName, "yellow", firstlng, firstlat, banjingmi, "2");
            getallmbbyusernamenew(userName, "purple", firstlng, firstlat, banjingmi, "2");
        }
        setTimeout(loadallmbsbyusernamebyallcolornumber2, 4000);




        function loadallmbsbyusernameblue() {
            getallmbbyusername(userName, "blue");
        }
        function loadallmbsbyusernamered() {
            getallmbbyusername(userName, "red");
        }
        function loadallmbsbyusernamegreen() {
            getallmbbyusername(userName, "green");
        }
        function loadallmbsbyusernamepink() {
            getallmbbyusername(userName, "pink");
        }
        function loadallmbsbyusernameorange() {
            getallmbbyusername(userName, "orange");
        }
        function loadallmbsbyusernamewhite() {
            getallmbbyusername(userName, "white");
        }
        function loadallmbsbyusernameyellow() {
            getallmbbyusername(userName, "yellow");
        }
        function loadallmbsbyusernamepurple() {
            getallmbbyusername(userName, "purple");
        }
        //getallmbbyusername(userName, "blue");
        //getallmbbyusername(userName, "red");
        //getallmbbyusername(userName, "green");
        //getallmbbyusername(userName, "pink");
        //getallmbbyusername(userName, "orange");
        //getallmbbyusername(userName, "white");
        //getallmbbyusername(userName, "yellow");
        //getallmbbyusername(userName, "purple");
        
        //-------------------------------通过经纬度，boxname和用户名ajax拿到颜色列表----------------------------------------------------
        //ID, lnglat, userName, color, boxName
        function colorListbyLatlngUsernameBoxname(lnglatvalue, usernamevalue, boxnamevalue) {
            var colorlist;
            $.ajax({
                type: "post",                          //提交方式
                async: false,
                url: "h5marker.ashx",        //一般处理程序的路径
                data: { action: "colorList", lnglat: lnglatvalue, boxName: boxnamevalue, userName: usernamevalue },           //向后台传入的值
                //data: { action: "latlngbyplatenumber", carnumber: plateNumber }, 
                dataType: "text",                       //返回值格式
                //dataType: "json",                       //返回值格式
                success: function (data) {
                    if (data["err_message"]) {
                        //清除所有小药箱，个数为0
                        //mbCount = 0;
                        ////-----------------------------------------------------------
                        ////清除地图上的小药箱
                        //if (lnglatList.length > 0) {
                        //    for (var i = 0; i < lnglatList.length; i++) {
                        //        map.removeOverlay(lnglatList[i]);
                        //    }
                        //}
                        //lnglatList = [];
                        //--------------------------------------------------------
                        return;
                    }
                    var colorlistdic = eval("(" + data + ")");
                    colorlist = colorlistdic["colorlist"];
                    //console.log(colorlist);
                    //console.log(colorlist["colorlist"]);
                    
                    //-----------------------------------------------------------------------------------

                },
                complete: function (XMLHttpRequest, textStatus) {
                    //console.log(boxcolor);
                    //console.log(boxlist);
                },
            });
            return colorlist;
        }
        //-----------------------------------------------------------------------------------
        //--------------------all medicinebox by username-----------------------------------------------------
        //var boxMarkerList = [];
        //---------------增加参数，只是在初次加载时使用，经纬度坐标，半径（米），第一次还是第二次索要数据--------------
        function getallmbbyusernamenew(username, boxcolor, firstlng, firstlat, banjingmi,number12) {
            $.ajax({
                type: "post",                          //提交方式
                async: false,
                url: "h5marker.ashx",        //一般处理程序的路径
                data: { action: "allmbsbyusernamenew", userName: username, color: boxcolor, FirstLng: firstlng, FirstLat: firstlat, BanjingMi: banjingmi, Number12: number12 },           //向后台传入的值
                //data: { action: "latlngbyplatenumber", carnumber: plateNumber }, 
                dataType: "text",                       //返回值格式
                //dataType: "json",                       //返回值格式
                success: function (data) {
                    if (data["err_message"]) {
                        //清除所有小药箱，个数为0
                        //mbCount = 0;
                        ////-----------------------------------------------------------
                        ////清除地图上的小药箱
                        //if (lnglatList.length > 0) {
                        //    for (var i = 0; i < lnglatList.length; i++) {
                        //        map.removeOverlay(lnglatList[i]);
                        //    }
                        //}
                        //lnglatList = [];
                        //--------------------------------------------------------
                        //console.log(boxcolor);
                        //console.log(data);
                        //console.log(data["err_message"]);
                        return;
                    }
                    var maps = eval("(" + data + ")");
                    //console.log(maps["err_message"]);
                    if (maps["err_message"]) { return; }
                    //mbCount = maps.length;
                    //alert(maps.length);
                    //alert(mbCount);
                    //-----------------------------------------------------------
                    //清除地图上的小药箱
                    //if (lnglatList.length > 0) {
                    //    for (var i = 0; i < lnglatList.length; i++) {
                    //        map.removeOverlay(lnglatList[i]);
                    //    }
                    //}
                    //lnglatList = [];          
                    //------------------------red-----------------------------------------------------------
                    if (boxcolor == "red") {
                        //if (redboxlist.length > 0) {
                        //    for (var i = 0; i < redboxlist.length; i++) {
                        //        map.removeOverlay(redboxlist[i]);
                        //    }
                        //}
                        //redboxlist = [];
                        $.each(maps, function (idx, obj) {
                            var json = JSON.parse(obj);
                            var lnglat = json["lnglat"];
                            var color = json["color"];
                            var boxName = json["boxName"];
                            var temp = lnglat.split('*');
                            var baonew1 = new BMap.Icon("img/xyx" + color + "s.png", new BMap.Size(16, 14));
                            var markerbao = new BMap.Marker(new BMap.Point(temp[0], temp[1]), { icon: baonew1 });
                            map.addOverlay(markerbao);

                            redboxlist.push(markerbao);

                            markerbao.addEventListener("click", function (ev) {
                                //将小药箱的名称和标签信息填进去
                                $("#editBoxName").val(boxName);
                                $("#hiddenlnglat").val(lnglat);
                                var tempcolor = colorListbyLatlngUsernameBoxname(lnglat, username, boxName);
                                //console.log(tempcolor);

                                if (!tempcolor) { tempcolor = color + "*"; }

                                var tempcolorlist = tempcolor.split("*");
                                //console.log(tempcolorlist);
                                $("#editred").prop("checked", "");
                                $("#editgreen").prop("checked", "");
                                $("#editblue").prop("checked", "");
                                $("#editpink").prop("checked", "");
                                $("#editorange").prop("checked", "");
                                $("#editwhite").prop("checked", "");
                                $("#editpurple").prop("checked", "");
                                $("#edityellow").prop("checked", "");
                                for (var i = 0; i < tempcolorlist.length; i++) {
                                    if (tempcolorlist[i] != "") {
                                        if (tempcolorlist[i] == "red") { $("#editred").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "green") { $("#editgreen").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "blue") { $("#editblue").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "pink") { $("#editpink").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "orange") { $("#editorange").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "white") { $("#editwhite").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "purple") { $("#editpurple").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "yellow") { $("#edityellow").prop("checked", "checked"); }
                                    }
                                }
                                $("#editBoxModal").modal("show");
                                //if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                                //    var res = subBox(temp[0] + "*" + temp[1]);
                                //    if (res == 2) {
                                //        map.removeOverlay(this);
                                //    }
                                //    else if (res == 1) {
                                //        alert("删除失败！");
                                //    }
                                //    else {
                                //        alert("当前小药箱创建者非本人，无法删除！");
                                //    }
                                //}
                                setTimeout("$('#addBoxModal').modal('hide')", 10);
                                //ev.stopPropagation();
                            });
                            //ev.stopPropagation();
                            //lnglatList.push(markerbao);

                        });
                    }
                        //------------------------blueboxlist-----------------------------------------------------------   
                    else if (boxcolor == "blue") {
                        //if (blueboxlist.length > 0) {
                        //    for (var i = 0; i < blueboxlist.length; i++) {
                        //        map.removeOverlay(blueboxlist[i]);
                        //    }
                        //}
                        //blueboxlist = [];
                        $.each(maps, function (idx, obj) {
                            var json = JSON.parse(obj);
                            var lnglat = json["lnglat"];
                            var color = json["color"];
                            var boxName = json["boxName"];
                            var temp = lnglat.split('*');
                            var baonew1 = new BMap.Icon("img/xyx" + color + "s.png", new BMap.Size(16, 14));
                            var markerbao = new BMap.Marker(new BMap.Point(temp[0], temp[1]), { icon: baonew1 });
                            map.addOverlay(markerbao);

                            blueboxlist.push(markerbao);

                            //markerbao.addEventListener("click", function (ev) {
                            //    if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                            //        var res = subBox(temp[0] + "*" + temp[1]);
                            //        if (res == 2) {
                            //            map.removeOverlay(this);
                            //        }
                            //        else if (res == 1) {
                            //            alert("删除失败！");
                            //        }
                            //        else {
                            //            alert("当前小药箱创建者非本人，无法删除！");
                            //        }
                            //    }
                            //    setTimeout("$('#addBoxModal').modal('hide')", 10);
                            //    //ev.stopPropagation();
                            //});
                            markerbao.addEventListener("click", function (ev) {
                                //将小药箱的名称和标签信息填进去
                                $("#editBoxName").val(boxName);
                                $("#hiddenlnglat").val(lnglat);
                                var tempcolor = colorListbyLatlngUsernameBoxname(lnglat, username, boxName);
                                //console.log(tempcolor);
                                if (!tempcolor) { tempcolor = color + "*"; }
                                var tempcolorlist = tempcolor.split("*");
                                //console.log(tempcolorlist);
                                $("#editred").prop("checked", "");
                                $("#editgreen").prop("checked", "");
                                $("#editblue").prop("checked", "");
                                $("#editpink").prop("checked", "");
                                $("#editorange").prop("checked", "");
                                $("#editwhite").prop("checked", "");
                                $("#editpurple").prop("checked", "");
                                $("#edityellow").prop("checked", "");
                                for (var i = 0; i < tempcolorlist.length; i++) {
                                    if (tempcolorlist[i] != "") {
                                        if (tempcolorlist[i] == "red") { $("#editred").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "green") { $("#editgreen").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "blue") { $("#editblue").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "pink") { $("#editpink").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "orange") { $("#editorange").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "white") { $("#editwhite").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "purple") { $("#editpurple").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "yellow") { $("#edityellow").prop("checked", "checked"); }
                                    }
                                }
                                $("#editBoxModal").modal("show");
                                //if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                                //    var res = subBox(temp[0] + "*" + temp[1]);
                                //    if (res == 2) {
                                //        map.removeOverlay(this);
                                //    }
                                //    else if (res == 1) {
                                //        alert("删除失败！");
                                //    }
                                //    else {
                                //        alert("当前小药箱创建者非本人，无法删除！");
                                //    }
                                //}
                                setTimeout("$('#addBoxModal').modal('hide')", 10);
                                //ev.stopPropagation();
                            });
                            //ev.stopPropagation();
                            //lnglatList.push(markerbao);

                        });
                    }
                        //------------------------blueboxlist-----------------------------------------------------------
                    else if (boxcolor == "green") {
                        //if (greenboxlist.length > 0) {
                        //    for (var i = 0; i < greenboxlist.length; i++) {
                        //        map.removeOverlay(greenboxlist[i]);
                        //    }
                        //}
                        //greenboxlist = [];
                        $.each(maps, function (idx, obj) {
                            var json = JSON.parse(obj);
                            var lnglat = json["lnglat"];
                            var color = json["color"];
                            var boxName = json["boxName"];
                            var temp = lnglat.split('*');
                            var baonew1 = new BMap.Icon("img/xyx" + color + "s.png", new BMap.Size(16, 14));
                            var markerbao = new BMap.Marker(new BMap.Point(temp[0], temp[1]), { icon: baonew1 });
                            map.addOverlay(markerbao);

                            greenboxlist.push(markerbao);

                            //markerbao.addEventListener("click", function (ev) {
                            //    if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                            //        var res = subBox(temp[0] + "*" + temp[1]);
                            //        if (res == 2) {
                            //            map.removeOverlay(this);
                            //        }
                            //        else if (res == 1) {
                            //            alert("删除失败！");
                            //        }
                            //        else {
                            //            alert("当前小药箱创建者非本人，无法删除！");
                            //        }
                            //    }
                            //    setTimeout("$('#addBoxModal').modal('hide')", 10);
                            //    //ev.stopPropagation();
                            //});
                            //ev.stopPropagation();
                            //lnglatList.push(markerbao);
                            markerbao.addEventListener("click", function (ev) {
                                //将小药箱的名称和标签信息填进去
                                $("#editBoxName").val(boxName);
                                $("#hiddenlnglat").val(lnglat);
                                var tempcolor = colorListbyLatlngUsernameBoxname(lnglat, username, boxName);
                                //console.log(tempcolor);
                                if (!tempcolor) { tempcolor = color + "*"; }
                                var tempcolorlist = tempcolor.split("*");
                                //console.log(tempcolorlist);
                                $("#editred").prop("checked", "");
                                $("#editgreen").prop("checked", "");
                                $("#editblue").prop("checked", "");
                                $("#editpink").prop("checked", "");
                                $("#editorange").prop("checked", "");
                                $("#editwhite").prop("checked", "");
                                $("#editpurple").prop("checked", "");
                                $("#edityellow").prop("checked", "");
                                for (var i = 0; i < tempcolorlist.length; i++) {
                                    if (tempcolorlist[i] != "") {
                                        if (tempcolorlist[i] == "red") { $("#editred").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "green") { $("#editgreen").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "blue") { $("#editblue").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "pink") { $("#editpink").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "orange") { $("#editorange").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "white") { $("#editwhite").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "purple") { $("#editpurple").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "yellow") { $("#edityellow").prop("checked", "checked"); }
                                    }
                                }
                                $("#editBoxModal").modal("show");
                                //if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                                //    var res = subBox(temp[0] + "*" + temp[1]);
                                //    if (res == 2) {
                                //        map.removeOverlay(this);
                                //    }
                                //    else if (res == 1) {
                                //        alert("删除失败！");
                                //    }
                                //    else {
                                //        alert("当前小药箱创建者非本人，无法删除！");
                                //    }
                                //}
                                setTimeout("$('#addBoxModal').modal('hide')", 10);
                                //ev.stopPropagation();
                            });

                        });
                    }
                        //-----------------------------------------------------------------------------------
                    else if (boxcolor == "pink") {
                        //if (pinkboxlist.length > 0) {
                        //    for (var i = 0; i < pinkboxlist.length; i++) {
                        //        map.removeOverlay(pinkboxlist[i]);
                        //    }
                        //}
                        //pinkboxlist = [];
                        $.each(maps, function (idx, obj) {
                            var json = JSON.parse(obj);
                            var lnglat = json["lnglat"];
                            var color = json["color"];
                            var boxName = json["boxName"];
                            var temp = lnglat.split('*');
                            var baonew1 = new BMap.Icon("img/xyx" + color + "s.png", new BMap.Size(16, 14));
                            var markerbao = new BMap.Marker(new BMap.Point(temp[0], temp[1]), { icon: baonew1 });
                            map.addOverlay(markerbao);

                            pinkboxlist.push(markerbao);

                            //markerbao.addEventListener("click", function (ev) {

                            //    if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                            //        var res = subBox(temp[0] + "*" + temp[1]);
                            //        if (res == 2) {
                            //            map.removeOverlay(this);
                            //        }
                            //        else if (res == 1) {
                            //            alert("删除失败！");
                            //        }
                            //        else {
                            //            alert("当前小药箱创建者非本人，无法删除！");
                            //        }
                            //    }
                            //    setTimeout("$('#addBoxModal').modal('hide')", 10);
                            //    //ev.stopPropagation();
                            //});
                            markerbao.addEventListener("click", function (ev) {
                                //将小药箱的名称和标签信息填进去
                                $("#editBoxName").val(boxName);
                                $("#hiddenlnglat").val(lnglat);
                                var tempcolor = colorListbyLatlngUsernameBoxname(lnglat, username, boxName);
                                //console.log(tempcolor);
                                if (!tempcolor) { tempcolor = color + "*"; }
                                var tempcolorlist = tempcolor.split("*");
                                //console.log(tempcolorlist);
                                $("#editred").prop("checked", "");
                                $("#editgreen").prop("checked", "");
                                $("#editblue").prop("checked", "");
                                $("#editpink").prop("checked", "");
                                $("#editorange").prop("checked", "");
                                $("#editwhite").prop("checked", "");
                                $("#editpurple").prop("checked", "");
                                $("#edityellow").prop("checked", "");
                                for (var i = 0; i < tempcolorlist.length; i++) {
                                    if (tempcolorlist[i] != "") {
                                        if (tempcolorlist[i] == "red") { $("#editred").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "green") { $("#editgreen").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "blue") { $("#editblue").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "pink") { $("#editpink").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "orange") { $("#editorange").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "white") { $("#editwhite").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "purple") { $("#editpurple").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "yellow") { $("#edityellow").prop("checked", "checked"); }
                                    }
                                }
                                $("#editBoxModal").modal("show");
                                //if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                                //    var res = subBox(temp[0] + "*" + temp[1]);
                                //    if (res == 2) {
                                //        map.removeOverlay(this);
                                //    }
                                //    else if (res == 1) {
                                //        alert("删除失败！");
                                //    }
                                //    else {
                                //        alert("当前小药箱创建者非本人，无法删除！");
                                //    }
                                //}
                                setTimeout("$('#addBoxModal').modal('hide')", 10);
                                //ev.stopPropagation();
                            });
                            //ev.stopPropagation();
                            //lnglatList.push(markerbao);

                        });
                    }
                        //-----------------------------------------------------------------------------------
                    else if (boxcolor == "orange") {
                        //if (orangeboxlist.length > 0) {
                        //    for (var i = 0; i < orangeboxlist.length; i++) {
                        //        map.removeOverlay(orangeboxlist[i]);
                        //    }
                        //}
                        //orangeboxlist = [];
                        $.each(maps, function (idx, obj) {
                            var json = JSON.parse(obj);
                            var lnglat = json["lnglat"];
                            var color = json["color"];
                            var boxName = json["boxName"];
                            var temp = lnglat.split('*');
                            var baonew1 = new BMap.Icon("img/xyx" + color + "s.png", new BMap.Size(16, 14));
                            var markerbao = new BMap.Marker(new BMap.Point(temp[0], temp[1]), { icon: baonew1 });
                            map.addOverlay(markerbao);

                            orangeboxlist.push(markerbao);

                            //markerbao.addEventListener("click", function (ev) {

                            //    if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                            //        var res = subBox(temp[0] + "*" + temp[1]);
                            //        if (res == 2) {
                            //            map.removeOverlay(this);
                            //        }
                            //        else if (res == 1) {
                            //            alert("删除失败！");
                            //        }
                            //        else {
                            //            alert("当前小药箱创建者非本人，无法删除！");
                            //        }
                            //    }
                            //    setTimeout("$('#addBoxModal').modal('hide')", 10);
                            //    //ev.stopPropagation();
                            //});
                            markerbao.addEventListener("click", function (ev) {
                                //将小药箱的名称和标签信息填进去
                                $("#editBoxName").val(boxName);
                                $("#hiddenlnglat").val(lnglat);
                                var tempcolor = colorListbyLatlngUsernameBoxname(lnglat, username, boxName);
                                //console.log(tempcolor);
                                if (!tempcolor) { tempcolor = color + "*"; }
                                var tempcolorlist = tempcolor.split("*");
                                //console.log(tempcolorlist);
                                $("#editred").prop("checked", "");
                                $("#editgreen").prop("checked", "");
                                $("#editblue").prop("checked", "");
                                $("#editpink").prop("checked", "");
                                $("#editorange").prop("checked", "");
                                $("#editwhite").prop("checked", "");
                                $("#editpurple").prop("checked", "");
                                $("#edityellow").prop("checked", "");
                                for (var i = 0; i < tempcolorlist.length; i++) {
                                    if (tempcolorlist[i] != "") {
                                        if (tempcolorlist[i] == "red") { $("#editred").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "green") { $("#editgreen").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "blue") { $("#editblue").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "pink") { $("#editpink").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "orange") { $("#editorange").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "white") { $("#editwhite").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "purple") { $("#editpurple").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "yellow") { $("#edityellow").prop("checked", "checked"); }
                                    }
                                }
                                $("#editBoxModal").modal("show");
                                //if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                                //    var res = subBox(temp[0] + "*" + temp[1]);
                                //    if (res == 2) {
                                //        map.removeOverlay(this);
                                //    }
                                //    else if (res == 1) {
                                //        alert("删除失败！");
                                //    }
                                //    else {
                                //        alert("当前小药箱创建者非本人，无法删除！");
                                //    }
                                //}
                                setTimeout("$('#addBoxModal').modal('hide')", 10);
                                //ev.stopPropagation();
                            });
                            //ev.stopPropagation();
                            //lnglatList.push(markerbao);

                        });
                    }
                        //-----------------------------------------------------------------------------------
                        //-----------------------------------------------------------------------------------
                    else if (boxcolor == "white") {
                        //if (whiteboxlist.length > 0) {
                        //    for (var i = 0; i < whiteboxlist.length; i++) {
                        //        map.removeOverlay(whiteboxlist[i]);
                        //    }
                        //}
                        //whiteboxlist = [];
                        $.each(maps, function (idx, obj) {
                            var json = JSON.parse(obj);
                            var lnglat = json["lnglat"];
                            var color = json["color"];
                            var boxName = json["boxName"];
                            var temp = lnglat.split('*');
                            var baonew1 = new BMap.Icon("img/xyx" + color + "s.png", new BMap.Size(16, 14));
                            var markerbao = new BMap.Marker(new BMap.Point(temp[0], temp[1]), { icon: baonew1 });
                            map.addOverlay(markerbao);

                            whiteboxlist.push(markerbao);

                            //markerbao.addEventListener("click", function (ev) {

                            //    if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                            //        var res=subBox(temp[0] + "*" + temp[1]);
                            //        if (res == 2) {
                            //            map.removeOverlay(this);
                            //        }
                            //        else if (res == 1) {
                            //            alert("删除失败！");
                            //        }
                            //        else {
                            //            alert("当前小药箱创建者非本人，无法删除！");
                            //        }
                            //    }
                            //    setTimeout("$('#addBoxModal').modal('hide')", 10);
                            //    //ev.stopPropagation();
                            //});
                            markerbao.addEventListener("click", function (ev) {
                                //将小药箱的名称和标签信息填进去
                                $("#editBoxName").val(boxName);
                                $("#hiddenlnglat").val(lnglat);
                                var tempcolor = colorListbyLatlngUsernameBoxname(lnglat, username, boxName);
                                //console.log(tempcolor);
                                if (!tempcolor) { tempcolor = color + "*"; }
                                var tempcolorlist = tempcolor.split("*");
                                //console.log(tempcolorlist);
                                $("#editred").prop("checked", "");
                                $("#editgreen").prop("checked", "");
                                $("#editblue").prop("checked", "");
                                $("#editpink").prop("checked", "");
                                $("#editorange").prop("checked", "");
                                $("#editwhite").prop("checked", "");
                                $("#editpurple").prop("checked", "");
                                $("#edityellow").prop("checked", "");
                                for (var i = 0; i < tempcolorlist.length; i++) {
                                    if (tempcolorlist[i] != "") {
                                        if (tempcolorlist[i] == "red") { $("#editred").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "green") { $("#editgreen").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "blue") { $("#editblue").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "pink") { $("#editpink").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "orange") { $("#editorange").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "white") { $("#editwhite").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "purple") { $("#editpurple").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "yellow") { $("#edityellow").prop("checked", "checked"); }
                                    }
                                }
                                $("#editBoxModal").modal("show");
                                //if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                                //    var res = subBox(temp[0] + "*" + temp[1]);
                                //    if (res == 2) {
                                //        map.removeOverlay(this);
                                //    }
                                //    else if (res == 1) {
                                //        alert("删除失败！");
                                //    }
                                //    else {
                                //        alert("当前小药箱创建者非本人，无法删除！");
                                //    }
                                //}
                                setTimeout("$('#addBoxModal').modal('hide')", 10);
                                //ev.stopPropagation();
                            });
                            //ev.stopPropagation();
                            //lnglatList.push(markerbao);

                        });
                    }
                        //-----------------------------------------------------------------------------------
                        //------------------yellow-----------------------------------------------------------------
                    else if (boxcolor == "yellow") {
                        //console.log(maps);
                        //if (yellowboxlist.length > 0) {
                        //    for (var i = 0; i < yellowboxlist.length; i++) {
                        //        map.removeOverlay(yellowboxlist[i]);
                        //    }
                        //}
                        //yellowboxlist = [];
                        $.each(maps, function (idx, obj) {
                            var json = JSON.parse(obj);
                            //console.log(json);
                            var lnglat = json["lnglat"];
                            var color = json["color"];
                            var boxName = json["boxName"];
                            var temp = lnglat.split('*');
                            var baonew1 = new BMap.Icon("img/xyx" + color + "s.png", new BMap.Size(16, 14));
                            var markerbao = new BMap.Marker(new BMap.Point(temp[0], temp[1]), { icon: baonew1 });
                            map.addOverlay(markerbao);

                            yellowboxlist.push(markerbao);

                            //markerbao.addEventListener("click", function (ev) {

                            //    if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                            //        var res = subBox(temp[0] + "*" + temp[1]);
                            //        if (res == 2) {
                            //            map.removeOverlay(this);
                            //        }
                            //        else if (res == 1) {
                            //            alert("删除失败！");
                            //        }
                            //        else {
                            //            alert("当前小药箱创建者非本人，无法删除！");
                            //        }
                            //    }
                            //    setTimeout("$('#addBoxModal').modal('hide')", 10);
                            //    //ev.stopPropagation();
                            //});
                            markerbao.addEventListener("click", function (ev) {
                                //将小药箱的名称和标签信息填进去
                                $("#editBoxName").val(boxName);
                                $("#hiddenlnglat").val(lnglat);
                                var tempcolor = colorListbyLatlngUsernameBoxname(lnglat, username, boxName);
                                //console.log(tempcolor);
                                if (!tempcolor) { tempcolor = color + "*"; }
                                var tempcolorlist = tempcolor.split("*");
                                //console.log(tempcolorlist);
                                $("#editred").prop("checked", "");
                                $("#editgreen").prop("checked", "");
                                $("#editblue").prop("checked", "");
                                $("#editpink").prop("checked", "");
                                $("#editorange").prop("checked", "");
                                $("#editwhite").prop("checked", "");
                                $("#editpurple").prop("checked", "");
                                $("#edityellow").prop("checked", "");
                                for (var i = 0; i < tempcolorlist.length; i++) {
                                    if (tempcolorlist[i] != "") {
                                        if (tempcolorlist[i] == "red") { $("#editred").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "green") { $("#editgreen").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "blue") { $("#editblue").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "pink") { $("#editpink").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "orange") { $("#editorange").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "white") { $("#editwhite").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "purple") { $("#editpurple").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "yellow") { $("#edityellow").prop("checked", "checked"); }
                                    }
                                }
                                $("#editBoxModal").modal("show");
                                //if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                                //    var res = subBox(temp[0] + "*" + temp[1]);
                                //    if (res == 2) {
                                //        map.removeOverlay(this);
                                //    }
                                //    else if (res == 1) {
                                //        alert("删除失败！");
                                //    }
                                //    else {
                                //        alert("当前小药箱创建者非本人，无法删除！");
                                //    }
                                //}
                                setTimeout("$('#addBoxModal').modal('hide')", 10);
                                //ev.stopPropagation();
                            });
                            //ev.stopPropagation();
                            //lnglatList.push(markerbao);

                        });
                    }
                        //-----------------------------------------------------------------------------------
                        //------------------purple-----------------------------------------------------------------
                    else if (boxcolor == "purple") {
                        //if (purpleboxlist.length > 0) {
                        //    for (var i = 0; i < purpleboxlist.length; i++) {
                        //        map.removeOverlay(purpleboxlist[i]);
                        //    }
                        //}
                        //purpleboxlist = [];
                        $.each(maps, function (idx, obj) {
                            var json = JSON.parse(obj);
                            var lnglat = json["lnglat"];
                            var color = json["color"];
                            var boxName = json["boxName"];
                            var temp = lnglat.split('*');
                            var baonew1 = new BMap.Icon("img/xyx" + color + "s.png", new BMap.Size(16, 14));
                            var markerbao = new BMap.Marker(new BMap.Point(temp[0], temp[1]), { icon: baonew1 });
                            map.addOverlay(markerbao);

                            purpleboxlist.push(markerbao);

                            //markerbao.addEventListener("click", function (ev) {

                            //    if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                            //        var res = subBox(temp[0] + "*" + temp[1]);
                            //        if (res == 2) {
                            //            map.removeOverlay(this);
                            //        }
                            //        else if (res == 1) {
                            //            alert("删除失败！");
                            //        }
                            //        else {
                            //            alert("当前小药箱创建者非本人，无法删除！");
                            //        }
                            //    }
                            //    setTimeout("$('#addBoxModal').modal('hide')", 10);
                            //    //ev.stopPropagation();
                            //});
                            markerbao.addEventListener("click", function (ev) {
                                //将小药箱的名称和标签信息填进去
                                $("#editBoxName").val(boxName);
                                $("#hiddenlnglat").val(lnglat);
                                var tempcolor = colorListbyLatlngUsernameBoxname(lnglat, username, boxName);
                                //console.log(tempcolor);
                                if (!tempcolor) { tempcolor = color + "*"; }
                                var tempcolorlist = tempcolor.split("*");
                                //console.log(tempcolorlist);
                                $("#editred").prop("checked", "");
                                $("#editgreen").prop("checked", "");
                                $("#editblue").prop("checked", "");
                                $("#editpink").prop("checked", "");
                                $("#editorange").prop("checked", "");
                                $("#editwhite").prop("checked", "");
                                $("#editpurple").prop("checked", "");
                                $("#edityellow").prop("checked", "");
                                for (var i = 0; i < tempcolorlist.length; i++) {
                                    if (tempcolorlist[i] != "") {
                                        if (tempcolorlist[i] == "red") { $("#editred").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "green") { $("#editgreen").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "blue") { $("#editblue").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "pink") { $("#editpink").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "orange") { $("#editorange").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "white") { $("#editwhite").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "purple") { $("#editpurple").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "yellow") { $("#edityellow").prop("checked", "checked"); }
                                    }
                                }
                                $("#editBoxModal").modal("show");
                                //if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                                //    var res = subBox(temp[0] + "*" + temp[1]);
                                //    if (res == 2) {
                                //        map.removeOverlay(this);
                                //    }
                                //    else if (res == 1) {
                                //        alert("删除失败！");
                                //    }
                                //    else {
                                //        alert("当前小药箱创建者非本人，无法删除！");
                                //    }
                                //}
                                setTimeout("$('#addBoxModal').modal('hide')", 10);
                                //ev.stopPropagation();
                            });
                            //ev.stopPropagation();
                            //lnglatList.push(markerbao);

                        });
                    }
                    //-----------------------------------------------------------------------------------
                    //-----------------------------------------------------------------------------------

                },
                complete: function (XMLHttpRequest, textStatus) {
                    //console.log(boxcolor);
                    //console.log(boxlist);
                },
            });
        }
        //-----------------------------------------------------------------------------------
        //-----------------------------------------------------------------------------------
        function getallmbbyusername(username,boxcolor) {
            $.ajax({
                type: "post",                          //提交方式
                async:false,
                url: "h5marker.ashx",        //一般处理程序的路径
                data: { action: "allmbsbyusername", userName: username, color: boxcolor },           //向后台传入的值
                //data: { action: "latlngbyplatenumber", carnumber: plateNumber }, 
                dataType: "text",                       //返回值格式
                //dataType: "json",                       //返回值格式
                success: function (data) {
                    if (data["err_message"]) {
                        //清除所有小药箱，个数为0
                        //mbCount = 0;
                        ////-----------------------------------------------------------
                        ////清除地图上的小药箱
                        //if (lnglatList.length > 0) {
                        //    for (var i = 0; i < lnglatList.length; i++) {
                        //        map.removeOverlay(lnglatList[i]);
                        //    }
                        //}
                        //lnglatList = [];
                        //--------------------------------------------------------
                        //console.log(boxcolor);
                        //console.log(data);
                        //console.log(data["err_message"]);
                        return;
                    }
                    var maps = eval("(" + data + ")");
                    //console.log(maps["err_message"]);
                    if (maps["err_message"]) { return;}
                    //mbCount = maps.length;
                    //alert(maps.length);
                    //alert(mbCount);
                    //-----------------------------------------------------------
                    //清除地图上的小药箱
                    //if (lnglatList.length > 0) {
                    //    for (var i = 0; i < lnglatList.length; i++) {
                    //        map.removeOverlay(lnglatList[i]);
                    //    }
                    //}
                    //lnglatList = [];          
                    //------------------------red-----------------------------------------------------------
                    if (boxcolor == "red") {
                        if (redboxlist.length > 0) {
                            for (var i = 0; i < redboxlist.length; i++) {
                                map.removeOverlay(redboxlist[i]);
                            }
                        }
                        redboxlist = [];
                        $.each(maps, function (idx, obj) {
                            var json = JSON.parse(obj);
                            var lnglat = json["lnglat"];
                            var color = json["color"];
                            var boxName = json["boxName"];
                            var temp = lnglat.split('*');
                            var baonew1 = new BMap.Icon("img/xyx" + color + "s.png", new BMap.Size(16, 14));
                            var markerbao = new BMap.Marker(new BMap.Point(temp[0], temp[1]), { icon: baonew1 });
                            map.addOverlay(markerbao);

                            redboxlist.push(markerbao);

                            markerbao.addEventListener("click", function (ev) {
                                //将小药箱的名称和标签信息填进去
                                $("#editBoxName").val(boxName);
                                $("#hiddenlnglat").val(lnglat);
                                var tempcolor = colorListbyLatlngUsernameBoxname(lnglat, username, boxName);
                                //console.log(tempcolor);
                                
                                if (!tempcolor) { tempcolor = color+"*"; }
                                
                                var tempcolorlist = tempcolor.split("*");
                                //console.log(tempcolorlist);
                                $("#editred").prop("checked", "");
                                $("#editgreen").prop("checked", "");
                                $("#editblue").prop("checked", "");
                                $("#editpink").prop("checked", "");
                                $("#editorange").prop("checked", "");
                                $("#editwhite").prop("checked", "");
                                $("#editpurple").prop("checked", "");
                                $("#edityellow").prop("checked", "");
                                for (var i = 0; i < tempcolorlist.length; i++) {
                                    if (tempcolorlist[i] != "") {
                                        if (tempcolorlist[i] == "red") { $("#editred").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "green") { $("#editgreen").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "blue") { $("#editblue").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "pink") { $("#editpink").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "orange") { $("#editorange").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "white") { $("#editwhite").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "purple") { $("#editpurple").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "yellow") { $("#edityellow").prop("checked", "checked"); }
                                    }
                                }
                                $("#editBoxModal").modal("show");
                                //if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                                //    var res = subBox(temp[0] + "*" + temp[1]);
                                //    if (res == 2) {
                                //        map.removeOverlay(this);
                                //    }
                                //    else if (res == 1) {
                                //        alert("删除失败！");
                                //    }
                                //    else {
                                //        alert("当前小药箱创建者非本人，无法删除！");
                                //    }
                                //}
                                setTimeout("$('#addBoxModal').modal('hide')", 10);
                                //ev.stopPropagation();
                            });
                            //ev.stopPropagation();
                            //lnglatList.push(markerbao);

                        });
                    }
                    //------------------------blueboxlist-----------------------------------------------------------   
                    else if (boxcolor == "blue") {
                        if (blueboxlist.length > 0) {
                                for (var i = 0; i < blueboxlist.length; i++) {
                                    map.removeOverlay(blueboxlist[i]);
                                }
                            }
                        blueboxlist = [];
                            $.each(maps, function (idx, obj) {
                                var json = JSON.parse(obj);
                                var lnglat = json["lnglat"];
                                var color = json["color"];
                                var boxName = json["boxName"];
                                var temp = lnglat.split('*');
                                var baonew1 = new BMap.Icon("img/xyx" + color + "s.png", new BMap.Size(16, 14));
                                var markerbao = new BMap.Marker(new BMap.Point(temp[0], temp[1]), { icon: baonew1 });
                                map.addOverlay(markerbao);

                                blueboxlist.push(markerbao);

                                //markerbao.addEventListener("click", function (ev) {
                                //    if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                                //        var res = subBox(temp[0] + "*" + temp[1]);
                                //        if (res == 2) {
                                //            map.removeOverlay(this);
                                //        }
                                //        else if (res == 1) {
                                //            alert("删除失败！");
                                //        }
                                //        else {
                                //            alert("当前小药箱创建者非本人，无法删除！");
                                //        }
                                //    }
                                //    setTimeout("$('#addBoxModal').modal('hide')", 10);
                                //    //ev.stopPropagation();
                                //});
                                markerbao.addEventListener("click", function (ev) {
                                    //将小药箱的名称和标签信息填进去
                                    $("#editBoxName").val(boxName);
                                    $("#hiddenlnglat").val(lnglat);
                                    var tempcolor = colorListbyLatlngUsernameBoxname(lnglat, username, boxName);
                                    //console.log(tempcolor);
                                    if (!tempcolor) { tempcolor = color + "*"; }
                                    var tempcolorlist = tempcolor.split("*");
                                    //console.log(tempcolorlist);
                                    $("#editred").prop("checked", "");
                                    $("#editgreen").prop("checked", "");
                                    $("#editblue").prop("checked", "");
                                    $("#editpink").prop("checked", "");
                                    $("#editorange").prop("checked", "");
                                    $("#editwhite").prop("checked", "");
                                    $("#editpurple").prop("checked", "");
                                    $("#edityellow").prop("checked", "");
                                    for (var i = 0; i < tempcolorlist.length; i++) {
                                        if (tempcolorlist[i] != "") {
                                            if (tempcolorlist[i] == "red") { $("#editred").prop("checked", "checked"); }
                                            if (tempcolorlist[i] == "green") { $("#editgreen").prop("checked", "checked"); }
                                            if (tempcolorlist[i] == "blue") { $("#editblue").prop("checked", "checked"); }
                                            if (tempcolorlist[i] == "pink") { $("#editpink").prop("checked", "checked"); }
                                            if (tempcolorlist[i] == "orange") { $("#editorange").prop("checked", "checked"); }
                                            if (tempcolorlist[i] == "white") { $("#editwhite").prop("checked", "checked"); }
                                            if (tempcolorlist[i] == "purple") { $("#editpurple").prop("checked", "checked"); }
                                            if (tempcolorlist[i] == "yellow") { $("#edityellow").prop("checked", "checked"); }
                                        }
                                    }
                                    $("#editBoxModal").modal("show");
                                    //if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                                    //    var res = subBox(temp[0] + "*" + temp[1]);
                                    //    if (res == 2) {
                                    //        map.removeOverlay(this);
                                    //    }
                                    //    else if (res == 1) {
                                    //        alert("删除失败！");
                                    //    }
                                    //    else {
                                    //        alert("当前小药箱创建者非本人，无法删除！");
                                    //    }
                                    //}
                                    setTimeout("$('#addBoxModal').modal('hide')", 10);
                                    //ev.stopPropagation();
                                });
                                //ev.stopPropagation();
                                //lnglatList.push(markerbao);

                            });
                        }
                    //------------------------blueboxlist-----------------------------------------------------------
                    else if (boxcolor == "green") {
                        if (greenboxlist.length > 0) {
                            for (var i = 0; i < greenboxlist.length; i++) {
                                map.removeOverlay(greenboxlist[i]);
                            }
                        }
                        greenboxlist = [];
                        $.each(maps, function (idx, obj) {
                            var json = JSON.parse(obj);
                            var lnglat = json["lnglat"];
                            var color = json["color"];
                            var boxName = json["boxName"];
                            var temp = lnglat.split('*');
                            var baonew1 = new BMap.Icon("img/xyx" + color + "s.png", new BMap.Size(16, 14));
                            var markerbao = new BMap.Marker(new BMap.Point(temp[0], temp[1]), { icon: baonew1 });
                            map.addOverlay(markerbao);

                            greenboxlist.push(markerbao);

                            //markerbao.addEventListener("click", function (ev) {
                            //    if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                            //        var res = subBox(temp[0] + "*" + temp[1]);
                            //        if (res == 2) {
                            //            map.removeOverlay(this);
                            //        }
                            //        else if (res == 1) {
                            //            alert("删除失败！");
                            //        }
                            //        else {
                            //            alert("当前小药箱创建者非本人，无法删除！");
                            //        }
                            //    }
                            //    setTimeout("$('#addBoxModal').modal('hide')", 10);
                            //    //ev.stopPropagation();
                            //});
                            //ev.stopPropagation();
                            //lnglatList.push(markerbao);
                            markerbao.addEventListener("click", function (ev) {
                                //将小药箱的名称和标签信息填进去
                                $("#editBoxName").val(boxName);
                                $("#hiddenlnglat").val(lnglat);
                                var tempcolor = colorListbyLatlngUsernameBoxname(lnglat, username, boxName);
                                //console.log(tempcolor);
                                if (!tempcolor) { tempcolor = color + "*"; }
                                var tempcolorlist = tempcolor.split("*");
                                //console.log(tempcolorlist);
                                $("#editred").prop("checked", "");
                                $("#editgreen").prop("checked", "");
                                $("#editblue").prop("checked", "");
                                $("#editpink").prop("checked", "");
                                $("#editorange").prop("checked", "");
                                $("#editwhite").prop("checked", "");
                                $("#editpurple").prop("checked", "");
                                $("#edityellow").prop("checked", "");
                                for (var i = 0; i < tempcolorlist.length; i++) {
                                    if (tempcolorlist[i] != "") {
                                        if (tempcolorlist[i] == "red") { $("#editred").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "green") { $("#editgreen").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "blue") { $("#editblue").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "pink") { $("#editpink").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "orange") { $("#editorange").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "white") { $("#editwhite").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "purple") { $("#editpurple").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "yellow") { $("#edityellow").prop("checked", "checked"); }
                                    }
                                }
                                $("#editBoxModal").modal("show");
                                //if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                                //    var res = subBox(temp[0] + "*" + temp[1]);
                                //    if (res == 2) {
                                //        map.removeOverlay(this);
                                //    }
                                //    else if (res == 1) {
                                //        alert("删除失败！");
                                //    }
                                //    else {
                                //        alert("当前小药箱创建者非本人，无法删除！");
                                //    }
                                //}
                                setTimeout("$('#addBoxModal').modal('hide')", 10);
                                //ev.stopPropagation();
                            });

                        });
                    }
                    //-----------------------------------------------------------------------------------
                    else if (boxcolor == "pink") {
                        if (pinkboxlist.length > 0) {
                            for (var i = 0; i < pinkboxlist.length; i++) {
                                map.removeOverlay(pinkboxlist[i]);
                            }
                        }
                        pinkboxlist = [];
                        $.each(maps, function (idx, obj) {
                            var json = JSON.parse(obj);
                            var lnglat = json["lnglat"];
                            var color = json["color"];
                            var boxName = json["boxName"];
                            var temp = lnglat.split('*');
                            var baonew1 = new BMap.Icon("img/xyx" + color + "s.png", new BMap.Size(16, 14));
                            var markerbao = new BMap.Marker(new BMap.Point(temp[0], temp[1]), { icon: baonew1 });
                            map.addOverlay(markerbao);

                            pinkboxlist.push(markerbao);

                            //markerbao.addEventListener("click", function (ev) {

                            //    if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                            //        var res = subBox(temp[0] + "*" + temp[1]);
                            //        if (res == 2) {
                            //            map.removeOverlay(this);
                            //        }
                            //        else if (res == 1) {
                            //            alert("删除失败！");
                            //        }
                            //        else {
                            //            alert("当前小药箱创建者非本人，无法删除！");
                            //        }
                            //    }
                            //    setTimeout("$('#addBoxModal').modal('hide')", 10);
                            //    //ev.stopPropagation();
                            //});
                            markerbao.addEventListener("click", function (ev) {
                                //将小药箱的名称和标签信息填进去
                                $("#editBoxName").val(boxName);
                                $("#hiddenlnglat").val(lnglat);
                                var tempcolor = colorListbyLatlngUsernameBoxname(lnglat, username, boxName);
                                //console.log(tempcolor);
                                if (!tempcolor) { tempcolor = color + "*"; }
                                var tempcolorlist = tempcolor.split("*");
                                //console.log(tempcolorlist);
                                $("#editred").prop("checked", "");
                                $("#editgreen").prop("checked", "");
                                $("#editblue").prop("checked", "");
                                $("#editpink").prop("checked", "");
                                $("#editorange").prop("checked", "");
                                $("#editwhite").prop("checked", "");
                                $("#editpurple").prop("checked", "");
                                $("#edityellow").prop("checked", "");
                                for (var i = 0; i < tempcolorlist.length; i++) {
                                    if (tempcolorlist[i] != "") {
                                        if (tempcolorlist[i] == "red") { $("#editred").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "green") { $("#editgreen").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "blue") { $("#editblue").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "pink") { $("#editpink").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "orange") { $("#editorange").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "white") { $("#editwhite").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "purple") { $("#editpurple").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "yellow") { $("#edityellow").prop("checked", "checked"); }
                                    }
                                }
                                $("#editBoxModal").modal("show");
                                //if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                                //    var res = subBox(temp[0] + "*" + temp[1]);
                                //    if (res == 2) {
                                //        map.removeOverlay(this);
                                //    }
                                //    else if (res == 1) {
                                //        alert("删除失败！");
                                //    }
                                //    else {
                                //        alert("当前小药箱创建者非本人，无法删除！");
                                //    }
                                //}
                                setTimeout("$('#addBoxModal').modal('hide')", 10);
                                //ev.stopPropagation();
                            });
                            //ev.stopPropagation();
                            //lnglatList.push(markerbao);

                        });
                    }
                    //-----------------------------------------------------------------------------------
                    else if (boxcolor == "orange") {
                        if (orangeboxlist.length > 0) {
                            for (var i = 0; i < orangeboxlist.length; i++) {
                                map.removeOverlay(orangeboxlist[i]);
                            }
                        }
                        orangeboxlist = [];
                        $.each(maps, function (idx, obj) {
                            var json = JSON.parse(obj);
                            var lnglat = json["lnglat"];
                            var color = json["color"];
                            var boxName = json["boxName"];
                            var temp = lnglat.split('*');
                            var baonew1 = new BMap.Icon("img/xyx" + color + "s.png", new BMap.Size(16, 14));
                            var markerbao = new BMap.Marker(new BMap.Point(temp[0], temp[1]), { icon: baonew1 });
                            map.addOverlay(markerbao);

                            orangeboxlist.push(markerbao);

                            //markerbao.addEventListener("click", function (ev) {

                            //    if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                            //        var res = subBox(temp[0] + "*" + temp[1]);
                            //        if (res == 2) {
                            //            map.removeOverlay(this);
                            //        }
                            //        else if (res == 1) {
                            //            alert("删除失败！");
                            //        }
                            //        else {
                            //            alert("当前小药箱创建者非本人，无法删除！");
                            //        }
                            //    }
                            //    setTimeout("$('#addBoxModal').modal('hide')", 10);
                            //    //ev.stopPropagation();
                            //});
                            markerbao.addEventListener("click", function (ev) {
                                //将小药箱的名称和标签信息填进去
                                $("#editBoxName").val(boxName);
                                $("#hiddenlnglat").val(lnglat);
                                var tempcolor = colorListbyLatlngUsernameBoxname(lnglat, username, boxName);
                                //console.log(tempcolor);
                                if (!tempcolor) { tempcolor = color + "*"; }
                                var tempcolorlist = tempcolor.split("*");
                                //console.log(tempcolorlist);
                                $("#editred").prop("checked", "");
                                $("#editgreen").prop("checked", "");
                                $("#editblue").prop("checked", "");
                                $("#editpink").prop("checked", "");
                                $("#editorange").prop("checked", "");
                                $("#editwhite").prop("checked", "");
                                $("#editpurple").prop("checked", "");
                                $("#edityellow").prop("checked", "");
                                for (var i = 0; i < tempcolorlist.length; i++) {
                                    if (tempcolorlist[i] != "") {
                                        if (tempcolorlist[i] == "red") { $("#editred").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "green") { $("#editgreen").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "blue") { $("#editblue").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "pink") { $("#editpink").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "orange") { $("#editorange").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "white") { $("#editwhite").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "purple") { $("#editpurple").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "yellow") { $("#edityellow").prop("checked", "checked"); }
                                    }
                                }
                                $("#editBoxModal").modal("show");
                                //if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                                //    var res = subBox(temp[0] + "*" + temp[1]);
                                //    if (res == 2) {
                                //        map.removeOverlay(this);
                                //    }
                                //    else if (res == 1) {
                                //        alert("删除失败！");
                                //    }
                                //    else {
                                //        alert("当前小药箱创建者非本人，无法删除！");
                                //    }
                                //}
                                setTimeout("$('#addBoxModal').modal('hide')", 10);
                                //ev.stopPropagation();
                            });
                            //ev.stopPropagation();
                            //lnglatList.push(markerbao);

                        });
                    }
                    //-----------------------------------------------------------------------------------
                        //-----------------------------------------------------------------------------------
                    else if (boxcolor == "white") {
                        if (whiteboxlist.length > 0) {
                            for (var i = 0; i < whiteboxlist.length; i++) {
                                map.removeOverlay(whiteboxlist[i]);
                            }
                        }
                        whiteboxlist = [];
                        $.each(maps, function (idx, obj) {
                            var json = JSON.parse(obj);
                            var lnglat = json["lnglat"];
                            var color = json["color"];
                            var boxName = json["boxName"];
                            var temp = lnglat.split('*');
                            var baonew1 = new BMap.Icon("img/xyx" + color + "s.png", new BMap.Size(16, 14));
                            var markerbao = new BMap.Marker(new BMap.Point(temp[0], temp[1]), { icon: baonew1 });
                            map.addOverlay(markerbao);

                            whiteboxlist.push(markerbao);

                            //markerbao.addEventListener("click", function (ev) {

                            //    if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                            //        var res=subBox(temp[0] + "*" + temp[1]);
                            //        if (res == 2) {
                            //            map.removeOverlay(this);
                            //        }
                            //        else if (res == 1) {
                            //            alert("删除失败！");
                            //        }
                            //        else {
                            //            alert("当前小药箱创建者非本人，无法删除！");
                            //        }
                            //    }
                            //    setTimeout("$('#addBoxModal').modal('hide')", 10);
                            //    //ev.stopPropagation();
                            //});
                            markerbao.addEventListener("click", function (ev) {
                                //将小药箱的名称和标签信息填进去
                                $("#editBoxName").val(boxName);
                                $("#hiddenlnglat").val(lnglat);
                                var tempcolor = colorListbyLatlngUsernameBoxname(lnglat, username, boxName);
                                //console.log(tempcolor);
                                if (!tempcolor) { tempcolor = color + "*"; }
                                var tempcolorlist = tempcolor.split("*");
                                //console.log(tempcolorlist);
                                $("#editred").prop("checked", "");
                                $("#editgreen").prop("checked", "");
                                $("#editblue").prop("checked", "");
                                $("#editpink").prop("checked", "");
                                $("#editorange").prop("checked", "");
                                $("#editwhite").prop("checked", "");
                                $("#editpurple").prop("checked", "");
                                $("#edityellow").prop("checked", "");
                                for (var i = 0; i < tempcolorlist.length; i++) {
                                    if (tempcolorlist[i] != "") {
                                        if (tempcolorlist[i] == "red") { $("#editred").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "green") { $("#editgreen").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "blue") { $("#editblue").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "pink") { $("#editpink").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "orange") { $("#editorange").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "white") { $("#editwhite").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "purple") { $("#editpurple").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "yellow") { $("#edityellow").prop("checked", "checked"); }
                                    }
                                }
                                $("#editBoxModal").modal("show");
                                //if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                                //    var res = subBox(temp[0] + "*" + temp[1]);
                                //    if (res == 2) {
                                //        map.removeOverlay(this);
                                //    }
                                //    else if (res == 1) {
                                //        alert("删除失败！");
                                //    }
                                //    else {
                                //        alert("当前小药箱创建者非本人，无法删除！");
                                //    }
                                //}
                                setTimeout("$('#addBoxModal').modal('hide')", 10);
                                //ev.stopPropagation();
                            });
                            //ev.stopPropagation();
                            //lnglatList.push(markerbao);

                        });
                    }
                    //-----------------------------------------------------------------------------------
                        //------------------yellow-----------------------------------------------------------------
                    else if (boxcolor == "yellow") {
                        //console.log(maps);
                        if (yellowboxlist.length > 0) {
                            for (var i = 0; i < yellowboxlist.length; i++) {
                                map.removeOverlay(yellowboxlist[i]);
                            }
                        }
                        yellowboxlist = [];
                        $.each(maps, function (idx, obj) {
                            var json = JSON.parse(obj);
                            //console.log(json);
                            var lnglat = json["lnglat"];
                            var color = json["color"];
                            var boxName = json["boxName"];
                            var temp = lnglat.split('*');
                            var baonew1 = new BMap.Icon("img/xyx" + color + "s.png", new BMap.Size(16, 14));
                            var markerbao = new BMap.Marker(new BMap.Point(temp[0], temp[1]), { icon: baonew1 });
                            map.addOverlay(markerbao);

                            yellowboxlist.push(markerbao);

                            //markerbao.addEventListener("click", function (ev) {

                            //    if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                            //        var res = subBox(temp[0] + "*" + temp[1]);
                            //        if (res == 2) {
                            //            map.removeOverlay(this);
                            //        }
                            //        else if (res == 1) {
                            //            alert("删除失败！");
                            //        }
                            //        else {
                            //            alert("当前小药箱创建者非本人，无法删除！");
                            //        }
                            //    }
                            //    setTimeout("$('#addBoxModal').modal('hide')", 10);
                            //    //ev.stopPropagation();
                            //});
                            markerbao.addEventListener("click", function (ev) {
                                //将小药箱的名称和标签信息填进去
                                $("#editBoxName").val(boxName);
                                $("#hiddenlnglat").val(lnglat);
                                var tempcolor = colorListbyLatlngUsernameBoxname(lnglat, username, boxName);
                                //console.log(tempcolor);
                                if (!tempcolor) { tempcolor = color + "*"; }
                                var tempcolorlist = tempcolor.split("*");
                                //console.log(tempcolorlist);
                                $("#editred").prop("checked", "");
                                $("#editgreen").prop("checked", "");
                                $("#editblue").prop("checked", "");
                                $("#editpink").prop("checked", "");
                                $("#editorange").prop("checked", "");
                                $("#editwhite").prop("checked", "");
                                $("#editpurple").prop("checked", "");
                                $("#edityellow").prop("checked", "");
                                for (var i = 0; i < tempcolorlist.length; i++) {
                                    if (tempcolorlist[i] != "") {
                                        if (tempcolorlist[i] == "red") { $("#editred").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "green") { $("#editgreen").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "blue") { $("#editblue").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "pink") { $("#editpink").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "orange") { $("#editorange").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "white") { $("#editwhite").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "purple") { $("#editpurple").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "yellow") { $("#edityellow").prop("checked", "checked"); }
                                    }
                                }
                                $("#editBoxModal").modal("show");
                                //if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                                //    var res = subBox(temp[0] + "*" + temp[1]);
                                //    if (res == 2) {
                                //        map.removeOverlay(this);
                                //    }
                                //    else if (res == 1) {
                                //        alert("删除失败！");
                                //    }
                                //    else {
                                //        alert("当前小药箱创建者非本人，无法删除！");
                                //    }
                                //}
                                setTimeout("$('#addBoxModal').modal('hide')", 10);
                                //ev.stopPropagation();
                            });
                            //ev.stopPropagation();
                            //lnglatList.push(markerbao);

                        });
                    }
                    //-----------------------------------------------------------------------------------
                        //------------------purple-----------------------------------------------------------------
                    else if (boxcolor == "purple") {
                        if (purpleboxlist.length > 0) {
                            for (var i = 0; i < purpleboxlist.length; i++) {
                                map.removeOverlay(purpleboxlist[i]);
                            }
                        }
                        purpleboxlist = [];
                        $.each(maps, function (idx, obj) {
                            var json = JSON.parse(obj);
                            var lnglat = json["lnglat"];
                            var color = json["color"];
                            var boxName = json["boxName"];
                            var temp = lnglat.split('*');
                            var baonew1 = new BMap.Icon("img/xyx" + color + "s.png", new BMap.Size(16, 14));
                            var markerbao = new BMap.Marker(new BMap.Point(temp[0], temp[1]), { icon: baonew1 });
                            map.addOverlay(markerbao);

                            purpleboxlist.push(markerbao);

                            //markerbao.addEventListener("click", function (ev) {

                            //    if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                            //        var res = subBox(temp[0] + "*" + temp[1]);
                            //        if (res == 2) {
                            //            map.removeOverlay(this);
                            //        }
                            //        else if (res == 1) {
                            //            alert("删除失败！");
                            //        }
                            //        else {
                            //            alert("当前小药箱创建者非本人，无法删除！");
                            //        }
                            //    }
                            //    setTimeout("$('#addBoxModal').modal('hide')", 10);
                            //    //ev.stopPropagation();
                            //});
                            markerbao.addEventListener("click", function (ev) {
                                //将小药箱的名称和标签信息填进去
                                $("#editBoxName").val(boxName);
                                $("#hiddenlnglat").val(lnglat);
                                var tempcolor = colorListbyLatlngUsernameBoxname(lnglat, username, boxName);
                                //console.log(tempcolor);
                                if (!tempcolor) { tempcolor = color + "*"; }
                                var tempcolorlist = tempcolor.split("*");
                                //console.log(tempcolorlist);
                                $("#editred").prop("checked", "");
                                $("#editgreen").prop("checked", "");
                                $("#editblue").prop("checked", "");
                                $("#editpink").prop("checked", "");
                                $("#editorange").prop("checked", "");
                                $("#editwhite").prop("checked", "");
                                $("#editpurple").prop("checked", "");
                                $("#edityellow").prop("checked", "");
                                for (var i = 0; i < tempcolorlist.length; i++) {
                                    if (tempcolorlist[i] != "") {
                                        if (tempcolorlist[i] == "red") { $("#editred").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "green") { $("#editgreen").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "blue") { $("#editblue").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "pink") { $("#editpink").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "orange") { $("#editorange").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "white") { $("#editwhite").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "purple") { $("#editpurple").prop("checked", "checked"); }
                                        if (tempcolorlist[i] == "yellow") { $("#edityellow").prop("checked", "checked"); }
                                    }
                                }
                                $("#editBoxModal").modal("show");
                                //if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                                //    var res = subBox(temp[0] + "*" + temp[1]);
                                //    if (res == 2) {
                                //        map.removeOverlay(this);
                                //    }
                                //    else if (res == 1) {
                                //        alert("删除失败！");
                                //    }
                                //    else {
                                //        alert("当前小药箱创建者非本人，无法删除！");
                                //    }
                                //}
                                setTimeout("$('#addBoxModal').modal('hide')", 10);
                                //ev.stopPropagation();
                            });
                            //ev.stopPropagation();
                            //lnglatList.push(markerbao);

                        });
                    }
                    //-----------------------------------------------------------------------------------
                    //-----------------------------------------------------------------------------------

                },
                complete: function (XMLHttpRequest, textStatus) {
                    //console.log(boxcolor);
                    //console.log(boxlist);
                },
            });
        }
        
        //----------------根据车牌号加载历史轨迹--------------------------------------------------------------
        function loadTracksbyPlateNumber(plateNumber) {
            //alert(plateNumber);
            $.ajax({
                type: "post",                          //提交方式
                url: "h5marker.ashx",        //一般处理程序的路径
                data: { action: "tracksbyplatenumber", ppnnmm: plateNumber },           //向后台传入的值
                dataType: "text",                       //返回值格式
                //dataType: "json",                       //返回值格式
                success: function (data) {
                    //if (data["err_message"]) {
                       
                    //    return;
                    //}
                    $("#trackSelect").empty();
                    $("#trackSelect").append(data);
                    //var trackObj = $("#trackSelect");
                    //var first = $("#trackSelect option:first").attr("value");
                    ////console.log(first);
                    //trackObj.val(first).trigger("change");
                    //if (first != "nodata") {
                    //    //imei = first;
                    //    //loaddata(first);
                    //    //setmydatatable();
                    //    trackObj.val(first).trigger("change");                       
                    //}
                    //trackObj.change(function () {
                    //    alert(trackObj.val());
                    //    //imei = sel2.val();
                    //    //loaddata(imei);
                    //});
                    //var maps = eval("(" + data + ")");
                    ////alert(maps["Latitude"]);
                    ////alert(maps["Longitude"]);
                    //var pointRealTime = new BMap.Point(maps["Longitude"], maps["Latitude"]);
                    //var mk = new BMap.Marker(pointRealTime);
                    //map.removeOverlay(oldoverlay);
                    ////historycarmarker.push(mk);
                    //map.addOverlay(mk);
                    //oldoverlay = mk;
                    //map.panTo(pointRealTime);         


                },
                complete: function (XMLHttpRequest, textStatus) {

                },
            });
        }
        //-------------------------$("#trackSelect") change event-----------------------------------------------------
        var trackSelectObj = $("#trackSelect");
        trackSelectObj.change(function () {
            //清除之前的旧轨迹
            map.removeOverlay(oldpolyline);
            if (trackSelectObj.val() != "nodata") {
                //根据车牌号和轨迹名称加载点列表
                //alert(trackSelectObj.val());                
                loadimeilistdrawline(imei, trackSelectObj.val());
            }
            
            //imei = sel2.val();
            //loaddata(imei);
        });
        //----------------------根据车牌号和轨迹名称加载点，并连线画出轨迹--------------------------------------------------------
        var oldpolyline;
        function loadimeilistdrawline(plateNumber, trackName) {
            $.ajax({
                type: "post",                          //提交方式
                url: "h5marker.ashx",        //一般处理程序的路径
                data: { action: "loadpointlist", pn: plateNumber, tn:trackName},            //向后台传入的值
                dataType: "text",                       //返回值格式
                //dataType: "json",                       //返回值格式
                success: function (data) {
                    if (data.error_key) {
                        return;
                    }
                    var maps = eval("(" + data + ")");//转换为json对象 
                    //gpsimeilist = [];
                    //map.clearOverlays();
                    //alert(maps);
                    //ID, RTUID, ParRTUID, Latitude, Longitude
                    var points = [];
                    //for (var i = 0; i < gpslist.length; i++) {
                    //    points.push(new BMapGL.Point(gpslist[i].Longitude, gpslist[i].Latitude));
                    //}
                    //console.log(maps);
                    $.each(maps, function (idx, obj) {
                        
                        var json = JSON.parse(obj);
                        //alert(json);
                        points.push(new BMap.Point(json["Longitude"], json["Latitude"]));
                        //gpsimeilist.push(new GPSIMEI(json["IMEI"], json["DateTime"], json["Latitude"], json["Longitude"], json["Speed"], json["RealTimeLocation"],
                                         //json["IsLocated"], json["LongitudeEastWest"], json["LatitudeSouthNorth"], json["Direction"], json["ACC"], json["UploadMode"], json["RealTimeOrSupply"]));                       
                    });
                    //processGPSByMe(gpsimeilist);
                    //alert(points.length);
                    var polyline = new BMap.Polyline(points, {
                        enableEditing: false,//是否启用线编辑，默认为false
                        enableClicking: false,//是否响应点击事件，默认为true
                        //strokeStyle: 'solid',
                        //geodesic:true,
                        //icons: [icons],
                        strokeWeight: '2',//折线的宽度，以像素为单位
                        strokeOpacity: 1,//折线的透明度，取值范围0 - 1
                        strokeColor: "#ff0000" //折线颜色18a45b
                    });
                    map.removeOverlay(oldpolyline);
                    map.addOverlay(polyline);
                    oldpolyline = polyline;

                },
                complete: function (XMLHttpRequest, textStatus) {

                },


            });
        }
        //------------------------------addtrack------------------------------------------------
        function addtrack(platenumber, trackname,username,orgin,desname) {
            var editinfor = {
                "action": "addTrack",
                "platenumber": platenumber,
                "trackname": trackname,
                "username": username,
                "orgin": orgin,
                "desname" : desname


            };
            //console.log(editinfor);
            $.ajax({
                type: "POST",
                //contentType: "application/json;charset=UTF-8",
                url: "h5marker.ashx",
                //url: "outset_sip.ashx",
                data: editinfor,
                //data: JSON.stringify(addinfor),
                dataType: "json",


                success: function (data) {



                },
                error: function (jqXHR, textStatus, errorThrown) {
                    if (jqXHR.status == 200) {

                    }
                    else {
                        //alert("error");
                    }
                }

            });
        }
        //----------------------------------------------------------------------------------
        //------------------------------addfulltrack------------------------------------------------
        function addfulltrack(platenumber, trackname, desname) {
            var editinfor = {
                "action": "addfulltrack",
                "platenumber": platenumber,
                "trackname": trackname,
                "desname" : desname

            };
            //console.log(editinfor);
            $.ajax({
                type: "POST",
                //contentType: "application/json;charset=UTF-8",
                url: "h5marker.ashx",
                //url: "outset_sip.ashx",
                data: editinfor,
                //data: JSON.stringify(addinfor),
                dataType: "json",


                success: function (data) {
                    //alert("success");
                    loadTracksbyPlateNumber(platenumber);

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    if (jqXHR.status == 200) {
                        loadTracksbyPlateNumber(platenumber);
                    }
                    else {
                        //alert("error");
                    }
                }

            });

        }
        //----------------------------------------------------------------------------------
        //-------------------trackname----------------------------------------------------------------
        var tracknametemp;
        var orgin;
        var desname;
        //------------------------轨迹记录开始按钮点击------------------------------------------------------
        $("#popBtn").on('click', function () {
            $('#startTrack').attr('disabled', "true");
            $('#endTrack').removeAttr("disabled");
            //保存记录
            //------------------------------------------------------------------------------
            var confrimcancel = false;
            while (confrimcancel == false) {
                var trackname = $("#supplyBoxNameone").val();
                // 暂时注释  var trackname = prompt("请输入当前车辆的起始地点");
                if (trackname == null) {
                    $('#endTrack').attr('disabled', "true");
                    $('#startTrack').removeAttr("disabled");
                    confrimcancel = true;
                    //var confirminfor = confirm("您确定要删除当前的轨迹记录吗");
                    //if (confirminfor) {
                    //    //删除轨迹记录，此处写代码，删除之前保存的记录。。。。。。。。。。。。。。。


                    //    alert("当前车辆的轨迹记录已经被删除！");

                    //    confrimcancel = true;

                    //}
                    //else {
                    //    //alert("--------confirm 取消键---------");

                    //}

                }
                else if (trackname == "") {
                    //保存记录
                    alert("请为当前的行车轨迹取一个名字！");

                }
                else {
                    //开始保存记录，车牌号和记录名称！！！！！！！！！！！！！！！！！！！！！！
                    tracknametemp = trackname;
                    orgin = trackname;
                    desname = trackname;
                    //imei trackname   insert  userName
                    addtrack(imei, trackname, userName, orgin, desname)
                    $("#popModal").modal("hide");
                    alert("当前车辆"+imei+"的轨迹开始记录！");
                    confrimcancel = true;
                }
            }
            //------------------------------------------------------------------------------







        });
        //-------------------------轨迹记录结束按钮点击-----------------------------------------------------
        $("#popBtntwo").on('click', function () {
            $('#endTrack').attr('disabled', "true");
            $('#startTrack').removeAttr("disabled");
            //------------------------------------------------------------------------------
            //tracknametemp imei  update  userName
            var confrimcancel = false;
            while (confrimcancel == false) {
                var desname = $("#supplyBoxNametwo").val();
                if (desname == null) {
                    $('#startTrack').attr('disabled', "true");
                    $('#endTrack').removeAttr("disabled");
                    confrimcancel = true;
                    

                }
                else if (desname == "") {
                    //保存记录
                    alert("请为当前的行车轨迹取一个名字！");

                }
                else {
                    //开始保存记录，车牌号和记录名称！！！！！！！！！！！！！！！！！！！！！！
                    //imei trackname   insert  userName
                    addfulltrack(imei, tracknametemp, desname)
                    $("#popModaltwo").modal("hide");
                    alert("当前车辆的轨迹记录成功保存！");
                    confrimcancel = true;
                }
            }

            //var confrimcancel = false;
            //while (confrimcancel == false) {
            //    var trackname = prompt("请为当前车辆的轨迹记录取一个名字：", "名字建议为：车牌号+用户名+起止地点");
            //    if (trackname == null) {
            //        var confirminfor = confirm("您确定要删除当前的轨迹记录吗");
            //        if (confirminfor) {
            //            //删除轨迹记录，此处写代码，删除之前保存的记录。。。。。。。。。。。。。。。


            //            alert("当前车辆的轨迹记录已经被删除！");

            //            confrimcancel = true;

            //        }
            //        else {
            //            //alert("--------confirm 取消键---------");

            //        }

            //    }
            //    else if (trackname == "") {
            //        //保存记录
            //        alert("请为当前的行车轨迹取一个名字！");

            //    }
            //    else {
            //        //开始保存记录，跳出循环，此处的代码是。。。。。。。。

            //        alert("当前车辆的轨迹记录成功保存！");
            //        confrimcancel = true;
            //    }
            //}
            //------------------------------------------------------------------------------

            

        });
        //------------------------------------------------------------------------------
        //------------------------------------------------------------------------------
        //var fullName1 = $("#welcome").text().split(":")[1];
        //var userName = fullName1.split("]")[0];
        //var boxselect = $("#boxselect");
        //boxselect.change(function () {
        //    //alert(sel2.val());
        //    //$("#mydatatable").dataTable().fnClearTable();
        //    //$("#mydatatable").dataTable().fnDestroy();
        //    //setmydatatable();
        //    var boxcolor = boxselect.val();
        //    getallmbbyusername(userName, boxcolor)
        //    //alert(boxcolor);
        //    //loaddata(imei);
        //});
        //--------------------------加载车辆列表------------------------------------------------
        var imei;
        $.ajax({
            type: "post",                          //提交方式
            url: "index.ashx",        //一般处理程序的路径
            async:false,
            //data: { name: "rtuid" },                    //向后台传入的值
            data: { name: "rtuidselect" },
            dataType: "html",                       //返回值格式
            success: function (data) {
                //console.log(data);
                $("#rtuidselect").empty();
                $("#rtuidselect").append(data);
                var sel2 = $("#rtuidselect");
                var first = $("#rtuidselect option:first").attr("value");
                //console.log(first);
                if (first != "nodata") {
                    imei = first;
                    loaddata(first);
                    loadTracksbyPlateNumber(imei);
                    //setmydatatable();
                    sel2.val(first).trigger("change");
                    sel2.change(function () {
                        //alert(sel2.val());
                        //$("#mydatatable").dataTable().fnClearTable();
                        //$("#mydatatable").dataTable().fnDestroy();
                        //setmydatatable();
                        imei = sel2.val();
                        loadTracksbyPlateNumber(imei);
                        loaddata(imei);
                        //清除之前的旧轨迹
                        map.removeOverlay(oldpolyline);

                    });
                }
                //alert(first);
                //setmydatatable();


            },
            complete: function (XMLHttpRequest, textStatus) {
                //$('#myModal').modal('hide');
            },


        });
        //-----------------------------根据车牌号加载车辆最新的经纬度坐标------------------------------------------------------
        var oldoverlay;
        var tempEpoint;
        function loaddata(plateNumber) {
            //alert(plateNumber);
            $.ajax({
                type: "post",                          //提交方式
                url: "h5marker.ashx",        //一般处理程序的路径
                async:false,
                data: { action: "latlngbyplatenumber", ppnnmm: plateNumber },           //向后台传入的值
                dataType: "text",                       //返回值格式
                //dataType: "json",                       //返回值格式
                success: function (data) {
                    //if (data["err_message"]) {
                    //    //清除所有小药箱，个数为0
                    //    //mbCount = 0;
                    //    ////-----------------------------------------------------------
                    //    ////清除地图上的小药箱
                    //    //if (lnglatList.length > 0) {
                    //    //    for (var i = 0; i < lnglatList.length; i++) {
                    //    //        map.removeOverlay(lnglatList[i]);
                    //    //    }
                    //    //}
                    //    //lnglatList = [];
                    //    //--------------------------------------------------------
                    //    return;
                    //}
                    var maps = eval("(" + data + ")");
                    //alert(maps["Latitude"]);
                    //alert(maps["Longitude"]);
                    var pointRealTime = new BMap.Point(maps["Longitude"], maps["Latitude"]);
                    tempEpoint = pointRealTime;
                    var mk = new BMap.Marker(pointRealTime);
                    map.removeOverlay(oldoverlay);
                    //historycarmarker.push(mk);
                    map.addOverlay(mk);
                    oldoverlay = mk;
                    map.panTo(pointRealTime);
                    
                    //mbCount = maps.length;
                    //alert(maps.length);
                    //alert(mbCount);
                    //-----------------------------------------------------------
                    //清除地图上的小药箱
                    //if (lnglatList.length > 0) {
                    //    for (var i = 0; i < lnglatList.length; i++) {
                    //        map.removeOverlay(lnglatList[i]);
                    //    }
                    //}
                    //lnglatList = [];
                    //--------------------------------------------------------
                    //$.each(maps, function (idx, obj) {
                    //    var json = JSON.parse(obj);
                    //    var lnglat = json["lnglat"];
                    //    var temp = lnglat.split('*');
                    //    //--------------------------------
                    //    //alert(temp[0]);
                    //    //alert(temp[1]);
                    //    //var baonew1 = new BMapGL.Icon("img/baonew1.png", new BMapGL.Size(26, 13));
                    //    //var markerbao = new BMapGL.Marker(new BMapGL.Point(temp[0], temp[1]), { icon: baonew1 });
                    //    //map.addOverlay(markerbao);
                    //    var baonew1 = new BMap.Icon("img/baonew.png", new BMap.Size(32, 20));
                    //    var markerbao = new BMap.Marker(new BMap.Point(temp[0], temp[1]), { icon: baonew1 });
                    //    map.addOverlay(markerbao);

                    //    markerbao.addEventListener("click", function (ev) {

                    //        if (confirm("您确定要删除此小药箱吗？")) {
                    //            subBox(temp[0] + "*" + temp[1]);
                    //            map.removeOverlay(this);
                    //        }
                    //        //ev.stopPropagation();
                    //    });
                    //    //lnglatList.push(markerbao);

                    //});
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
        //-----------------------------------------------------------------------------------
        //--------------------------0000000000000000000000000000000000000---------------------------------------------------------
        var firstlng = map.getCenter().lng;
        var firstlat = map.getCenter().lat;
        var banjingmi = map.getDistance(map.getCenter(), map.getBounds().getNorthEast());

        //console.log(map.getCenter());
        //console.log(map.getBounds().getNorthEast());
        //console.log(banjingmi);


        //setTimeout(loadallmbsbyusernameblue, 2000);
        //setTimeout(loadallmbsbyusernamered, 4000);
        //setTimeout(loadallmbsbyusernamegreen, 6000);
        //setTimeout(loadallmbsbyusernamepink, 8000);
        //setTimeout(loadallmbsbyusernameorange, 10000);
        //setTimeout(loadallmbsbyusernamewhite, 12000); 
        //setTimeout(loadallmbsbyusernameyellow, 14000);
        //setTimeout(loadallmbsbyusernamepurple, 16000);


        getallmbbyusernamenew(userName, "blue", firstlng, firstlat, banjingmi, "1");
        getallmbbyusernamenew(userName, "red", firstlng, firstlat, banjingmi, "1");
        getallmbbyusernamenew(userName, "green", firstlng, firstlat, banjingmi, "1");
        getallmbbyusernamenew(userName, "pink", firstlng, firstlat, banjingmi, "1");
        getallmbbyusernamenew(userName, "orange", firstlng, firstlat, banjingmi, "1");
        getallmbbyusernamenew(userName, "white", firstlng, firstlat, banjingmi, "1");
        getallmbbyusernamenew(userName, "yellow", firstlng, firstlat, banjingmi, "1");
        getallmbbyusernamenew(userName, "purple", firstlng, firstlat, banjingmi, "1");
        //----------------------000000000000000000000000000000000000000000000-------------------------------------------------------------
        //-----------------------------------------------------------------------------------

        //--------废弃---------------------------------------------------------------------------
        function moveToNewCenter() {
            var addinfor = {
                "name": "newlocation",
                "userName": userName
            };
            $.ajax({
                type: "POST",
                //contentType: "application/json;charset=UTF-8",
                url: "carManage.ashx",
                //url: "outset_sip.ashx",
                data: addinfor,
                //data: JSON.stringify(addinfor),
                dataType: "json",
                success: function (data) {
                    //console.log(data[err_message]);
                    //console.log("-------------------------");
                    //console.log(data["err_message"]);
                    if (data["err_message"]) {
                        //118.276559,48.223876
                        var pointRealTime = new BMap.Point(118.276559, 48.223876);
                        var mk = new BMap.Marker(pointRealTime);
                        map.addOverlay(mk);
                        map.panTo(pointRealTime);
                        //console.log("无定位");

                    }
                    else {
                        //var maps = eval("(" + data + ")");
                        //var lnglat = maps["lnglat"];
                        var lnglat = data["lnglat"];
                        var temp = lnglat.split('*');
                        var pointRealTime = new BMap.Point(temp[0], temp[1]);
                        var mk = new BMap.Marker(pointRealTime);
                        map.addOverlay(mk);
                        map.panTo(pointRealTime);
                        //console.log(temp[0]);
                        //console.log(temp[1]);
                    }


                },
                error: function (jqXHR, textStatus, errorThrown) {
                    if (jqXHR.status == 200) {
                       
                    }
                    else {
                    }

                }

            });
        }
    //--------------------------------------------------------------------------
    //-----------废弃---------------------------------------------------------------
    function moveToNewCenter1() {
        var geolocation = new BMap.Geolocation();
        //geolocation.enableSDKLocation();
        geolocation.getCurrentPosition(function (r) {
            //alert(this.getStatus());
            //alert(r.point.lng);//117.02496707
            //alert(r.point.lat);//36.68278473
            if (this.getStatus() == 0) {
                var mk = new BMap.Marker(r.point);
                map.addOverlay(mk);
                map.panTo(r.point);
                //alert('您的old位置：' + r.point.lng + ',' + r.point.lat);

                //经纬度坐标转换---------------------------------------------------------
                //translateCallback = function (data) {
                //    if (data.status === 0) {

                //        //alert(data.points[0].lng);//117.03740975676823
                //        //alert(data.points[0].lat);//36.68911221766504
                //        //alert('您的new位置：' + data.points[0].lng + ',' + data.points[0].lat);

                //        var marker = new BMap.Marker(data.points[0]);
                //        map.addOverlay(marker);
                //        map.panTo(data.points[0]);
                //        //var label = new BMapGL.Label("转换后的百度坐标（正确）", { offset: new BMapGL.Size(10, -10) });
                //        //marker.setLabel(label); //添加百度label
                //        //bm.setCenter(data.points[0]);
                //    }
                //}

                //setTimeout(function () {
                //    var convertor = new BMap.Convertor();
                //    var pointArr = [];
                //    pointArr.push(r.point);
                //    convertor.translate(pointArr, 1, 5, translateCallback)
                //}, 1000);
                //---------------------------------------------------------------------       
            }
            else {
                //alert('failed' + this.getStatus());
                //关于状态码
                //BMAP_STATUS_SUCCESS        检索成功。对应数值“0”。
                //BMAP_STATUS_CITY_LIST        城市列表。对应数值“1”。
                //BMAP_STATUS_UNKNOWN_LOCATION        位置结果未知。对应数值“2”。
                //BMAP_STATUS_UNKNOWN_ROUTE        导航结果未知。对应数值“3”。
                //BMAP_STATUS_INVALID_KEY        非法密钥。对应数值“4”。
                //BMAP_STATUS_INVALID_REQUEST        非法请求。对应数值“5”。
                //BMAP_STATUS_PERMISSION_DENIED        没有权限。对应数值“6”。(自 1.1 新增)
                //BMAP_STATUS_SERVICE_UNAVAILABLE        服务不可用。对应数值“7”。(自 1.1 新增)
                //BMAP_STATUS_TIMEOUT        超时。对应数值“8”。(自 1.1 新增)
            }
        }, { enableHighAccuracy: true })
    }
    //-----------------------------------------------------------------------------
    //var map = new BMap.Map('container');
    //    //map.centerAndZoom(new BMap.Point(118.98813, 48.33396), 15);
    //    //118.98813, 48.33396
    //    //117.02496707, 36.68278473
    //map.centerAndZoom(new BMap.Point(118.98813, 48.33396), 11);
    //map.enableScrollWheelZoom(true);
    //map.addEventListener('click', function (e) {
    //    alert('点击位置经纬度：' + e.latlng.lng + ',' + e.latlng.lat);
        //});
       //----------------------------需要修改，model，小药箱的名字16汉字+，五种小药箱选择-------------------------------------------------------
    var tempE;
    map.addEventListener("click", function (e) {
        //console.log(e);
        $("#addBoxModal").modal("show");
        tempE = e;
        //return;


        //if (confirm("您确定要在此处增加小药箱吗？")) {
        //    var baonew1 = new BMap.Icon("img/baonew.png", new BMap.Size(32, 20));
        //    var markerbao = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat), { icon: baonew1 });
        //    map.addOverlay(markerbao);
        //    addBox(e.point.lng + "*" + e.point.lat, userName);
        //    //e.stopPropagation();

        //    markerbao.addEventListener("click", function (ev) {

        //        if (confirm("您确定要删除此小药箱吗？")) {
        //            subBox(e.point.lng + "*" + e.point.lat);
        //            map.removeOverlay(this);
        //        }
        //        //ev.stopPropagation();
        //    });
        //    //e.stopPropagation();
        //}
        //e.stopPropagation();
        //alert(e.point.lng + ", " + e.point.lat);
    });
        //----------------------delBtn click-------------------------------------------------------------
    $("#delBtn").on('click', function () {
        var editBoxName = $("#editBoxName").val();
        if (confirm("您确定要删除名字为'" + editBoxName + "'的小药箱吗？")) {
            var lnglathidden = $("#hiddenlnglat").val();
            $("#editBoxModal").modal("hide");
            var res = subBox(lnglathidden);
            //console.log(typeof (res));
            //console.log(res);
            if (res == 2) {
                //map.removeOverlay(this);
                //$("#editBoxModal").modal("hide");
                alert("删除成功！");
                //修改成功后，再次加载八种颜色的小药箱
                $("#red").prop("checked", "checked");
                $("#blue").prop("checked", "checked");
                $("#green").prop("checked", "checked");
                $("#pink").prop("checked", "checked");
                $("#orange").prop("checked", "checked");
                $("#white").prop("checked", "checked");
                $("#yellow").prop("checked", "checked");
                $("#purple").prop("checked", "checked");
                getallmbbyusername(userName, "blue");
                getallmbbyusername(userName, "red");
                getallmbbyusername(userName, "green");
                getallmbbyusername(userName, "pink");
                getallmbbyusername(userName, "orange");
                getallmbbyusername(userName, "white");
                getallmbbyusername(userName, "yellow");
                getallmbbyusername(userName, "purple");
                loaddata(imei);
            }
            else if (res == 1) {
                alert("删除失败！");
            }
            else {
                alert("当前小药箱创建者非本人，无法删除！");
            }
        }
    });
        //----------------------editBtn click-------------editBtn------------------------------------------------
    $("#editBtn").on('click', function () {
        var editBoxName = $("#editBoxName").val();
        var lnglathidden = $("#hiddenlnglat").val();
        if (editBoxName == "") {
            alert("请将小药箱的名字填写完整！");
            return;
        }
       
        var boxcolorcheckedlist = [];
        if ($("#editblue").prop("checked")) {
            boxcolorcheckedlist.push("blue");
        }
        if ($("#editred").prop("checked")) {
            boxcolorcheckedlist.push("red");
        }
        if ($("#editgreen").prop("checked")) {
            boxcolorcheckedlist.push("green");
        }
        if ($("#editpink").prop("checked")) {
            boxcolorcheckedlist.push("pink");
        }
        if ($("#editorange").prop("checked")) {
            boxcolorcheckedlist.push("orange");
        }
        if ($("#editwhite").prop("checked")) {
            boxcolorcheckedlist.push("white");
        }
        if ($("#edityellow").prop("checked")) {
            boxcolorcheckedlist.push("yellow");
        }
        if ($("#editpurple").prop("checked")) {
            boxcolorcheckedlist.push("purple");
        }
        if (boxcolorcheckedlist.length == 0) {
            alert("小药箱的标签至少选择一个！");
            return;
        }
        var sendcolor = "";
        for (var i = 0; i < boxcolorcheckedlist.length; i++) {
            sendcolor = sendcolor + "*" + boxcolorcheckedlist[i];
        }
        //edit ajax         
        var result = editBox(lnglathidden, userName, editBoxName, sendcolor);
        if (result == 0) {
            alert("当前小药箱创建者非本人，无法编辑修改！");
        }
        //隐藏editbox
        $("#editBoxModal").modal("hide");
        //修改成功后，再次加载八种颜色的小药箱
        $("#red").prop("checked", "checked");
        $("#blue").prop("checked", "checked");
        $("#green").prop("checked", "checked");
        $("#pink").prop("checked", "checked");
        $("#orange").prop("checked", "checked");
        $("#white").prop("checked", "checked");
        $("#yellow").prop("checked", "checked");
        $("#purple").prop("checked", "checked");
        getallmbbyusername(userName, "blue");
        getallmbbyusername(userName, "red");
        getallmbbyusername(userName, "green");
        getallmbbyusername(userName, "pink");
        getallmbbyusername(userName, "orange");
        getallmbbyusername(userName, "white");
        getallmbbyusername(userName, "yellow");
        getallmbbyusername(userName, "purple");
        loaddata(imei);
        //alert("小药箱的名字和标签已经被成功修改！");
    });
        //---------------------addBtn click----------------------------------------------------------------------------------------------------------------------
    $("#addBtn").on('click', function () {
        //$("#addBoxModal").modal("hide");
        //return;
        //name, sex, IDCard, depID, phoneNumber, jobPosition, education, isCertificated, registeredResidence
        var addBoxName = $("#addBoxName").val();
        //var from = $("#addFrom").val();
        //var to = $("#addTo").val();
        //var cartype = $("#addCarType").val();
        //alert(datetime);

        //return;

        if (addBoxName == "") {
            alert("请将小药箱的名字填写完整！");
            return;
        }
        //----------------------------------------------------------------
        //var tempboxcolor = $("#addBoxLabel").val();

        //$("#addBoxLabel option:selected").each(function () {
        //    console.log($(this).val());
        //})
        var boxcolorcheckedlist = [];
        if ($("#addblue").prop("checked")) {
            boxcolorcheckedlist.push("blue");
        }
        if ($("#addred").prop("checked")) {
            boxcolorcheckedlist.push("red");
        }
        if ($("#addgreen").prop("checked")) {
            boxcolorcheckedlist.push("green");
        }
        if ($("#addpink").prop("checked")) {
            boxcolorcheckedlist.push("pink");
        }
        if ($("#addorange").prop("checked")) {
            boxcolorcheckedlist.push("orange");
        }
        if ($("#addwhite").prop("checked")) {
            boxcolorcheckedlist.push("white");
        }
        if ($("#addyellow").prop("checked")) {
            boxcolorcheckedlist.push("yellow");
        }
        if ($("#addpurple").prop("checked")) {
            boxcolorcheckedlist.push("purple");
        }
        if (boxcolorcheckedlist.length == 0) {
            alert("小药箱的标签至少选择一个！");
            return;
        }
        //console.log(boxcolorcheckedlist);
        for (var i = 0; i < boxcolorcheckedlist.length; i++) {
            tempboxcolor = boxcolorcheckedlist[i];
            var baonew1 = new BMap.Icon("img/xyx" + tempboxcolor + "s.png", new BMap.Size(16, 14));
            //在当前定位点加入小药箱
            var markerbao = new BMap.Marker(new BMap.Point(tempEpoint.lng, tempEpoint.lat), { icon: baonew1 });           
            //var markerbao = new BMap.Marker(new BMap.Point(map.getCenter().lng, map.getCenter().lat), { icon: baonew1 });
            
            markerbao.setTitle(addBoxName);
            map.addOverlay(markerbao);
            //blueboxlist
            if (tempboxcolor == "blue") {
                blueboxlist.push(markerbao);
            }
            else if (tempboxcolor == "red") {
                redboxlist.push(markerbao);
            }
            else if (tempboxcolor == "green") {
                greenboxlist.push(markerbao);
            }
            else if (tempboxcolor == "pink") {
                pinkboxlist.push(markerbao);
            }
            else if (tempboxcolor == "orange") {
                orangeboxlist.push(markerbao);
            }
            else if (tempboxcolor == "white") {
                whiteboxlist.push(markerbao);
            }
            else if (tempboxcolor == "yellow") {
                yellowboxlist.push(markerbao);
            }
            else if (tempboxcolor == "purple") {
                purpleboxlist.push(markerbao);
            }
            //boxMarkerList.push(markerbao);

            markerbao.customData = {
                boxlng: tempEpoint.lng, boxlat: tempEpoint.lat
            };

            //var baonew1 = new BMap.Icon("img/baonew.png", new BMap.Size(32, 20));
            //var markerbao = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat), { icon: baonew1 });
            //map.addOverlay(markerbao);
            //addBox(tempE.point.lng + "*" + tempE.point.lat, userName, addBoxName, tempboxcolor);
            addBox(tempEpoint.lng + "*" + tempEpoint.lat, userName, addBoxName, tempboxcolor);
            //e.stopPropagation();     

            //markerbao.addEventListener("click", function (ev) {

            //    if (confirm("您确定要删除名字为'" + addBoxName + "'的小药箱吗？")) {
            //        var res = subBox(ev.target.customData.boxlng + "*" + ev.target.customData.boxlat);
            //        //console.log(typeof (res));
            //        //console.log(res);
            //        if (res == 2) {
            //            map.removeOverlay(this);
            //        }
            //        else if(res == 1) {
            //            alert("删除失败！");
            //        }
            //        else{
            //            alert("当前小药箱创建者非本人，无法删除！");
            //        }
            //        //ev.stopPropagation();
            //    }
            //    //$("#cancelBtn").click();
            //    //ev.stopPropagation();
            //    //$("#addBoxModal").modal("hide");
            //    setTimeout("$('#addBoxModal').modal('hide')", 10);
            //});
            markerbao.addEventListener("click", function (ev) {
                //将小药箱的名称和标签信息填进去
                $("#editBoxName").val(addBoxName);
                $("#hiddenlnglat").val(tempEpoint.lng + "*" + tempEpoint.lat);
                var tempcolor = colorListbyLatlngUsernameBoxname(tempEpoint.lng + "*" + tempEpoint.lat, userName, addBoxName);
                //console.log(tempcolor);
                var tempcolorlist = tempcolor.split("*");
                //console.log(tempcolorlist);
                $("#editred").prop("checked", "");
                $("#editgreen").prop("checked", "");
                $("#editblue").prop("checked", "");
                $("#editpink").prop("checked", "");
                $("#editorange").prop("checked", "");
                $("#editwhite").prop("checked", "");
                $("#editpurple").prop("checked", "");
                $("#edityellow").prop("checked", "");
                for (var i = 0; i < tempcolorlist.length; i++) {
                    if (tempcolorlist[i] != "") {
                        if (tempcolorlist[i] == "red") { $("#editred").prop("checked", "checked"); }
                        if (tempcolorlist[i] == "green") { $("#editgreen").prop("checked", "checked"); }
                        if (tempcolorlist[i] == "blue") { $("#editblue").prop("checked", "checked"); }
                        if (tempcolorlist[i] == "pink") { $("#editpink").prop("checked", "checked"); }
                        if (tempcolorlist[i] == "orange") { $("#editorange").prop("checked", "checked"); }
                        if (tempcolorlist[i] == "white") { $("#editwhite").prop("checked", "checked"); }
                        if (tempcolorlist[i] == "purple") { $("#editpurple").prop("checked", "checked"); }
                        if (tempcolorlist[i] == "yellow") { $("#edityellow").prop("checked", "checked"); }
                    }
                }
                $("#editBoxModal").modal("show");
                //if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                //    var res = subBox(temp[0] + "*" + temp[1]);
                //    if (res == 2) {
                //        map.removeOverlay(this);
                //    }
                //    else if (res == 1) {
                //        alert("删除失败！");
                //    }
                //    else {
                //        alert("当前小药箱创建者非本人，无法删除！");
                //    }
                //}
                setTimeout("$('#addBoxModal').modal('hide')", 10);
                //ev.stopPropagation();
            });
        }


        ////-------------------------------------------------------------------------------------------------------------
        //var baonew1 = new BMap.Icon("img/xyx" + tempboxcolor + "s.png", new BMap.Size(16, 14));
        //var markerbao = new BMap.Marker(new BMap.Point(tempE.point.lng, tempE.point.lat), { icon: baonew1 });
        //markerbao.setTitle(addBoxName);
        //map.addOverlay(markerbao);
        ////blueboxlist
        //if (tempboxcolor == "blue") {
        //    blueboxlist.push(markerbao);
        //}
        //else if (tempboxcolor == "red") {
        //    redboxlist.push(markerbao);
        //}
        //else if (tempboxcolor == "green") {
        //    greenboxlist.push(markerbao);
        //}
        //else if (tempboxcolor == "pink") {
        //    pinkboxlist.push(markerbao);
        //}
        //else if (tempboxcolor == "orange") {
        //    orangeboxlist.push(markerbao);
        //}
        ////boxMarkerList.push(markerbao);

        //markerbao.customData = {
        //    boxlng: tempE.point.lng, boxlat: tempE.point.lat
        //};

        ////var baonew1 = new BMap.Icon("img/baonew.png", new BMap.Size(32, 20));
        ////var markerbao = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat), { icon: baonew1 });
        ////map.addOverlay(markerbao);
        //addBox(tempE.point.lng + "*" + tempE.point.lat, userName, addBoxName, tempboxcolor);
        ////e.stopPropagation();     

        //markerbao.addEventListener("click", function (ev) {

        //    if (confirm("您确定要删除此小药箱吗？")) {
        //        subBox(ev.target.customData.boxlng + "*" + ev.target.customData.boxlat);
        //        map.removeOverlay(this);
        //        //ev.stopPropagation();
        //    }
        //    //$("#cancelBtn").click();
        //    //ev.stopPropagation();
        //    //$("#addBoxModal").modal("hide");
        //    setTimeout("$('#addBoxModal').modal('hide')", 10);
        //});
        ////-------------------------------------------------------------------------------------------------------------
        $("#addBoxModal").modal("hide");
        //修改成功后，再次加载八种颜色的小药箱
        $("#red").prop("checked", "checked");
        $("#blue").prop("checked", "checked");
        $("#green").prop("checked", "checked");
        $("#pink").prop("checked", "checked");
        $("#orange").prop("checked", "checked");
        $("#white").prop("checked", "checked");
        $("#yellow").prop("checked", "checked");
        $("#purple").prop("checked", "checked");
        getallmbbyusername(userName, "blue");
        getallmbbyusername(userName, "red");
        getallmbbyusername(userName, "green");
        getallmbbyusername(userName, "pink");
        getallmbbyusername(userName, "orange");
        getallmbbyusername(userName, "white");
        getallmbbyusername(userName, "yellow");
        getallmbbyusername(userName, "purple");
        loaddata(imei);


        alert("成功增加小药箱！");
        //ev.stopPropagation();
        //eee.stopPropagation();
        //$("#addBoxModal").modal("hide");
    });
        //--------------------supplyMB click----------------------------------------------------
    $("#supplyMB").on('click', function () {
        $("#supplyBoxModal").modal("show");
    });

    $("#startTrack").on('click', function () {
        $("#popModal").modal("show");
    });

    $("#endTrack").on('click', function () {
        $("#popModaltwo").modal("show");
    });
        //-----------------supplyBtn click-------------------------------------------------------
    $("#supplyBtn").on('click', function () {
        var supplyBoxName = $("#supplyBoxName").val();

        var supplyBoxlngdu = $("#supplyBoxlngdu").val();
        var supplyBoxlngfen = $("#supplyBoxlngfen").val();
        var supplyBoxlngmiao = $("#supplyBoxlngmiao").val();

        var supplyBoxlatdu = $("#supplyBoxlatdu").val();
        var supplyBoxlatfen = $("#supplyBoxlatfen").val();
        var supplyBoxlatmiao = $("#supplyBoxlatmiao").val();

        if (supplyBoxName == "") {
            alert("请将小药箱的名字填写完整！");
            return;
        }
        //-------------------------经度信息--------------------------------------------------------------------
        if (supplyBoxlngdu == "" || supplyBoxlngfen == "" || supplyBoxlngmiao == "") {
            alert("请输入正确的经度信息或数据格式！");
            return;
        }
        if (isNaN(parseFloat(supplyBoxlngdu))) {
            alert("请输入正确的经度信息或数据格式！");
            return;
        }
        if (isNaN(parseFloat(supplyBoxlngfen))) {
            alert("请输入正确的经度信息或数据格式！");
            return;
        }
        if (isNaN(parseFloat(supplyBoxlngmiao))) {
            alert("请输入正确的经度信息或数据格式！");
            return;
        }
        //---------------------维度信息------------------------------------------------------------------------
        if (supplyBoxlatdu == "" || supplyBoxlatfen == "" || supplyBoxlatmiao == "") {
            alert("请输入正确的维度信息或数据格式！");
            return;
        }
        if (isNaN(parseFloat(supplyBoxlatdu))) {
            alert("请输入正确的维度信息或数据格式！");
            return;
        }
        if (isNaN(parseFloat(supplyBoxlatfen))) {
            alert("请输入正确的维度信息或数据格式！");
            return;
        }
        if (isNaN(parseFloat(supplyBoxlatmiao))) {
            alert("请输入正确的维度信息或数据格式！");
            return;
        }
        //----------------------------将经纬度度分秒转换为度-----------------------------------------------------------------
        var supplyBoxlng = parseFloat(supplyBoxlngmiao) / 3600.0 + parseFloat(supplyBoxlngfen) / 60.0 + parseFloat(supplyBoxlngdu);
        var supplyBoxlat = parseFloat(supplyBoxlatmiao) / 3600.0 + parseFloat(supplyBoxlatfen) / 60.0 + parseFloat(supplyBoxlatdu);

        //alert(supplyBoxlng);
        //alert(supplyBoxlat);
        //return;
        //---------------------------------------------------------------------------------------------
        //---------------------------------------------------------------------------------------------

        //---------------------------------------------------------------------------------------------
        var boxcolorcheckedlist = [];
        if ($("#supplyblue").prop("checked")) {
            boxcolorcheckedlist.push("blue");
        }
        if ($("#supplyred").prop("checked")) {
            boxcolorcheckedlist.push("red");
        }
        if ($("#supplygreen").prop("checked")) {
            boxcolorcheckedlist.push("green");
        }
        if ($("#supplypink").prop("checked")) {
            boxcolorcheckedlist.push("pink");
        }
        if ($("#supplyorange").prop("checked")) {
            boxcolorcheckedlist.push("orange");
        }
        if ($("#supplywhite").prop("checked")) {
            boxcolorcheckedlist.push("white");
        }
        if ($("#supplyyellow").prop("checked")) {
            boxcolorcheckedlist.push("yellow");
        }
        if ($("#supplypurple").prop("checked")) {
            boxcolorcheckedlist.push("purple");
        }
        if (boxcolorcheckedlist.length == 0) {
            alert("小药箱的标签至少选择一个！");
            return;
        }
        for (var i = 0; i < boxcolorcheckedlist.length; i++) {
            tempboxcolor = boxcolorcheckedlist[i];
            var baonew1 = new BMap.Icon("img/xyx" + tempboxcolor + "s.png", new BMap.Size(16, 14));
           
            var markerbao = new BMap.Marker(new BMap.Point(supplyBoxlng, supplyBoxlat), { icon: baonew1 });

            markerbao.setTitle(supplyBoxName);
            map.addOverlay(markerbao);
            //blueboxlist
            if (tempboxcolor == "blue") {
                blueboxlist.push(markerbao);
            }
            else if (tempboxcolor == "red") {
                redboxlist.push(markerbao);
            }
            else if (tempboxcolor == "green") {
                greenboxlist.push(markerbao);
            }
            else if (tempboxcolor == "pink") {
                pinkboxlist.push(markerbao);
            }
            else if (tempboxcolor == "orange") {
                orangeboxlist.push(markerbao);
            }
            else if (tempboxcolor == "white") {
                whiteboxlist.push(markerbao);
            }
            else if (tempboxcolor == "yellow") {
                yellowboxlist.push(markerbao);
            }
            else if (tempboxcolor == "purple") {
                purpleboxlist.push(markerbao);
            }
            //boxMarkerList.push(markerbao);

            markerbao.customData = {
                boxlng: supplyBoxlng, boxlat: supplyBoxlat
            };

            //var baonew1 = new BMap.Icon("img/baonew.png", new BMap.Size(32, 20));
            //var markerbao = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat), { icon: baonew1 });
            //map.addOverlay(markerbao);
            //addBox(tempE.point.lng + "*" + tempE.point.lat, userName, addBoxName, tempboxcolor);
            addBox(supplyBoxlng + "*" + supplyBoxlat, userName, supplyBoxName, tempboxcolor);
            //e.stopPropagation();   

            //markerbao.addEventListener("click", function (ev) {

            //    if (confirm("您确定要删除名字为'" + addBoxName + "'的小药箱吗？")) {
            //        var res = subBox(ev.target.customData.boxlng + "*" + ev.target.customData.boxlat);
            //        //console.log(typeof (res));
            //        //console.log(res);
            //        if (res == 2) {
            //            map.removeOverlay(this);
            //        }
            //        else if(res == 1) {
            //            alert("删除失败！");
            //        }
            //        else{
            //            alert("当前小药箱创建者非本人，无法删除！");
            //        }
            //        //ev.stopPropagation();
            //    }
            //    //$("#cancelBtn").click();
            //    //ev.stopPropagation();
            //    //$("#addBoxModal").modal("hide");
            //    setTimeout("$('#addBoxModal').modal('hide')", 10);
            //});
            markerbao.addEventListener("click", function (ev) {
                //将小药箱的名称和标签信息填进去
                $("#editBoxName").val(supplyBoxName);
                $("#hiddenlnglat").val(supplyBoxlng + "*" + supplyBoxlat);
                var tempcolor = colorListbyLatlngUsernameBoxname(supplyBoxlng + "*" + supplyBoxlat, userName, supplyBoxName);
                //console.log(tempcolor);
                var tempcolorlist = tempcolor.split("*");
                //console.log(tempcolorlist);
                $("#editred").prop("checked", "");
                $("#editgreen").prop("checked", "");
                $("#editblue").prop("checked", "");
                $("#editpink").prop("checked", "");
                $("#editorange").prop("checked", "");
                $("#editwhite").prop("checked", "");
                $("#editpurple").prop("checked", "");
                $("#edityellow").prop("checked", "");
                for (var i = 0; i < tempcolorlist.length; i++) {
                    if (tempcolorlist[i] != "") {
                        if (tempcolorlist[i] == "red") { $("#editred").prop("checked", "checked"); }
                        if (tempcolorlist[i] == "green") { $("#editgreen").prop("checked", "checked"); }
                        if (tempcolorlist[i] == "blue") { $("#editblue").prop("checked", "checked"); }
                        if (tempcolorlist[i] == "pink") { $("#editpink").prop("checked", "checked"); }
                        if (tempcolorlist[i] == "orange") { $("#editorange").prop("checked", "checked"); }
                        if (tempcolorlist[i] == "white") { $("#editwhite").prop("checked", "checked"); }
                        if (tempcolorlist[i] == "purple") { $("#editpurple").prop("checked", "checked"); }
                        if (tempcolorlist[i] == "yellow") { $("#edityellow").prop("checked", "checked"); }
                    }
                }
                $("#editBoxModal").modal("show");
                //if (confirm("您确定要删除名字为'" + boxName + "'的小药箱吗？")) {
                //    var res = subBox(temp[0] + "*" + temp[1]);
                //    if (res == 2) {
                //        map.removeOverlay(this);
                //    }
                //    else if (res == 1) {
                //        alert("删除失败！");
                //    }
                //    else {
                //        alert("当前小药箱创建者非本人，无法删除！");
                //    }
                //}
                setTimeout("$('#supplyBoxModal').modal('hide')", 10);
                //ev.stopPropagation();
            });
        }












        $("#supplyBoxModal").modal("hide");
        //修改成功后，再次加载八种颜色的小药箱
        $("#red").prop("checked", "checked");
        $("#blue").prop("checked", "checked");
        $("#green").prop("checked", "checked");
        $("#pink").prop("checked", "checked");
        $("#orange").prop("checked", "checked");
        $("#white").prop("checked", "checked");
        $("#yellow").prop("checked", "checked");
        $("#purple").prop("checked", "checked");
        getallmbbyusername(userName, "blue");
        getallmbbyusername(userName, "red");
        getallmbbyusername(userName, "green");
        getallmbbyusername(userName, "pink");
        getallmbbyusername(userName, "orange");
        getallmbbyusername(userName, "white");
        getallmbbyusername(userName, "yellow");
        getallmbbyusername(userName, "purple");
        loaddata(imei);
        alert("成功补录小药箱！");
    });
        //------------------------------------------------------------------------
        //------------------------------------------------------------------------
    

    //var userName = $("#welcome").text().split(':')[1];
        //-------------------提取登录用户名，根据用户名得到标记的小药箱----------------------------------------------------------
    //var fullName1 = $("#welcome").text().split(":")[1];
    //var userName = fullName1.split("]")[0];
    //getallmbbyusername(userName, "allcolors");
     //---------------------------加载车辆列表--------------------------------------------------------
   
    //---------------------------根据车牌号码加载最新位置经纬度坐标--------------------------------------------------------


    //--------------------------------------11家医院marker-----------------------------------------------
    //var hospital = new BMap.Icon("img/hospitalnew.png", new BMap.Size(25, 25));
    var hospital = new BMap.Icon("img/hospitalnews.png", new BMap.Size(20, 20));


    //新巴尔虎左旗人民政府 118.276559,48.223876
    var h1 = new BMap.Marker(new BMap.Point(118.276559, 48.223876), { icon: hospital });
    map.addOverlay(h1);
    h1.setTitle("新巴尔虎左旗人民政府");
    h1.addEventListener("click", hospitalClick);

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
    var h3 = new BMap.Marker(new BMap.Point(118.405940, 48.814551), { icon: hospital });
    map.addOverlay(h3);
    h3.addEventListener("click", hospitalClick);
    h3.setTitle("善都卫生院");

    //罕达盖苏木卫生院    119.446551,47.470373
    var h4 = new BMap.Marker(new BMap.Point(119.446551, 47.470373), { icon: hospital });
    map.addOverlay(h4);
    h4.addEventListener("click", hospitalClick);
    h4.setTitle("罕达盖苏木卫生院");

    //巴日图卫生院   119.484789,47.842308
    var h5 = new BMap.Marker(new BMap.Point(119.484789, 47.842308), { icon: hospital });
    map.addOverlay(h5);
    h5.addEventListener("click", hospitalClick);
    h5.setTitle("巴日图卫生院");

    //甘珠尔苏木坤都伦卫生院 117.817986,48.073333
    var h6 = new BMap.Marker(new BMap.Point(117.817986, 48.073333), { icon: hospital });
    map.addOverlay(h6);
    h6.addEventListener("click", hospitalClick);
    h6.setTitle("甘珠尔苏木坤都伦卫生院");

    //呼吉日诺尔   118.587308,48.318963
    var h7 = new BMap.Marker(new BMap.Point(118.587308, 48.318963), { icon: hospital });
    map.addOverlay(h7);
    h7.addEventListener("click", hospitalClick);
    h7.setTitle("呼吉日诺尔");

    //新宝力格苏木中心卫生院  118.244368,48.482403
    var h8 = new BMap.Marker(new BMap.Point(118.244368, 48.482403), { icon: hospital });
    map.addOverlay(h8);
    h8.addEventListener("click", hospitalClick);
    h8.setTitle("新宝力格苏木中心卫生院");

    //吉布胡郎图苏木卫生院   117.774274,48.971426
    var h9 = new BMap.Marker(new BMap.Point(117.774274, 48.971426), { icon: hospital });
    map.addOverlay(h9);
    h9.addEventListener("click", hospitalClick);
    h9.setTitle("吉布胡郎图苏木卫生院");

    //乌布尔宝力格苏木中心卫生院   119.484864,47.84237   
    var h10 = new BMap.Marker(new BMap.Point(119.057931, 48.075818), { icon: hospital });//119.484864,47.84237
    map.addOverlay(h10);
    h10.addEventListener("click", hospitalClick);
    h10.setTitle("乌布尔宝力格苏木中心卫生院");

    //嵯岗镇中心卫生院  118.109420,49.263761
    var h11 = new BMap.Marker(new BMap.Point(118.109420, 49.263761), { icon: hospital });
    map.addOverlay(h11);
    h11.addEventListener("click", hospitalClick);
    h11.setTitle("嵯岗镇中心卫生院");

    //锡林社区卫生服务中心  118.252051,48.214831
    var h12 = new BMap.Marker(new BMap.Point(118.252051, 48.214831), { icon: hospital });
    map.addOverlay(h12);
    h12.addEventListener("click", hospitalClick);
    h12.setTitle("锡林社区卫生服务中心");
    //----------------------医院marker点击事件---------------------------------------------------------------
    function hospitalClick(e) {

        var p = this.getPosition();       //获取marker的位置

        var opts = {
            width: 200,     // 信息窗口宽度
            height: 40,     // 信息窗口高度
            title: "地点 : " + this.getTitle(), // 信息窗口标题
        }
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
        var infoWindow = new BMap.InfoWindow("北纬 : " + p.lat + "<br/>东经: " + p.lng, opts);
        map.openInfoWindow(infoWindow, p);
    }
    //-------------------------------实时定位30秒钟更新一下------------------------------------------------------
    //moveToNewCenter();
    //setInterval(moveToNewCenter, 60000);
        //moveToNewCenter();
    setInterval(loaddata, 60000, imei);
   
        //--------------addBox---------------------------------------------------------------------
    function addBox(lnglat, userName,boxName,boxColor) {
        var editinfor = {
            "action": "add",
            "lnglat": lnglat,
            "userName": userName,
            "boxName": boxName,
            "color": boxColor

        };
        //console.log(editinfor);
        $.ajax({
            type: "POST",
            //contentType: "application/json;charset=UTF-8",
            url: "h5marker.ashx",
            //url: "outset_sip.ashx",
            data: editinfor,
            //data: JSON.stringify(addinfor),
            dataType: "json",

            
            success: function (data) {             
               

            },
            error: function (jqXHR, textStatus, errorThrown) {
                if (jqXHR.status == 200) {
                   
                }
                else {
                    //alert("error");
                }
            }

        });

    }
        //--------------subBox---------------------------------------------------------------------
    function subBox(lnglat) {
        var editinfor = {
            "action": "sub",
            "lnglat": lnglat,
            "userName": userName

        };
        var resulttemp;
        //console.log(editinfor);
        $.ajax({
            type: "POST",
            //contentType: "application/json;charset=UTF-8",
            url: "h5marker.ashx",
            async:false,
            //url: "outset_sip.ashx",
            data: editinfor,
            //data: JSON.stringify(addinfor),
            dataType: "json",


            success: function (data) {
                if (data["err_message"]) {
                    //console.log("0");
                    //alert("当前小药箱创建者非本人，无法删除！");
                    resulttemp = 0;
                    //return 0;
                }
                   
                else if (data["err_failure"]) {
                    //console.log("1");
                    resulttemp = 1;
                    //console.log("success");
                }
                else {
                    //console.log("2");
                    resulttemp = 2;
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                if (jqXHR.status == 200) {
                    //console.log("200");
                    //删除成功后，代码来到这里
                    //alert("当前小药箱成功删除！");
                    //return true;
                }
                else {
                    //console.log("error");
                    //alert("error");
                }
            }

        });
        return resulttemp;
    }
        //------------------editBox-----------------------------------------------------------------
    function editBox(lnglat, userName, boxName, boxColorlist) {
        var editinfor = {
            "action": "edit",
            "lnglat": lnglat,
            "userName": userName,
            "boxName": boxName,
            "colorlist": boxColorlist

        };
        var resulttemp;
        //console.log(editinfor);
        $.ajax({
            type: "POST",
            async: false,
            //contentType: "application/json;charset=UTF-8",
            url: "h5marker.ashx",
            //url: "outset_sip.ashx",
            data: editinfor,
            //data: JSON.stringify(addinfor),
            dataType: "json",


            success: function (data) {
                if (data["err_message"]) {
                    console.log("0-------------------");
                    //alert("当前小药箱创建者非本人，无法删除！");
                    resulttemp = 0;
                    //return 0;
                }
                else {
                    console.log("2---------------");
                    resulttemp = 2;
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                if (jqXHR.status == 200) {

                }
                else {
                    //alert("error");
                }
            }

        });
        return resulttemp;

    }
    //-----------------------------------------------------------------------------------
    //-----------------------------------------------------------------------------------
    //-----------------------------------------------------------------------------------
    //var geolocation = new BMapGL.Geolocation();
    ////geolocation.enableSDKLocation();
    //geolocation.getCurrentPosition(function (r) {
    //    //alert(this.getStatus());
    //    alert(r.point.lng);//117.02496707
    //    alert(r.point.lat);//36.68278473
    //    if (this.getStatus() == 0) {
    //        var mk = new BMapGL.Marker(r.point);
    //        map.addOverlay(mk);
    //        map.panTo(r.point);
    //        alert('您的old位置：' + r.point.lng + ',' + r.point.lat);
    //        //经纬度坐标转换---------------------------------------------------------
    //        translateCallback = function (data) {
    //            if (data.status === 0) {
    //                alert(data.points[0].lng);//117.03740975676823
    //                alert(data.points[0].lat);//36.68911221766504
    //                alert('您的new位置：' + data.points[0].lng + ',' + data.points[0].lat);
    //                var marker = new BMapGL.Marker(data.points[0]);
    //                map.addOverlay(marker);
    //                //var label = new BMapGL.Label("转换后的百度坐标（正确）", { offset: new BMapGL.Size(10, -10) });
    //                //marker.setLabel(label); //添加百度label
    //                //bm.setCenter(data.points[0]);
    //            }
    //        }
    //        setTimeout(function () {
    //            var convertor = new BMapGL.Convertor();
    //            var pointArr = [];
    //            pointArr.push(r.point);
    //            convertor.translate(pointArr, 1, 5, translateCallback)
    //        }, 1000);
    //        //---------------------------------------------------------------------       
    //    }
    //    else {
    //        alert('failed' + this.getStatus());
    //    }
    //}, { enableHighAccuracy: true })
    //-----------------------------------------------------------------------------------
</script>
  
</body>
</html>
