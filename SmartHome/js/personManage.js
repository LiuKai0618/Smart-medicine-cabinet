$(function () {
    //--------------------部门下拉框加载---------------------------------------------------------------------------------------------------------//
    $.ajax({
        type: "post",                          //提交方式
        url: "personManage.ashx",        //一般处理程序的路径
        //data: { name: "rtuid" },                    //向后台传入的值
        data: { action: "depInfor" },
        dataType: "html",                       //返回值格式
        success: function (data) {
            //console.log(data);
            $("#addDepID").append(data);
            $("#editDepID").append(data);
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
    //-----------------------------------------------------------------------------------------------------------------------------//
    //$('#loadDataModal').modal({
    //    backdrop: false,
    //    keyboard: false,
    //    show: true,

    //});
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



            //stateSave: true,
            //"language": {
            //    "lengthMenu": "每页_MENU_ 条记录",
            //    "zeroRecords": "没有找到记录",
            //    "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
            //    "infoEmpty": "无记录",
            //    "search": "搜索：",
            //    "infoFiltered": "(从 _MAX_ 条记录过滤)",
            //    "paginate": {
            //        "previous": "上一页",
            //        "next": "下一页"
            //    }
            //},

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
            url: "personManage.ashx",        //一般处理程序的路径
            //data: { name: "rtuid" },                    //向后台传入的值
            //data: { name: "25350500000" },
            //data: { name: rtuid },
            data: { action: "personInfor" },
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
            //delEditButton = $(this);
            //name, sex, IDCard, depID, phoneNumber, jobPosition, education, isCertificated, registeredResidence
            //$("#editSIPModal").modal();            
            //sipList 
            //var editObj = null;
            //for (var i = 0; i < sipList.length; i++) {
            //    if (sipList[i].id == parseInt(idedit)) {
            //        editObj = sipList[i];
            //    }
            //}
            //---------------------------------------------------------------------------------//
            //if (editObj.access_mode == 1) {
            //    $("#didEdit").parent().parent().css('display', 'none');
            //    $("#wel_voicemenuEdit").parent().parent().css('display', '');
            //}
            //else if (editObj.access_mode == 2) {
            //    $("#didEdit").parent().parent().css('display', '');
            //    $("#wel_voicemenuEdit").parent().parent().css('display', 'none');
            //}
            //---------------------------------------------------------------------------------//
            //alert("-"+trObj.children(":nth-child(2)").text()+"-");

            var trObj = $(this).parent().parent();
            //name, sex, IDCard, depID, phoneNumber, jobPosition, education, isCertificated, registeredResidence

            //var inputs = $("#editPersonModalBody").find('input');
            $("#editName").val(trObj.children(":nth-child(1)").text());//name
            //$("input:radio[name='editSexOptions'][value='男']").prop('checked','checked');//sex
            $("input:radio[name=editSexOptions][value=" + trObj.children(":nth-child(2)").text() + "]").prop("checked", "checked");
            //$.uniform.update();
            $("#editIDCard").val(trObj.children(":nth-child(3)").text());//IDCard
            //$("input:radio[name=editDepID][value=" + trObj.children(":nth-child(4)").text() + "]").prop("checked", "checked");

            $("#editDepID").val(trObj.children(":nth-child(4)").text()).trigger("change");
            //console.log($("#editDepID").val());
            //console.log(trObj.children(":nth-child(4)").text());

            $("#editPhoneNumber").val(trObj.children(":nth-child(5)").text());
            $("#editJobPosition").val(trObj.children(":nth-child(6)").text());
            $("#editEducation").val(trObj.children(":nth-child(7)").text()).trigger("change");
            $("input:radio[name=editIsCertificatedOptions][value=" + trObj.children(":nth-child(8)").text() + "]").prop("checked", "checked");
            $("#editRegisteredResidence").val(trObj.children(":nth-child(9)").text());

            $.uniform.update();

            //$("#editSexMale").prop("checked", "checked");
            //test[1].prop('checked', 'checked')
            //$(test).prop("checked", "checked");            
            //console.log($(test));
            //console.log(test);
            //$("#editIDCard").val(trObj.children(":nth-child(3)").text());//IDCard
            //$("#editDepID option[value=1]").attr("selected", "selected");
            //$("#editDepID").val(1);//depID
            //if (trObj.children(":nth-child(4)").text() == "保卫处") {
            //    $("#editDepID").val("0");//depID
            //}
            //else {
            //    $("#editDepID").val("1");//depID
            //}
            //$(inputs[1]).val(editObj.display_name);
            //$(inputs[2]).val(editObj.auth_name);
            //$(inputs[3]).val(editObj.auth_password);
            //$(inputs[4]).val(editObj.sip_server);
            //$(inputs[7]).val(editObj.timecall);
            //$("#wel_voicemenuEdit").val(editObj.wel_voicemenu);
            //$("#didEdit").val(editObj.did);
            //$(inputs[10]).val(editObj.did);
            //register_flagEditOptions
            //access_modeEditOptions
            //outbound_call_flagEditOptions
            //record_flagEditOptions
            //invite_flagEditOptions
            //incoming_flagEditOptions
            //$("input:radio[name=register_flagEditOptions][value=" + editObj.register_flag + "]").attr('checked', 'true');
            //$("input:radio[name=access_modeEditOptions][value=" + editObj.access_mode + "]").prop('checked', 'checked');
            //$("input:radio[name=outbound_call_flagEditOptions][value=" + editObj.outbound_call_flag + "]").attr('checked', 'true');
            //$("input:radio[name=record_flagEditOptions][value=" + editObj.record_flag + "]").attr('checked', 'true');
            //$("input:radio[name=invite_flagEditOptions][value=" + editObj.invite_flag + "]").attr('checked', 'true');
            //$("input:radio[name=incoming_flagEditOptions][value=" + editObj.incoming_flag + "]").attr('checked', 'true');
            //console.log(editObj);
            $("#editPersonModal").modal();
        }
        else if ($(this).text() == "删除") {
            delEditButton = $(this);
            $("#deletePersonModal").modal();
        }
    });
    //------------------------------------------------------------------------------------------------------//
    //-----------------------------------edit save---------------------------------------------------------//
    $("#saveEdit").click(function () {
        //var idEdit = parseInt($("#idEdit").val());
        //var display_nameEdit = $("#display_nameEdit").val();
        //var auth_nameEdit = $("#auth_nameEdit").val();
        //var auth_passwordEdit = $("#auth_passwordEdit").val();
        //var sip_serverEdit = $("#sip_serverEdit").val();
        //var timecallEdit = $("#timecallEdit").val();
        //var wel_voicemenuEdit = $("#wel_voicemenuEdit").val();
        //var didEdit = $("#didEdit").val();
        //if (idEdit == "" || display_nameEdit == "" || auth_nameEdit == "" || auth_passwordEdit == "" ||
        //   sip_serverEdit == "" || timecallEdit == "") {
        //    alert("请将信息填写完整！");
        //    return;
        //}
        //下面的代码ajax修改的用户json数据
        var editinfor = {
            "action": "editPerson",
            "name": $("#editName").val(),
            "sex": $("input:radio[name=editSexOptions]:checked").val(),
            "IDCard": $("#editIDCard").val(),
            "depID": $("#editDepID").val(),
            "phoneNumber": $("#editPhoneNumber").val(),
            "jobPosition": $("#editJobPosition").val(),
            "education": $("#editEducation").val(),
            "isCertificated": $("input:radio[name=editIsCertificatedOptions]:checked").val(),
            "registeredResidence": $("#editRegisteredResidence").val()
            //"action": "updatesip",
            //"id": idEdit,
            //"display_name": display_nameEdit,
            //"auth_name": auth_nameEdit,
            //"auth_password": auth_passwordEdit,
            //"sip_server": sip_serverEdit,
            //"register_flag": parseInt($("input:radio[name=register_flagEditOptions]:checked").val()),
            //"timecall": parseInt(timecallEdit),
            //"access_mode": parseInt($("input:radio[name=access_modeEditOptions]:checked").val()),
            //"wel_voicemenu": wel_voicemenuEdit,
            //"did": didEdit,
            //"outbound_call_flag": parseInt($("input:radio[name=outbound_call_flagEditOptions]:checked").val()),
            //"record_flag": parseInt($("input:radio[name=record_flagEditOptions]:checked").val()),
            //"invite_flag": parseInt($("input:radio[name=invite_flagEditOptions]:checked").val()),
            //"incoming_flag": parseInt($("input:radio[name=incoming_flagEditOptions]:checked").val())
            //register_flagEditOptions
            //access_modeEditOptions
            //outbound_call_flagEditOptions
            //record_flagEditOptions
            //invite_flagEditOptions
            //incoming_flagEditOptions
        };
        //console.log(editinfor);
        $.ajax({
            type: "POST",
            //contentType: "application/json;charset=UTF-8",
            url: "personManage.ashx",
            //url: "outset_sip.ashx",
            data: editinfor,
            //data: JSON.stringify(addinfor),
            dataType: "json",

            //type: "POST",
            //contentType: "application/json;charset=UTF-8",
            //url: "/vpbx.cgi",
            ////url: "outset_sip.ashx",
            //data: JSON.stringify(editinfor),
            //dataType: "json",
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
                    $('#jinggaomodel').text('人员信息已经成功修改！');
                    $('#myModal').modal({
                        backdrop: false,
                        keyboard: false,
                        show: true

                    });
                    setTimeout("$('#myModal').modal('hide')", 1000);
                    $("#editPersonModal").modal("hide");
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

        var IDCard = delEditButton.parent().parent().children(":nth-child(3)").text();

        var delinfor = {
            "action": "delPerson",
            "IDCard": IDCard
        };

        $.ajax({
            type: "POST",
            //contentType: "application/json;charset=UTF-8",
            url: "personManage.ashx",
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
                    $('#jinggaomodel').text('人员信息已经成功删除！');
                    $('#myModal').modal({
                        backdrop: false,
                        keyboard: false,
                        show: true

                    });
                    setTimeout("$('#myModal').modal('hide')", 1000);
                    $("#deletePersonModal").modal("hide");
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
    //------------------------------------------------------------------------------------------------------//
    //-----------------------------------add button click---------------------------------------------------------//
    $("#addBtn").click(function () {
        //console.log('add');
        $("#editPersonModal").modal("show");
        $("#editPersonModal").modal("hide");
        $("#addPersonModal").modal();
        //$("#didAdd").parent().parent().css('display', '');
        //$("#wel_voicemenuAdd").parent().parent().css('display', 'none');
        //$("input:radio[name=access_modeAddOptions][value=2]").prop('checked', 'checked');

    });
    //------------------------------------------------------------------------------------------------------//
    //-----------------------------------add save--------------------------------------------------------//
    $("#saveAdd").on('click', function () {

        //name, sex, IDCard, depID, phoneNumber, jobPosition, education, isCertificated, registeredResidence
        var name = $("#addName").val();
        var IDCard = $("#addIDCard").val();

        if (name == "" || IDCard == "") {
            alert("请将姓名或身份证信息填写完整！");
            return;
        }
        //下面的代码ajax修改的用户json数据
        var addinfor = {
            "action": "addPerson",
            "name": name,
            "sex": $("input:radio[name=addSexOptions]:checked").val(),
            "IDCard": IDCard,
            "depID": $("#addDepID").val(),
            "phoneNumber": $("#addPhoneNumber").val(),
            "jobPosition": $("#addJobPosition").val(),
            "education": $("#addEducation").val(),
            "isCertificated": $("input:radio[name=addIsCertificatedOptions]:checked").val(),
            "registeredResidence": $("#addRegisteredResidence").val()

            //"auth_password": auth_passwordAdd,
            //"sip_server": sip_serverAdd,
            //"register_flag": parseInt($("input:radio[name=register_flagAddOptions]:checked").val()),
            //"timecall": parseInt(timecallAdd),
            //"access_mode": parseInt($("input:radio[name=access_modeAddOptions]:checked").val()),
            //"wel_voicemenu": wel_voicemenuAdd,
            //"did ": didAdd,
            //"outbound_call_flag": parseInt($("input:radio[name=outbound_call_flagAddOptions]:checked").val()),
            //"record_flag": parseInt($("input:radio[name=record_flagAddOptions]:checked").val()),
            //"invite_flag": parseInt($("input:radio[name=invite_flagAddOptions]:checked").val()),
            //"incoming_flag": parseInt($("input:radio[name=incoming_flagAddOptions]:checked").val())
            //register_flagEditOptions
            //access_modeEditOptions
            //outbound_call_flagEditOptions
            //record_flagEditOptions
            //invite_flagEditOptions
            //incoming_flagEditOptions
        };


        $.ajax({
            type: "POST",
            //contentType: "application/json;charset=UTF-8",
            url: "personManage.ashx",
            //url: "outset_sip.ashx",
            data: addinfor,
            //data: JSON.stringify(addinfor),
            dataType: "json",
            success: function (data) {
                //console.log(data[err_message]);
                //console.log("-------------------------");
                //console.log(data["err_message"]);
                if (data["err_message"]) {
                    if (data["err_message"] == "personIsExist")
                    {
                        $('#jinggaomodel').text('人员信息已经存在，无法添加！');
                        $('#myModal').modal({
                            backdrop: false,
                            keyboard: false,
                            show: true

                        });
                        setTimeout("$('#myModal').modal('hide')", 1000);
                    }
                    else if (data["err_message"] == "addFailure")
                    {
                        $('#jinggaomodel').text('添加失败，请重新添加！');
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
                    if (data["success"] == "success_addone") {
                        loaddata();
                        $('#jinggaomodel').text('人员姓名已存在，为了更好管理人员信息，在该姓名后附加了三位随机数，请知晓！');
                        $('#myModal').modal({
                            backdrop: false,
                            keyboard: false,
                            show: true

                        });
                        setTimeout("$('#myModal').modal('hide')", 3000);
                        $("#addPersonModal").modal("hide");
                    }
                    else {
                        loaddata();
                        $('#jinggaomodel').text('人员信息已经成功添加！');
                        $('#myModal').modal({
                            backdrop: false,
                            keyboard: false,
                            show: true

                        });
                        setTimeout("$('#myModal').modal('hide')", 1000);
                        $("#addPersonModal").modal("hide");
                    }
                   
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
    //------------------------------------------------------------------------------------------------------//



});