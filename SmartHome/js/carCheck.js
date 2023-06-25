$(function () {
    //--------------------------------------------------------------------------------------------------------------------
    function setmydatatable() {
        $("#mydatatable").dataTable({
            "sPaginationType": "full_numbers",
            "bInfo": false,
            "bPaginate": true,
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
    //--------------------------------------------------------------------------------------------------------------------
    loaddata();
    //--------------------------------------------------------------------------------------------------------------------
    
    //--------------------------------------------------------------------------------------------------------------------
    function loaddata() {
        $('#loadDataModal').modal({
            backdrop: false,
            keyboard: false,
            show: true,

        });
        $.ajax({
            type: "post",                          //提交方式
            url: "carCheck.ashx",        //一般处理程序的路径
            data: { name: "rtu2mms" },           //向后台传入的值
            dataType: "html",                       //返回值格式
            success: function (data) {
                $("#rtu2mms").empty();
                $('#mydatatable').dataTable().fnClearTable();
                $("#rtu2mms").append(data);
                setmydatatable();



            },
            complete: function (XMLHttpRequest, textStatus) {
                $('#loadDataModal').modal('hide');

            },


        });

    };
    //--------------------------------------------------------------------------------------------------------------------
    var loginUser = $("#loginuser").text().split("：")[1];
    function bossUserByPlateNumber(imei) {
        if (imei == "蒙E9390B") {
            return "xlsq022";
        }
        else if (imei == "蒙E7560P") {
            return "trg008";
        }
        else if (imei == "蒙EFQ920") {
            return "sd003";
        }
        else if (imei == "蒙E1759P") {
            return "xbl011";
        }
        else if (imei == "鲁A66666") {
            return "sa";
        }
        else if (imei == "蒙E0373F") {
            return "bytl001";
        }
        else if (imei == "蒙E1795P") {
            return "cg001";
        }
        else if (imei == "蒙E2338M") {
            return "hdg001";
        }
        else if (imei == "蒙E2809N") {
            return "jsm001";
        }
        else if (imei == "蒙E2750N") {
            return "brt";
        }
        else if (imei == "蒙EHD909") {
            return "wsm001";
        }
        else {
            return "user1";
        }
    }
    //-----------------------------------click event---------------------------------------------------------//
    $("table").on('click', "button", function () {        
        if ($(this).text() == "通过") {
            //权限判断
            var carplatenumber = $(this).parent().parent().children().eq(3).text();
            //alert(carplatenumber);
            //console.log(carplatenumber);
            //console.log(loginUser);
            if (loginUser != "sa") {
                if (loginUser != bossUserByPlateNumber(carplatenumber)) {
                    alert("您的操作权限不够，请切换用户名重新登录！");
                    return;
                }            
                
            }

            var nameObj = $(this).parent().parent().children().eq(0);
            

            //alert(nameObj.text());
            var delinfor = {
                "action": "pass",
                "name": nameObj.text(),
                "loginUser":loginUser
            };

            $.ajax({
                type: "POST",
                //contentType: "application/json;charset=UTF-8",
                url: "carCheck.ashx",
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
                        $('#jinggaomodel').text('您的操作权限不够，请切换用户名重新登录！');
                        $('#myModal').modal({
                            backdrop: false,
                            keyboard: false,
                            show: true

                        });
                        setTimeout("$('#myModal').modal('hide')", 1000);
                    }
                    else {
                        loaddata();
                        $('#jinggaomodel').text('用车审批已经成功提交通过！');
                        $('#myModal').modal({
                            backdrop: false,
                            keyboard: false,
                            show: true

                        });
                        setTimeout("$('#myModal').modal('hide')", 1000);
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

        }
        else if ($(this).text() == "拒绝") {
            //权限判断
            //权限判断
            var carplatenumber = $(this).parent().parent().children().eq(3).text();
            //alert(carplatenumber);
            //console.log(carplatenumber);
            //console.log(loginUser);
            if (loginUser != "sa") {
                if (loginUser != bossUserByPlateNumber(carplatenumber)) {
                    alert("您的操作权限不够，请切换用户名重新登录！");
                    return;
                }

            }


            var nameObj = $(this).parent().parent().children().eq(0);
            //alert(nameObj.text());
            var delinfor = {
                "action": "reject",
                "name": nameObj.text(),
                "loginUser": loginUser
            };

            $.ajax({
                type: "POST",
                //contentType: "application/json;charset=UTF-8",
                url: "carCheck.ashx",
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
                        $('#jinggaomodel').text('您的操作权限不够，请切换用户名重新登录！');
                        $('#myModal').modal({
                            backdrop: false,
                            keyboard: false,
                            show: true

                        });
                        setTimeout("$('#myModal').modal('hide')", 1000);
                    }
                    else {
                        loaddata();
                        $('#jinggaomodel').text('用车审批已经成功提交通过！');
                        $('#myModal').modal({
                            backdrop: false,
                            keyboard: false,
                            show: true

                        });
                        setTimeout("$('#myModal').modal('hide')", 1000);
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
            
        }
    });
    //------------------------------------------------------------------------------------------------------//
    //--------------------------------------------------------------------------------------------------------------------

    //--------------------------------------------------------------------------------------------------------------------
    //--------------------------------------------------------------------------------------------------------------------

    //--------------------------------------------------------------------------------------------------------------------
    //--------------------------------------------------------------------------------------------------------------------


    //--------------------------------------------------------------------------------------------------------------------
});