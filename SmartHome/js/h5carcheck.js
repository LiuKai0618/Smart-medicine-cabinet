$(function () {
    //--------------------------carlist------------------------------------------------------------------------------------------
    $.ajax({
        type: "post",                          //提交方式
        url: "h5carcheck.ashx",        //一般处理程序的路径
        //data: { name: "rtuid" },                    //向后台传入的值
        data: { name: "carList" },
        async: false,
        dataType: "html",                       //返回值格式
        success: function (data) {
            //console.log(data);
            $("#addCarType").append(data);
            //var sel2 = $("#addName").select2();
            //var userName = $("#addName option:first").attr("value");
            //console.log(first);
            //if (userName != "nodata") {
            //    loadUserInfor(userName);
            //    //setmydatatable();
            //    sel2.val(userName).trigger("change");
            //    sel2.change(function () {
            //        //alert(sel2.val());
            //        //$("#mydatatable").dataTable().fnClearTable();
            //        //$("#mydatatable").dataTable().fnDestroy();
            //        //setmydatatable();
            //        //imei = sel2.val();
            //        loadUserInfor(sel2.val());

            //    });
            //}
            //alert(first);
            //setmydatatable();


        },
        complete: function (XMLHttpRequest, textStatus) {
            //$('#myModal').modal('hide');
        },


    });
    //--------------------------------------------------------------------------------------------------------------------
    //-------------------------loadUserInfor 下拉框-----------------------------------------------
    $.ajax({
        type: "post",                          //提交方式
        url: "h5carcheck.ashx",        //一般处理程序的路径
        //data: { name: "rtuid" },                    //向后台传入的值
        data: { name: "userList" },
        dataType: "html",                       //返回值格式
        success: function (data) {
            //console.log(data);
            $("#addName").append(data);
            var sel2 = $("#addName").select();
            var userName = $("#addName option:first").attr("value");
            //console.log(first);
            if (userName != "nodata") {
                loadUserInfor(userName);
                //setmydatatable();
                sel2.val(userName).trigger("change");
                sel2.change(function () {
                    //alert(sel2.val());
                    //$("#mydatatable").dataTable().fnClearTable();
                    //$("#mydatatable").dataTable().fnDestroy();
                    //setmydatatable();
                    //imei = sel2.val();
                    loadUserInfor(sel2.val());

                });
            }
            //alert(first);
            //setmydatatable();


        },
        complete: function (XMLHttpRequest, textStatus) {
            //$('#myModal').modal('hide');
        },


    });
    //-----------------------------loadUserInfor----------------------------------------------------------------------------------
    function loadUserInfor(userName) {
        $.ajax({
            type: "post",                          //提交方式
            url: "h5carcheck.ashx",        //一般处理程序的路径
            data: { name: userName },           //向后台传入的值
            dataType: "text",                       //返回值格式
            //dataType: "json",                       //返回值格式
            success: function (data) {
                if (data.error_key) {
                    return;
                }
                ////ID, name, IDCard, depName, carType, dateTime, fromTo, cellPhone, carState
                var maps = eval("(" + data + ")");//转换为json对象 
                $("#addIDCard").val(maps["IDCard"]);
                $("#addDepName").val(maps["depName"]);
                $("#addCarType").val(maps["carType"]).trigger("change");;

                var now = new Date(maps["dateTime"]);
                //alert(now);//Mon Jan 04 2021 00:00:00 GMT+0800 (中国标准时间)
                //alert(now.getDate()+'-'+now.getMonth());
                //格式化日，如果小于9，前面补0
                var day = ("0" + now.getDate()).slice(-2);
                //格式化月，如果小于9，前面补0
                var month = ("0" + (now.getMonth() + 1)).slice(-2);
                //拼装完整日期格式
                var today = now.getFullYear() + "-" + (month) + "-" + (day);
                //完成赋值
                $('#addDateTime').val(today);

                var fromto = maps["fromTo"].split("-");
                $("#addFrom").val(fromto[0]);
                $("#addTo").val(fromto[1]);

                $("#addCellPhone").val(maps["cellPhone"]);
                $("#addCarState").val(maps["carState"]);

                //if (maps["fromto"] == "-") {
                //    //$("#addCarType").val(maps["cartype"]);
                //    $("#addDateTime").val("");
                //    $("#addFrom").val("");
                //    $("#addTo").val("");
                //}
                //else {
                //    $("#addCarType").val(maps["cartype"]);



                //    //$("#addDateTime").val(maps["cardate"]);
                   
                //}

                //$.each(maps, function (idx, obj) {
                //    var json = JSON.parse(obj);
                //    gpsimeilist.push(new GPSIMEI(json["IMEI"], json["DateTime"], json["Latitude"], json["Longitude"], json["Speed"], json["RealTimeLocation"],
                //                     json["IsLocated"], json["LongitudeEastWest"], json["LatitudeSouthNorth"], json["Direction"], json["ACC"], json["UploadMode"], json["RealTimeOrSupply"]));                                  
                //});


            },
            complete: function (XMLHttpRequest, textStatus) {

            },


        });
    }
    //-------------------------------------------------------------------------------------------------------------------------------------------
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
    //-------------------------------------------------------------------------------------------------------------------------------------------
    var fullName1 = $("#welcome").text().split(":")[1];
    //登录用户名
    var loginUser = fullName1.split("]")[0];
    var carplatenumber = $("#addCarType").val();
    //---------------------通过----------------------------------------------------------------------------------------------------------------------
    $("#saveAdd").on('click', function () {
        //是否为sa或车牌号对应的bossUser一致
        //alert(carplatenumber);
        //console.log(carplatenumber);
        //console.log(loginUser);
        if (loginUser != "sa") {
            if (loginUser != bossUserByPlateNumber(carplatenumber)) {
                alert("您的操作权限不够，请切换用户名重新登录！");
                return;
            }

        }

        var delinfor = {
            "action": "pass",
            "name": $("#addName").select().val(),
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
                    $('#jinggaomodel').text('操作失败，请重新尝试！');
                    $('#myModal').modal({
                        backdrop: false,
                        keyboard: false,
                        show: true

                    });
                    setTimeout("$('#myModal').modal('hide')", 1000);
                }
                else {
                    loadUserInfor($("#addName").select().val());
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
    });
    //------------------------------------------------------------------------
    //---------------------拒绝----------------------------------------------------------------------------------------------------------------------
    $("#cancelAdd").on('click', function () {
        //alert(carplatenumber);
        //console.log(carplatenumber);
        //console.log(loginUser);
        if (loginUser != "sa") {
            if (loginUser != bossUserByPlateNumber(carplatenumber)) {
                alert("您的操作权限不够，请切换用户名重新登录！");
                return;
            }

        }


        var delinfor = {
            "action": "reject",
            "name": $("#addName").select().val(),
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
                    $('#jinggaomodel').text('操作失败，请重新尝试！');
                    $('#myModal').modal({
                        backdrop: false,
                        keyboard: false,
                        show: true

                    });
                    setTimeout("$('#myModal').modal('hide')", 1000);
                }
                else {
                    loadUserInfor($("#addName").select().val());
                    $('#jinggaomodel').text('用车审批已经成功提交！');
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
    });
    //------------------------------------------------------------------------
});