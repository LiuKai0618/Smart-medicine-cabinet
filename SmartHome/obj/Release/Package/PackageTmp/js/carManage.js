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
            url: "carManage.ashx",        //一般处理程序的路径
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
        url: "carManage.ashx",        //一般处理程序的路径
        //data: { name: "rtuid" },                    //向后台传入的值
        data: { name: "carList" },
        async:false,
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
        url: "carManage.ashx",        //一般处理程序的路径
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
                    $("#addDateTime").val("");
                    $("#addFrom").val("");
                    $("#addTo").val("");
                }
                else {

                    if (maps["cartype"] == "") {
                        //$("#addCarType").val(maps["cartype"]);
                        $("#addCarType").get(0).selectedIndex = 0;
                        $("#addCarType").trigger("change");
                    }
                    else {
                        $("#addCarType").val(maps["cartype"]).trigger("change");
                    }
                    //console.log(maps["cartype"]);
                    //$("#addCarType").val(maps["cartype"]).trigger("change");//为什么这里传过来一个“-”
                    //alert("-"+maps["cartype"]+"-");
                    //alert(maps["cardate"]);
                    var now = new Date(maps["cardate"]);
                    //alert(now);//Mon Jan 04 2021 00:00:00 GMT+0800 (中国标准时间)
                    //alert(now.getDate()+'-'+now.getMonth());
                    //格式化日，如果小于9，前面补0
                    var day = ("0" + now.getDate()).slice(-2);
                    //格式化月，如果小于9，前面补0
                    var month = ("0" + (now.getMonth() + 1)).slice(-2);
                    //拼装完整日期格式
                    var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
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
    
    //------------------------------------------------------------------------------------------------------
    var fullName = $("#loginuser").text().split("：");
    //------------------------------------------------------------------------------------------------------
    //---------------------saveAdd----------------------------------------------------------------------------------------------------------------------
    $("#saveAdd").on('click', function () {

        //name, sex, IDCard, depID, phoneNumber, jobPosition, education, isCertificated, registeredResidence
        var datetime = $("#addDateTime").val();
        var from = $("#addFrom").val();
        var to = $("#addTo").val();
        var cartype = $("#addCarType").val();
        //alert(datetime);

        //return;
        
        //alert(ttt[1]);
        //return;
        if (datetime == "" || from == "" || to == "" || cartype == "") {
            alert("请将用车日期或起止地点或车牌号码等信息填写完整！");
            return;
        }
        //alert(datetime);

        //return;

        //if (datetime == "" || from == "" || to == "") {
        //    alert("请将用车日期或起止地点等信息填写完整！");
        //    return;
        //}
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
            "userName":fullName[1]




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
                    loaddata();
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