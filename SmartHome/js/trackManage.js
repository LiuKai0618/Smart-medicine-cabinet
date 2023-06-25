$(function () {
   
    function setmydatatable() {

        //$('#mydatatable').dataTable().fnClearTable();   //将数据清除
        $("#mydatatable").dataTable({
            "sPaginationType": "full_numbers",
            "bInfo": false,
            "bPaginate": true,

            //                "columnDefs": [
            //{ "orderSequence": [ "desc" ], "targets": [ 11 ] }
            //                ],
            //"dom": 'iCflrtp',
            //"order": [[2, "desc"]],
            //"ordering"  :true,
            //"bRetrieve": false,
            "bDestroy": true,
            "bJQueryUI": true,
            "bAutoWidth": true,

            "oLanguage": { //国际化配置  
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

    };
    loaddata();
    function loaddata() {
        $('#loadDataModal').modal({
            backdrop: false,
            keyboard: false,
            show: true,

        });
        //加载表格数据
        //$("#station").empty();

        $.ajax({
            type: "post",                          //提交方式
            url: "trackManage.ashx",        //一般处理程序的路径
            //data: { name: "rtuid" },                    //向后台传入的值
            //data: { name: "25350500000" },
            //data: { name: rtuid },
            data: { action: "trackInfor" },
            dataType: "html",                       //返回值格式
            success: function (data) {
                //var rows="<tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td>11</td><td>12</td><td>13</td><td>14</td></tr>";
                //$("#rtu2mms").append(rows);
                //$("#rtu2mms").empty();
                //$('#mydatatable').dataTable().fnClearTable();   //将数据清除  
                //$("#station").empty();
                //setmydatatable();
                //$('#mydatatable').dataTable().fnClearTable();   //将数据清除
                $("#station").empty();
                $('#mydatatable').dataTable().fnClearTable();
                $("#station").append(data);
                setmydatatable();



            },
            complete: function (XMLHttpRequest, textStatus) {
                $('#loadDataModal').modal('hide');

            },


        });

    };
    //-----------------------------------------------------------------------------------------------------------------------------//
    //$.fn.modal.Constructor.prototype.enforceFocus = function () { };
    //$("#editDepID").select2({
    //    dropdownParent: $("#test111"),

    //});
    //-----------------------------------------------------------------------------------------------------//
    var delEditButton;
    //-----------------------------------click event---------------------------------------------------------//
    $("table").on('click', "button", function () {
        //delete or edit
        //alert($(this).text());
        if ($(this).text() == "修改") {
            var loginusername = $(this).parent().parent().children(":nth-child(4)").text();
            var usernametemp = $("#loginuser").text();
            if (usernametemp.indexOf("管理") == -1) {
                if (usernametemp.split("：")[1] != loginusername) {
                    alert("您不是管理员或者创建者本人，无权修改！");
                    return;
                }
            }


            var trObj = $(this).parent().parent();

            $("#editPlateNumber").val(trObj.children(":nth-child(1)").text());
            $("#editStartTime").val(trObj.children(":nth-child(2)").text());
            $("#editEndTime").val(trObj.children(":nth-child(3)").text());
            $("#editUserName").val(trObj.children(":nth-child(4)").text());
            $("#editTrackName").val(trObj.children(":nth-child(5)").text());


            $.uniform.update();


            $("#editTrackModal").modal();
        }
        else if ($(this).text() == "删除") {
            //是否为超级管理员或管理员或者用户本人，否则无删除权限
            var loginusername = $(this).parent().parent().children(":nth-child(4)").text();
            var usernametemp = $("#loginuser").text();
            if (usernametemp.indexOf("管理") != -1 || usernametemp.split("：")[1] == loginusername) {
                delEditButton = $(this);
                $("#deleteTrackModal").modal();
            }
            else {
                alert("您不是管理员或者创建者本人，无权删除！");
            }
        }
    });
    //------------------------------------------------------------------------------------------------------//
    //-----------------------------------edit save---------------------------------------------------------//
    $("#saveEdit").click(function () {
        var trackName = $("#editTrackName").val();

        if (trackName == "") {
            alert("请将车辆轨迹名称填写完整！");
            return;
        }
        //下面的代码ajax修改的用户json数据
        //plateNumber, startTime, endTime, userName, trackName
        var editinfor = {
            "action": "editTrack",
            "plateNumber": $("#editPlateNumber").val(),
            "startTime": $("#editStartTime").val(),
            "endTime": $("#editEndTime").val(),
            "userName": $("#editUserName").val(),
            "trackName": trackName
        };
        //console.log(editinfor);
        $.ajax({
            type: "POST",
            //contentType: "application/json;charset=UTF-8",
            url: "trackManage.ashx",
            //url: "outset_sip.ashx",
            data: editinfor,
            //data: JSON.stringify(addinfor),
            dataType: "json",


            success: function (data) {
                if (data["err_message"]) {
                    if (data["err_message"] == "editFailure") {
                        $('#jinggaomodel').text('修改失败，请重新修改！');
                        $('#myModal').modal({
                            backdrop: false,
                            keyboard: false,
                            show: true

                        });
                        setTimeout("$('#myModal').modal('hide')", 1000);
                    }
                }
                else {
                    //console.log(addinfor);
                    //loadSIPList(1, countPerPage);
                    loaddata();
                    $('#jinggaomodel').text('车辆轨迹信息已经成功修改！');
                    $('#myModal').modal({
                        backdrop: false,
                        keyboard: false,
                        show: true

                    });
                    setTimeout("$('#myModal').modal('hide')", 1000);
                    $("#editTrackModal").modal("hide");
                }
                //if (data.err_message) {
                //    alert(data.err_message);
                //}
                //else {
                //    loadSIPList(1, countPerPage);
                //    //console.log(editinfor);
                //    $('#jinggaomodel').text('SIP信息已经成功修改！');
                //    $('#myModal').modal({
                //        backdrop: false,
                //        keyboard: false,
                //        show: true
                //    });
                //    setTimeout("$('#myModal').modal('hide')", 1000);
                //    $("#editSIPModal").modal("hide");
                //}


            },
            error: function (jqXHR, textStatus, errorThrown) {
                if (jqXHR.status == 200) {
                    //console.log(editinfor);
                    //loadSIPList(1, countPerPage);
                    //$('#jinggaomodel').text('SIP信息已经成功修改！');
                    //$('#myModal').modal({
                    //    backdrop: false,
                    //    keyboard: false,
                    //    show: true
                    //});
                    //setTimeout("$('#myModal').modal('hide')", 1000);
                    //$("#editSIPModal").modal("hide");
                }
                else {
                    //alert("error");
                }
            }

        });


    });
    //------------------------------------------------------------------------------------------------------//
    //-----------------------------------delete save---------------------------------------------------------//
    $('#SaveDelete').click(function () {
        ////plateNumber, startTime, endTime, userName, trackName
        var deltrObj = delEditButton.parent().parent();
        var plateNumber = deltrObj.children(":nth-child(1)").text();
        var startTime = deltrObj.children(":nth-child(2)").text();
        var endTime = deltrObj.children(":nth-child(3)").text();
        var userName = deltrObj.children(":nth-child(4)").text();
        var trackName = deltrObj.children(":nth-child(5)").text();

        var delinfor = {
            "action": "delTrack",
            "plateNumber": plateNumber,
            "startTime": startTime,
            "endTime": endTime,
            "userName": userName,
            "trackName": trackName
        };

        $.ajax({
            type: "POST",
            //contentType: "application/json;charset=UTF-8",
            url: "trackManage.ashx",
            //url: "outset_sip.ashx",
            data: delinfor,
            //data: JSON.stringify(addinfor),
            dataType: "json",

            //type: "GET",
            //contentType: "application/json;charset=UTF-8",
            //url: "/vpbx.cgi?action=deletesip&id=" + rmSIPid,
            ////url: "outset_sip.ashx?action=deletesip&id=" + rmSIPid,
            //dataType: "json",
            success: function (data) {
                //if (data.err_message) {
                //    alert(data.err_message);
                //}
                //else {
                //    loadSIPList(1, countPerPage);
                //    $('#jinggaomodel').text('SIP信息已经成功删除！');
                //    $('#myModal').modal({
                //        backdrop: false,
                //        keyboard: false,
                //        show: true
                //    });
                //    setTimeout("$('#myModal').modal('hide')", 1000);
                //    $("#deleteSIPModal").modal("hide");
                //}
                if (data["err_message"]) {
                    if (data["err_message"] == "delFailure") {
                        $('#jinggaomodel').text('删除失败，请重新删除！');
                        $('#myModal').modal({
                            backdrop: false,
                            keyboard: false,
                            show: true

                        });
                        setTimeout("$('#myModal').modal('hide')", 1000);
                    }
                }
                else {
                    loaddata();
                    $('#jinggaomodel').text('小药箱信息已经成功删除！');
                    $('#myModal').modal({
                        backdrop: false,
                        keyboard: false,
                        show: true

                    });
                    setTimeout("$('#myModal').modal('hide')", 1000);
                    $("#deleteTrackModal").modal("hide");
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                if (jqXHR.status == 200) {
                    //loadSIPList(1, countPerPage);
                    //$('#jinggaomodel').text('SIP信息已经成功删除！');
                    //$('#myModal').modal({
                    //    backdrop: false,
                    //    keyboard: false,
                    //    show: true
                    //});
                    //setTimeout("$('#myModal').modal('hide')", 1000);
                    //$("#deleteSIPModal").modal("hide");
                }
                else {
                    //alert("error");
                }
            }
        });


    });




});