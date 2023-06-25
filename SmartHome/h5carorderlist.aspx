<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="h5carorderlist.aspx.cs" Inherits="SmartHome.h5carorderlist" %>

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
            <li><a href="h5carcheck.aspx">用车审批</a></li>
              <li class="active" ><a href="h5carorderlist.aspx">历史订单</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="container" style="margin-top:60px;">
     <table id="mydatatable" class="table table-condensed">
                    <thead>
                        <tr>                              
                            <th>登录账号</th>
                            <th>申请用户</th>
                            <th>车牌号</th>
                            <th>使用时间</th>
                            <th>起止地点</th>
                            <th>车辆状态</th>
                            <th>操作日期</th>
                            </tr>
                    </thead>
                    <tbody id="rtu2mms"></tbody>
                </table>





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
    <script src="js/h5carorderlist.js"></script>
    <%--<script src="js/h5feetbackdisplayornot.js"></script>--%>
</body>
</html>
