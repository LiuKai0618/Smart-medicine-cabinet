<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="h5carcheck.aspx.cs" Inherits="SmartHome.h5carcheck" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />

    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <%--<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>--%>
    <link href="css/bootstrap-3.3.7.min.css?saasd=2" rel="stylesheet" />
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
          <%--<a class="navbar-brand" href="#">用车审批</a>--%>
            <a class="navbar-brand" href="#" id="welcome" runat="server">欢迎您:</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">         
          <ul class="nav navbar-nav navbar-right">
            <li><a href="h5index.aspx">小药箱管理</a></li>
            <li><a href="h5carmanage.aspx">用车申请</a></li>
            <li class="active" id="carcheck"  runat="server"><a href="h5carcheck.aspx">用车审批</a></li>
              <li><a href="h5carorderlist.aspx">历史订单</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="container" style="margin-top:60px;">
    <form class="form-horizontal">

  <%--<div class="form-group">
    <label for="inputEmail3" class="col-xs-2 control-label">Email</label>
    <div class="col-xs-10">
      <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
    </div>
  </div>

  <div class="form-group">
    <label for="inputPassword3" class="col-xs-2 control-label">Password</label>
    <div class="col-xs-10">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
    </div>
  </div>

  <div class="form-group">
    <div class="col-xs-offset-2 col-xs-10">
      <div class="checkbox">
        <label>
          <input type="checkbox"> Remember me
        </label>
      </div>
    </div>
  </div>

  <div class="form-group">
    <div class="col-xs-offset-2 col-xs-10">
      <button type="submit" class="btn btn-default">Sign in</button>
    </div>
  </div>--%>





 <!----------------------------------addName----------------------------------------------------------->  
                                   <div class="form-group">
                                        <label for="addName" class="col-sm-2 control-label">请选择姓名:</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" id="addName">
                                               <%-- <option value="1">1</option>
                                                <option value="2">2</option>--%>
                                            </select>
                                        </div>
                                    </div>
                                    <!----------------------------------addIDCard----------------------------------------------------------> 
                                     <div class="form-group">
                                        <label for="addIDCard" class="col-sm-2 control-label">身份证号:</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="addIDCard" type="text" readonly="readonly"/>
                                        </div>
                                    </div>
                                    <!----------------------------------addDepName----------------------------------------------------------->
                                    <div class="form-group">
                                        <label for="addDepName" class="col-sm-2 control-label">部门名称:</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="addDepName" type="text" readonly="readonly"/>
                                        </div>
                                    </div>
                                    <!-----------------------------------addCarType---------------------------------------------------------->
                                     <div class="form-group">
                                        <label for="addCarType" class="col-sm-2 control-label">车牌号码:</label>
                                        <div class="col-sm-10">
                                             <select class="form-control" id="addCarType" disabled="disabled">
                                               <%-- <option value="越野车" selected="selected">越野车</option>
                                                <option value="轿车">轿车</option>--%>
                                            </select>
                                        </div>
                                    </div>
                                    <!-----------------------------------addDateTime---------------------------------------------------------->
                                     <div class="form-group">
                                        <label for="addDateTime" class="col-sm-2 control-label">用车日期:</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="addDateTime" type="date" readonly="readonly"/>
                                        </div>
                                    </div>
                                    <!------------------------------------addFromTo--------------------------------------------------------->
                                     <div class="form-group">
                                        <label for="addFrom" class="col-sm-2 control-label">起止地点:</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="addFrom" type="text" placeholder="请输入起始地点" readonly="readonly"/>
                                            <input class="form-control" id="addTo" type="text" placeholder="请输入目的地点" readonly="readonly"/>
                                        </div>
                                    </div>
                                    <!-----------------------------------addCellPhone---------------------------------------------------------->
                                    <div class="form-group">
                                        <label for="addCellPhone" class="col-sm-2 control-label">手机号:</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="addCellPhone" type="text" readonly="readonly"/>
                                        </div>
                                    </div>

                                   <div class="form-group">
                                        <label for="addCarState" class="col-sm-2 control-label">车辆状态:</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="addCarState" type="text" readonly="readonly"/>
                                        </div>
                                    </div>

        <div class="form-group">
             <div class="col-sm-offset-2 col-sm-10">
      <button id="cancelAdd" type="button" class="btn btn-danger">拒绝</button>
                 <button id="saveAdd" type="button" class="btn btn-success">通过</button>
    </div>
    
  </div>





</form>
</div>
     <%--<div style="background-color:rebeccapurple;margin-top:50px;">h5carcheck</div>--%>
       <div id="loadDataModal" class="modal fade">
            <div class="modal-dialog modal-sm">
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
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">提示信息</h4>
                    </div>
                    <div class="modal-body">
                        <!--<h4>模态框中的文本</h4>-->
                        <p id="jinggaomodel"></p>
                    </div>
                    <%--<div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" id="modelWarnBtn" class="btn btn-primary">确定</button>
                    </div>--%>
                </div>
            </div>
        </div>

   <%-- <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
     <script src="js/jquery-1.12.4.min.js"></script>
    <script src="js/bootstrap-3.3.7.min.js"></script>
    <script src="js/h5carcheck.js"></script>
    <%--<script src="js/h5feetbackdisplayornot.js"></script>--%>
</body>
</html>
