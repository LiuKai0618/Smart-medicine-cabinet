$(function () { 
    //--------------------------carlist------------------------------------------------------------------------------------------
    $.ajax({
        type: "post",                          //提交方式
        url: "carManage.ashx",        //一般处理程序的路径
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
        url: "carManage.ashx",        //一般处理程序的路径
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
            url: "carManage.ashx",        //一般处理程序的路径
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
                $("#addIDCard").val(maps["idcard"]);
                $("#addDepName").val(maps["depname"]);
                $("#addCellPhone").val(maps["cellphone"]);
                if (maps["fromto"] == "-") {
                    //$("#addCarType").val(maps["cartype"]);
                    //---------------------------将当前日期默认填入--------------------------------------------
                    //var now = new Date().toLocaleDateString();
                    //alert(new Date(now));
                    //alert(now.getDate());
                    //alert(now.get);
                    //now1 = now.replace("/", "-");
                    //now2 = now1.replace("/", "-");
                    //alert(now2);
                    var now = new Date();
                    //alert(now);
                    //$('#addDateTime').val(now);


                    //var now1 = Date.now().toLocaleString();
                    //alert(now1);
                    //return;
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
                    //-----------------------------------------------------------------------

                    //$("#addDateTime").val("");
                    $("#addFrom").val("");
                    $("#addTo").val("");
                    //$("#addCarType ").get(0).selectedIndex = 0;
                }
                else {
                    if (maps["cartype"] == "") {
                        $("#addCarType").get(0).selectedIndex = 0;
                        $("#addCarType").trigger("change");
                        //$("#addCarType").val(maps["cartype"]);
                        //$("#addCarType ").get(0).selectedIndex = 0;
                    }
                    else {
                        $("#addCarType").val(maps["cartype"]).trigger("change");
                    }

                    

                    //alert(maps["cardate"]);
                    //不管当前用户是否之前有过申请记录，默认的申请日期都是当天
                    //var now = new Date(maps["cardate"]);
                    var now = new Date();
                    //alert(now);
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


                    //$("#addDateTime").val(maps["cardate"]);
                    var fromto = maps["fromto"].split("-");
                    $("#addFrom").val(fromto[0]);
                    $("#addTo").val(fromto[1]);
                }

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
    //--------------------------------------------------------------
    var fullName1 = $("#welcome").text().split(":")[1];
    var fullName = fullName1.split("]")[0];
    //alert(fullName);
    //-----------------------------------------------------------
    //---------------------saveAdd----------------------------------------------------------------------------------------------------------------------
    $("#saveAdd").on('click', function () {

        //name, sex, IDCard, depID, phoneNumber, jobPosition, education, isCertificated, registeredResidence
        var datetime = $("#addDateTime").val();
        var from = $("#addFrom").val();
        var to = $("#addTo").val();
        var cartype = $("#addCarType").val();
        //alert(datetime);

        //return;

        if (datetime == "" || from == "" || to == "" || cartype == "") {
            alert("请将用车日期或起止地点或车牌号码等信息填写完整！");
            return;
        }
        //下面的代码ajax修改的用户json数据
        var addinfor = {
            //"action": "addPerson",
            "name": "addcm",
            "name1": $("#addName").val(),
            "idcard": $("#addIDCard").val(),
            "depname": $("#addDepName").val(),
            "cartype": $("#addCarType").val(),
            "cardate": datetime,
            "fromto": from + "-" + to,
            "cellphone": $("#addCellPhone").val(),
            "userName": fullName




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
                    $('#jinggaomodel').text('申请用车失败，请重新尝试！');
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
                    //loaddata();
                    $('#jinggaomodel').text('申请用车信息已经成功添加！');
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