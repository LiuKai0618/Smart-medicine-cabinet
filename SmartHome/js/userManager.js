$(function () {
    //------------------------------------get mms2rtu all rtuid---------------------------------------------------------------//
    var rtuids = [];
    //loadRTUIDs();
    function loadRTUIDs() {
        $.ajax({
            type: "POST",
            //contentType: "application/json;charset=UTF-8",
            url: "userManager.ashx",
            async: false,
            //data: JSON.stringify(userinfors),
            data: { "action": "rtuidsInfor" },
            dataType: "html",
            //dataType: "text",
            success: function (data) {
                $("#rtuids").empty();
                $("#rtuids").append(data);
                //usernames = data.usernamelist;
                //var list = data.usernamelist;
                //for (var i = 0; i < list.length; i++) {
                //    usernames.push(list[i]);
                //}
                //console.log(usernames);
                //console.log(typeof(usernames));

            },
            error: function (jqXHR, textStatus, errorThrown) {
                if (jqXHR.status == 200) {

                }
                else {
                    //alert("error");
                }

            }

        });
    };
    //------------------------------------checkbox clear---------------------------------------------------------------//
    function checkboxclear() {
        var divs = $("#rtuids").children("div");
        if (divs == null) { return; }
        for (var i = 0; i < divs.length; i++) {
            //console.log(divs[i]);
            var temp = $(divs[i]).children();
            //console.log(temp);
            for (var j = 0; j < temp.length; j++) {
                var inputObj = $(temp[j]).children();
                inputObj.attr("checked", false);
            }

        }
    };
    //------------------------------------user select change---------------------------------------------------------------//
    $("#editUsername").change(function () {
        //checkboxclear();
        var userrtuids = {
            "action": "userRTUIDs",
            "username": $(this).val()
        };
        //alert($(this).val());
        $.ajax({
            type: "POST",
            //contentType: "application/json;charset=UTF-8",
            url: "userManager.ashx",
            async: true,
            //data: JSON.stringify(userinfors),
            data: userrtuids,
            dataType: "json",
            //dataType: "text",
            success: function (data) {
                var userlevel = data.userrtuids;
                $("#editPassword").val(userlevel[1]);
                $("#editUserlevel").val(userlevel[0]);

                //var rtuids = data.userrtuids;
                ////开始遍历checkbox，看是否应该勾选
                //var divs = $("#rtuids").children("div");
                //if (divs == null) { return;}
                //for (var i = 0; i < divs.length; i++) {
                //    //console.log(divs[i]);
                //    var temp = $(divs[i]).children();
                //    //console.log(temp);
                //    for (var j = 0; j < temp.length; j++) {
                //        var inputObj = $(temp[j]).children();
                //        if (rtuids.indexOf(inputObj.val()) != -1) {
                //            inputObj.attr("checked", true);
                //        }
                //        else {
                //            inputObj.attr("checked", false);
                //        }
                //    }

                //}
                //var list = data.usernamelist;
                //for (var i = 0; i < list.length; i++) {
                //    usernames.push(list[i]);
                //}
                //console.log(usernames);
                //console.log(typeof(usernames));

            },
            error: function (jqXHR, textStatus, errorThrown) {
                if (jqXHR.status == 200) {

                }
                else {
                    //alert("error");
                }

            }

        });

    });
    //------------------------------------get user infor---------------------------------------------------------------//
    var usernames = [];
    loadUserInfors();
    //------------------------------------get user infor---------------------------------------------------------------//
    function loadUserInfors() {
        $.ajax({
            type: "POST",
            //contentType: "application/json;charset=UTF-8",
            url: "userManager.ashx",
            async: false,
            //data: JSON.stringify(userinfors),
            data: { "action": "userinfor" },
            dataType: "json",
            //dataType: "text",
            success: function (data) {
                usernames = data.usernamelist;
                //var list = data.usernamelist;
                //for (var i = 0; i < list.length; i++) {
                //    usernames.push(list[i]);
                //}
                //console.log(usernames);
                //console.log(typeof(usernames));

            },
            error: function (jqXHR, textStatus, errorThrown) {
                if (jqXHR.status == 200) {

                }
                else {
                    //alert("error");
                }

            }

        });
        //更新要删除的用户列表
        var delUsername = $("#delUsername");
        delUsername.empty();
        for (var i = 0; i < usernames.length; i++) {
            delUsername.append("<option value='" + usernames[i] + "'>" + usernames[i] + "</option>");
        }
        $("#delUsername").val(usernames[0]).trigger("change");
        //$("#delUsername").selectpicker('refresh');
        //$("#delUsername").selectpicker('render');
        //编辑的用户列表也要更新
        var editUsername = $("#editUsername");
        editUsername.empty();
        for (var i = 0; i < usernames.length; i++) {
            editUsername.append("<option value='" + usernames[i] + "'>" + usernames[i] + "</option>");
        }
        $("#editUsername").val(usernames[0]).trigger("change");
        //$("#editUsername").val(usernames[0]);
        //$("#editUsername").selectpicker('refresh');
        //$("#editUsername").selectpicker('render');
    };
    
    //-----------------------------------add save--------------------------------------------------------//
    $("#addBtn").on('click', function () {
        var addUsername = $("#addUsername").val();
        var addPassword1 = $("#addPassword1").val();
        var addPassword2 = $("#addPassword2").val();
        var addUserlevel = $("#addUserlevel").val();
        //是否为空
        if (addUsername == ""|| addPassword1 == "" || addPassword2 == "" ) {
            $('#jinggaomodel').text('请将信息填写完整！');
            $('#myModal').modal({
                backdrop: false,
                keyboard: false,
                show: true

            });
            setTimeout("$('#myModal').modal('hide')", 1000);
            return;
        }
        //两次密码是否相同
        if (addPassword1.trim() != addPassword2.trim()) {
            $('#jinggaomodel').text('两次密码输入不相同！');
            $('#myModal').modal({
                backdrop: false,
                keyboard: false,
                show: true

            });
            setTimeout("$('#myModal').modal('hide')", 1000);
            return;
        }
        //用户名是否已经存在
        if (usernames.indexOf(addUsername) != -1) {
            $('#jinggaomodel').text('用户名已经存在！');
            $('#myModal').modal({
                backdrop: false,
                keyboard: false,
                show: true

            });
            setTimeout("$('#myModal').modal('hide')", 1000);
            return;

        }
        //用户名不能是sa
        if (addUsername == "sa")  {
            $('#jinggaomodel').text('用户名sa已经存在！');
            $('#myModal').modal({
                backdrop: false,
                keyboard: false,
                show: true

            });
            setTimeout("$('#myModal').modal('hide')", 1000);
            return;

        }
        //下面的代码ajax修改的用户json数据
        var adduser = {
            "action": "adduser",
            "addUsername": $("#addUsername").val(),
            "addPassword1": $("#addPassword1").val(),
            "addUserlevel": $("#addUserlevel").val()
        };

        $.ajax({
            type: "POST",
            //contentType: "application/json;charset=UTF-8",
            url: "userManager.ashx",
            data: adduser,
            dataType: "json",
            success: function (data) {
                if (data.err_message) {
                    //alert(data.err_message);
                    $('#jinggaomodel').text('用户信息添加失败！');
                    $('#myModal').modal({
                        backdrop: false,
                        keyboard: false,
                        show: true

                    });
                    setTimeout("$('#myModal').modal('hide')", 1000);
                }
                else {
                    loadUserInfors();
                    //console.log(addinfor);
                    $('#jinggaomodel').text('用户信息已经成功添加！');
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
                    //$('#jinggaomodel').text('用户信息已经成功添加！');
                    //$('#myModal').modal({
                    //    backdrop: false,
                    //    keyboard: false,
                    //    show: true

                    //});
                    //setTimeout("$('#myModal').modal('hide')", 1000);
                }
                else {
                    //alert("error");
                }

            }

        });

    });
    //------------------------------------删除用户------------------------------------------------------------------//
    var delUsername = "";
    $("#delBtn").on('click', function () {
        $("#deleteUserModal").modal();
        delUsername = $("#delUsername").val();
    });
    //删除的用户提交至服务器
    $("#SaveDelete").on('click', function () {
       
        var deluser = {
            "action": "deluser",
            "delUsername": delUsername
        };

        $.ajax({
            type: "POST",
            //contentType: "application/json;charset=UTF-8",
            url: "userManager.ashx",
            data: deluser,
            dataType: "json",
            success: function (data) {
                if (data.err_message) {
                    //alert(data.err_message);
                    $('#jinggaomodel').text('用户信息删除失败！');
                    $('#myModal').modal({
                        backdrop: false,
                        keyboard: false,
                        show: true

                    });
                    setTimeout("$('#myModal').modal('hide')", 1000);
                }
                else {
                    loadUserInfors();
                    //$("#delUsername").selectpicker('refresh');
                    //$("#delUsername").selectpicker('render');
                    //$("#delUsername").selectpicker();
                    //console.log(addinfor);
                    $('#jinggaomodel').text('用户信息成功删除！');
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
                    
                }
                else {
                    //alert("error");
                }

            }

        });

    });
    //--------------------------------------------edit user----------------------------------------------------------//
    $("#editBtn").on('click', function () {
        //var rtuids = [];
        //var divs = $("#rtuids").children("div");
        //if (divs == null) { return; }
        //for (var i = 0; i < divs.length; i++) {
        //    //console.log(divs[i]);
        //    var temp = $(divs[i]).children();
        //    //console.log(temp);
        //    for (var j = 0; j < temp.length; j++) {
        //        var inputObj = $(temp[j]).children();
        //        if (inputObj.attr("checked")) {
        //            rtuids.push(inputObj.val());
        //        }
        //        //inputObj.attr("checked", false);
        //    }

        //}
        //console.log(rtuids);
        //开始ajax发送，数组为空说明删除该用户的对rtuid的访问权限
        var edituser = {
            "action": "edituser",
            "editUsername": $("#editUsername").val(),
            "editPassword": $("#editPassword").val(),
            "editUserlevel": $("#editUserlevel").val()
            //"rtuidsel": JSON.stringify(rtuids)
        };

        $.ajax({
            type: "POST",
            //contentType: "application/json;charset=UTF-8",
            url: "userManager.ashx",
            data: edituser,
            //data: JSON.stringify(edituser),
            dataType: "json",
            success: function (data) {
                if (data.err_message) {
                    //alert(data.err_message);
                    $('#jinggaomodel').text('用户信息修改失败！');
                    $('#myModal').modal({
                        backdrop: false,
                        keyboard: false,
                        show: true

                    });
                    setTimeout("$('#myModal').modal('hide')", 1000);
                }
                else {
                    //loadUserInfors();
                    //$("#delUsername").selectpicker('refresh');
                    //$("#delUsername").selectpicker('render');
                    //$("#delUsername").selectpicker();
                    //console.log(addinfor);
                    $('#jinggaomodel').text('用户信息成功修改！');
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

                }
                else {
                    //alert("error");
                }

            }

        });
    });
    //------------------------------------------------------------------------------------------------------//
    //------------------------------------------------------------------------------------------------------//
    //------------------------------------------------------------------------------------------------------//
    //------------------------------------------------------------------------------------------------------//
});