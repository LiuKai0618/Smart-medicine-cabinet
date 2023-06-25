$(function () {
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
    loaddata();
    function loaddata() {
        $('#loadDataModal').modal({
            backdrop: false,
            keyboard: false,
            show: true,

        });
        $.ajax({
            type: "post",                          //提交方式
            url: "carReturn.ashx",        //一般处理程序的路径
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
    //-----------------------------------add button click---------------------------------------------------------//
    $("#addBtn").click(function () {
        //console.log('add');
        //$("#editDepModal").modal('show');
        //$("#editDepModal").modal('hide');
        $("#addCarModal").modal();
        //$("#didAdd").parent().parent().css('display', '');
        //$("#wel_voicemenuAdd").parent().parent().css('display', 'none');
        //$("input:radio[name=access_modeAddOptions][value=2]").prop('checked', 'checked');

    });
    //------------------------------------------------------------------------------------------------------//
    //$('#myModal').modal({
    //    backdrop: false,
    //    keyboard: false,
    //    show: true,
    //});
    //$("#rtu2mms").empty();
    //$.ajax({
    //    type: "post",                          //提交方式
    //    url: "carManage.ashx",        //一般处理程序的路径
    //    data: { name: "rtu2mms" },           //向后台传入的值
    //    dataType: "html",                       //返回值格式
    //    success: function (data) {
    //        $("#rtu2mms").append(data);
    //    },
    //    complete: function (XMLHttpRequest, textStatus) {
    //        $('#myModal').modal('hide');
    //        //set datatable
    //        $("#mydatatable").dataTable({
    //            "sPaginationType": "full_numbers",
    //            "bInfo": false,
    //            "bPaginate": true,
    //            //"dom": 'iCflrtp',
    //            "aoColumnDefs": [{
    //                sDefaultContent: '',
    //                aTargets: ['_all']
    //            }],
    //            "bJQueryUI": true,
    //            "oLanguage": { //国际化配置  
    //                "sProcessing": "正在获取数据，请稍后...",
    //                "sLengthMenu": "显示 _MENU_ 条",
    //                "sZeroRecords": "没有您要搜索的内容",
    //                "sInfo": "从 _START_ 到  _END_ 条记录 总记录数为 _TOTAL_ 条",
    //                "sInfoEmpty": "记录数为0",
    //                "sInfoFiltered": "(全部记录数 _MAX_ 条)",
    //                "sInfoPostFix": "",
    //                "sSearch": "搜索",
    //                "sUrl": "",
    //                "oPaginate": {
    //                    "sFirst": "第一页",
    //                    "sPrevious": "上一页",
    //                    "sNext": "下一页",
    //                    "sLast": "最后一页"
    //                }
    //            },
    //        });
    //    },
    //});

    //--------------------------carlist------------------------------------------------------------------------------------------
    $.ajax({
        type: "post",                          //提交方式
        url: "carReturn.ashx",        //一般处理程序的路径
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
    //--------------------------------------------------------------------------------------------------------------------
    //-------------------------loadUserInfor 下拉框-----------------------------------------------
    $.ajax({
        type: "post",                          //提交方式
        url: "carReturn.ashx",        //一般处理程序的路径
        //data: { name: "rtuid" },                    //向后台传入的值
        data: { name: "userList" },
        dataType: "html",                       //返回值格式
        success: function (data) {
            //console.log(data);
            $("#addName").append(data);
            var sel2 = $("#addName").select2();
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
            url: "carReturn.ashx",        //一般处理程序的路径
            data: { name: userName },           //向后台传入的值
            dataType: "text",                       //返回值格式
            //dataType: "json",                       //返回值格式
            success: function (data) {
                if (data.error_key) {
                    return;
                }
                //public string name { get; set; }
                //public string idcard { get; set; }
                //public string depname { get; set; }
                //public string cellphone { get; set; }
                //public string fromto { get; set; }
                //public string cartype { get; set; }
                //public string cardate { get; set; }
                var maps = eval("(" + data + ")");//转换为json对象 
                ////ID, name, IDCard, depName, carType, dateTime, fromTo, cellPhone, carState
                $("#addIDCard").val(maps["IDCard"]);
                $("#addDepName").val(maps["depName"]);
                $("#addCellPhone").val(maps["cellPhone"]);

                //console.log(maps["cartype"]);
                $("#addCarType").val(maps["carType"]).trigger("change");

                //alert(maps["cardate"]);
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
                $('#addDateTimeStart').val(today);


                //$("#addDateTime").val(maps["cardate"]);
                var fromto = maps["fromTo"].split("-");
                $("#addFrom").val(fromto[0]);
                $("#addTo").val(fromto[1]);
                //if (maps["fromto"] == "-") {
                //    //$("#addCarType").val(maps["cartype"]);
                //    $("#addDateTime").val("");
                //    $("#addFrom").val("");
                //    $("#addTo").val("");
                //}
                //else {
                    
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
    //---------------------saveAdd----------------------------------------------------------------------------------------------------------------------
    $("#saveAdd").on('click', function () {
        //权限判断-------------------------------------------------------------------------
        var carplatenumber = $("#addCarType").val();
        //alert(carplatenumber);
        //console.log(carplatenumber);
        //console.log(loginUser);
        if (loginUser != "sa") {
            if (loginUser != bossUserByPlateNumber(carplatenumber)) {
                alert("您的操作权限不够，请切换用户名重新登录！");
                return;
            }

        }
        //---------------------------------------------------------------------------
        var datetime = $("#addDateTimeEnd").val();
        var fee = $("#addCarFee").val();
        var miles = $("#addCarMiles").val();


        if (datetime == "" || fee == "" || miles == "") {
            alert("请将用车结束日期或车费或行驶里程等信息填写完整！");
            return;
        }
        //下面的代码ajax修改的用户json数据
        var addinfor = {
            //"action": "addPerson",
            "name": "addcm",
            "name1": $("#addName").val(),
            "IDCard": $("#addIDCard").val(),
            "depName": $("#addDepName").val(),
            "carType": $("#addCarType").val(),
            "dateTime": $("#addDateTimeStart").val() + "至" + datetime,
            //"cardate": datetime,
            "fromTo": $("#addFrom").val() + "-" + $("#addTo").val(),
            "cellPhone": $("#addCellPhone").val(),
            //ID, name, IDCard, depName, carType, dateTime, fromTo, cellPhone, cost, runMiles
            "cost": $("#addCarFee").val(),
            "runMiles": $("#addCarMiles").val(),
            "loginUser": loginUser


            //"sex": $("input:radio[name=addSexOptions]:checked").val(),
            //"IDCard": IDCard,
            //"depID": $("#addDepID").val(),
            //"phoneNumber": $("#addPhoneNumber").val(),
            //"jobPosition": $("#addJobPosition").val(),
            //"education": $("#addEducation").val(),
            //"isCertificated": $("input:radio[name=addIsCertificatedOptions]:checked").val(),
            //"registeredResidence": $("#addRegisteredResidence").val()
        };


        $.ajax({
            type: "POST",
            //contentType: "application/json;charset=UTF-8",
            url: "carReturn.ashx",
            //url: "outset_sip.ashx",
            data: addinfor,
            //data: JSON.stringify(addinfor),
            dataType: "json",
            success: function (data) {
                //console.log(data[err_message]);
                //console.log("-------------------------");
                //console.log(data["err_message"]);
                if (data["err_message"]) {
                    $('#jinggaomodel').text('归还登记操作失败，请重新尝试！');
                    $('#myModal').modal({
                        backdrop: false,
                        keyboard: false,
                        show: true

                    });
                    setTimeout("$('#myModal').modal('hide')", 1000);
                }
                else {
                    //console.log(addinfor);
                    //loadSIPList(1, countPerPage);
                    loaddata();
                    $('#jinggaomodel').text('归还登记车辆信息已经成功添加！');
                    $('#myModal').modal({
                        backdrop: false,
                        keyboard: false,
                        show: true

                    });
                    setTimeout("$('#myModal').modal('hide')", 1000);
                    $("#addCarModal").modal("hide");
                }


            },
            error: function (jqXHR, textStatus, errorThrown) {
                if (jqXHR.status == 200) {
                    //loaddata();
                    //$('#jinggaomodel').text('人员信息已经成功添加！');
                    //$('#myModal').modal({
                    //    backdrop: false,
                    //    keyboard: false,
                    //    show: true

                    //});
                    //setTimeout("$('#myModal').modal('hide')", 1000);
                    //$("#addPersonModal").modal("hide");

                    //loadSIPList(1, countPerPage);
                    //$('#jinggaomodel').text('SIP信息已经成功添加！');
                    //$('#myModal').modal({
                    //    backdrop: false,
                    //    keyboard: false,
                    //    show: true

                    //});
                    //setTimeout("$('#myModal').modal('hide')", 1000);
                    //$("#addSIPModal").modal("hide");
                }
                else {
                    //alert("error");
                }

            }

        });

    });
    //------------------------------------------------------------------------
});