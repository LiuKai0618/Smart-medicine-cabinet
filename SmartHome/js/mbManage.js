$(function () {
    var mbcolordic = { "老年人": "blue", "高血压": "red", "糖尿病": "green", "孕产妇": "pink", "婴幼儿": "orange", "结核": "yellow", "严重精神障碍": "purple", "一般人群": "white" };
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
            url: "mbManage.ashx",        //一般处理程序的路径
            //data: { name: "rtuid" },                    //向后台传入的值
            //data: { name: "25350500000" },
            //data: { name: rtuid },
            data: { action: "mbInfor" },
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
            var loginusername = $(this).parent().parent().children(":nth-child(3)").text();
            var usernametemp = $("#loginuser").text();
            if (usernametemp.indexOf("管理") == -1) {
                if (usernametemp.split("：")[1] != loginusername) {
                    alert("您不是管理员或者创建者本人，无权修改！");
                    return;
                }
            }


            var trObj = $(this).parent().parent();

            $("#editLng").val(trObj.children(":nth-child(1)").text());
            $("#editLat").val(trObj.children(":nth-child(2)").text());
            $("#editUserName").val(trObj.children(":nth-child(3)").text());
            var mbcolortemp = mbcolordic[trObj.children(":nth-child(4)").text()];
            $("#editMbColor").val(mbcolortemp).trigger("change");
            $("#editMbName").val(trObj.children(":nth-child(5)").text());

            $("#editMbOldColor").val(mbcolortemp);

            //$("input:radio[name='editSexOptions'][value='男']").prop('checked','checked');//sex
            //$("input:radio[name=editSexOptions][value=" + trObj.children(":nth-child(2)").text() + "]").prop("checked", "checked");
            ////$.uniform.update();
            //$("#editIDCard").val(trObj.children(":nth-child(3)").text());//IDCard
            ////$("input:radio[name=editDepID][value=" + trObj.children(":nth-child(4)").text() + "]").prop("checked", "checked");

            //$("#editDepID").val(trObj.children(":nth-child(4)").text()).trigger("change");
            ////console.log($("#editDepID").val());
            ////console.log(trObj.children(":nth-child(4)").text());

            //$("#editPhoneNumber").val(trObj.children(":nth-child(5)").text());
            //$("#editJobPosition").val(trObj.children(":nth-child(6)").text());
            //$("#editEducation").val(trObj.children(":nth-child(7)").text()).trigger("change");
            //$("input:radio[name=editIsCertificatedOptions][value=" + trObj.children(":nth-child(8)").text() + "]").prop("checked", "checked");
            //$("#editRegisteredResidence").val(trObj.children(":nth-child(9)").text());

            $.uniform.update();

            
            $("#editMbModal").modal();
        }
        else if ($(this).text() == "删除") {
            //是否为超级管理员或管理员或者用户本人，否则无删除权限
            var loginusername = $(this).parent().parent().children(":nth-child(3)").text();
            var usernametemp = $("#loginuser").text();
            if (usernametemp.indexOf("管理") != -1 || usernametemp.split("：")[1] == loginusername) {
                delEditButton = $(this);
                $("#deleteMbModal").modal();
            }
            else {
                alert("您不是管理员或者创建者本人，无权删除！");
            }
        }
    });
    //------------------------------------------------------------------------------------------------------//
    //-----------------------------------edit save---------------------------------------------------------//
    $("#saveEdit").click(function () {
        var editLng = $("#editLng").val();
        var editLat = $("#editLat").val();
        var editMbName = $("#editMbName").val();

        if (editLng == "" || editLat == "" || editMbName == "") {
            alert("请将小药箱信息填写完整！");
            return;
        }
        //下面的代码ajax修改的用户json数据
        //lnglat, userName, color, boxName
        var editinfor = {
            "action": "editMb",
            "lnglat": editLng + "*" + editLat,
            "userName": $("#editUserName").val(),
            "color": $("#editMbColor").val(),
            "oldcolor": $("#editMbOldColor").val(),
            "boxName": $("#editMbName").val()           
        };
        //console.log(editinfor);
        $.ajax({
            type: "POST",
            //contentType: "application/json;charset=UTF-8",
            url: "mbManage.ashx",
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
                    $('#jinggaomodel').text('小药箱信息已经成功修改！');
                    $('#myModal').modal({
                        backdrop: false,
                        keyboard: false,
                        show: true

                    });
                    setTimeout("$('#myModal').modal('hide')", 1000);
                    $("#editMbModal").modal("hide");
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
        var deltrObj = delEditButton.parent().parent();
        var lng = deltrObj.children(":nth-child(1)").text();
        var lat = deltrObj.children(":nth-child(2)").text();
        var userName = deltrObj.children(":nth-child(3)").text();
        var color = mbcolordic[deltrObj.children(":nth-child(4)").text()];

        var delinfor = {
            "action": "delMb",
            "lnglat": lng + "*" + lat,
            "userName": userName,
            "color": color
        };

        $.ajax({
            type: "POST",
            //contentType: "application/json;charset=UTF-8",
            url: "mbManage.ashx",
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
                    $("#deleteMbModal").modal("hide");
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

    //-----------------------------------detailBtn---------------------------------------------------------//
    $("#detailBtn").click(function () {        
        $("#detailMbModal").modal();
    });
    getallmb();
    function getallmb() {
        $.ajax({
            type: "post",                          //提交方式
            url: "h5marker.ashx",        //一般处理程序的路径
            data: { action: "allmbs" },           //向后台传入的值
            dataType: "text",                       //返回值格式
            //dataType: "json",                       //返回值格式
            success: function (data) {
                if (data["err_message"]) {
                    //清除所有小药箱，个数为0
                    mbCount = 0;
                    //-----------------------------------------------------------
                    //清除地图上的小药箱
                    if (lnglatList.length > 0) {
                        for (var i = 0; i < lnglatList.length; i++) {
                            map.removeOverlay(lnglatList[i]);
                        }
                    }
                    lnglatList = [];
                    //--------------------------------------------------------
                    return;
                }
                var maps = eval("(" + data + ")");
                mbCount = maps.length;
                $("#allColor").val(mbCount);
                //-----------------------------------------------------------
                //"老年人": "blue", "高血压": "red", "糖尿病": "green", "孕产妇": "pink", 
                //"婴幼儿": "orange", "结核": "yellow", "严重精神障碍": "purple", "一般人群": "white"
                var blueCount = 0;
                var redCount = 0;
                var greenCount = 0;
                var pinkCount = 0;
                var orangeCount = 0;
                var yellowCount = 0;
                var purpleCount = 0;
                var whiteCount = 0;

                //--------------------------------------------------------
                $.each(maps, function (idx, obj) {
                    var json = JSON.parse(obj);
                    //var lnglat = json["lnglat"];
                    var color = json["color"];
                    if (color == "red") {
                        redCount = redCount + 1;
                    }
                    else if (color == "blue") {
                        blueCount = blueCount + 1;
                    }
                    else if (color == "green") {
                        greenCount = greenCount + 1;
                    }
                    else if (color == "pink") {
                        pinkCount = pinkCount + 1;
                    }
                    else if (color == "orange") {
                        orangeCount = orangeCount + 1;
                    }
                    else if (color == "yellow") {
                        yellowCount = yellowCount + 1;
                    }
                    else if (color == "purple") {
                        purpleCount = purpleCount + 1;
                    }
                    else if (color == "white") {
                        whiteCount = whiteCount + 1;
                    }
                    //var temp = lnglat.split('*');
                    //--------------------------------
                    //alert(temp[0]);
                    //alert(temp[1]);
                    //var baonew1 = new BMapGL.Icon("img/xyx" + color + ".png", new BMapGL.Size(32, 28));
                    //var baonew1 = new BMapGL.Icon("img/xyx" + color + ".png", new BMapGL.Size(16, 14));
                    ////var baonew1 = new BMapGL.Icon("img/baonew1.png", new BMapGL.Size(26, 13));
                    //var markerbao = new BMapGL.Marker(new BMapGL.Point(temp[0], temp[1]), { icon: baonew1 });
                    //map.addOverlay(markerbao);
                    //lnglatList.push(markerbao);

                });
                $("#blue").val(blueCount);
                $("#red").val(redCount);
                $("#green").val(greenCount);
                $("#pink").val(pinkCount);
                $("#orange").val(orangeCount);
                $("#yellow").val(yellowCount);
                $("#purple").val(purpleCount);
                $("#white").val(whiteCount);
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

});