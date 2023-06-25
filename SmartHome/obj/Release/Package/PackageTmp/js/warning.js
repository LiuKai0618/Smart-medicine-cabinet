$(function () {
    //-------------------------------------------------------------------------
    function getQueryVariable(variable) {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i = 0; i < vars.length; i++) {
            var pair = vars[i].split("=");
            if (pair[0] == variable) { return pair[1]; }
        }
        return false;
    }
    //--------------------------------------------------------------------------
    if (getQueryVariable("rtuid") == false) {
        getNewin5s();
        setInterval(getNewin5s,10000);
        //getNewin5s();

    }
    else if (window.location.pathname.indexOf("warning.aspx") != -1) {
        setTimeout(function () { window.location.href = "../warning.aspx"; }, 10000);

    }

    //--------------------------------------------------------------------------------
    //var globalRTUID;
    $("#modelWarnBtn").click(function () {
        $('#myModalWarn').modal('hide');
        var myrtuid = $('#jinggaomodelWarn').children(":first").text().substring(1,12);
        window.location.href = "../warning.aspx?rtuid="+myrtuid;
    });

    $('#myModalWarn').on('hidden.bs.modal', function (e) {
        document.getElementById("myaudio").pause();
        //var myrtuid = $('#jinggaomodelWarn').children(":first").text().substring(1,12);
        //window.location.href = "../warning.aspx?rtuid="+myrtuid;

    })
    //================================================================================

    //setInterval(getNewin5s,10000);
    
    function getNewin5s() {
        $.ajax({
            type: "get",
            contentType: "application/json;charset=UTF-8",
            url: "warningin5s.ashx?name5=rtuwarning5s",//warningin5s
            //async: true,
            //data: JSON.stringify(userinfors),
            //data: { "name5": "rtuwarning5s" },
            dataType: "json",
            //dataType: "html",
            //dataType: "text",
            success: function (data) {
                //alert(data.warning5s);
                var list = data.warning5s;
                if (list) {
                    for (var i = 0; i < list.length; i++) {
                        //ID, RTUID, Password, SwitchState, SwitchStyle, UpInterval, MaxCurrent, MinVoltage, MaxVoltage, 
                        //Frequency, DutyRatio, OpenTime, OpenAngle, ClientPoint, DateTime, NowVoltage, NowCurrent
                        var MaxCurrent = parseInt(list[i].MaxCurrent);
                        var MinVoltage = parseInt(list[i].MinVoltage);
                        var MaxVoltage = parseInt(list[i].MaxVoltage);

                        var NowCurrent = parseInt(list[i].NowCurrent);
                        var NowVoltage = parseInt(list[i].NowVoltage);
                        //设备电流>最大电流*80%  || 设备电压>最大电压*80% || 设备电压<最小电压*120%
                        if (NowCurrent > MaxCurrent * 0.8) {
                            if ((NowVoltage > MaxVoltage * 0.8) || (NowVoltage < MinVoltage * 1.2)) {
                                //电压 电流 warn
                                document.getElementById("myaudio").play();
                                $('#jinggaomodelWarn').html("站点 <a style='color:red;font-weight:bolder;' href='../warning.aspx?rtuid=" + list[i].RTUID + "'>[" + list[i].RTUID + "] </a>[设备电压] [设备电压]数据异常，点击 <a style='color:red;font-weight:bolder;' href='../warning.aspx?rtuid=" + list[i].RTUID + "'> [确定] </a>查看详细...");
                                $('#myModalWarn').modal({
                                    backdrop: false,
                                    keyboard: false,
                                    show: true

                                });
                                //document.getElementById("myaudio").play();
                                //var result = confirm('站点: [' + list[i].RTUID + '] [设备电压] 和 [设备电流] 数据异常，点击 [确定] 查看详细...');
                                
                                //if (result) {
                                //    document.getElementById("myaudio").pause();
                                //    window.location.href = "../warning.aspx?rtuid=" + list[i].RTUID;
                                //}
                                //alert("<a href='warning.aspx'>"+list[i].RTUID+"</a>vol curr warn");
                            }
                            else {
                                //电流warn
                                document.getElementById("myaudio").play();
                                $('#jinggaomodelWarn').html("站点 <a style='color:red;font-weight:bolder;' href='../warning.aspx?rtuid=" + list[i].RTUID + "'>[" + list[i].RTUID + "] </a>[设备电流] 数据异常，点击 <a style='color:red;font-weight:bolder;' href='../warning.aspx?rtuid=" + list[i].RTUID + "'> [确定] </a>查看详细...");
                                $('#myModalWarn').modal({
                                    backdrop: false,
                                    keyboard: false,
                                    show: true

                                });
                                //alert("<a href='warning.aspx'>" + list[i].RTUID + "</a>current warn");
                                //document.getElementById("myaudio").play();
                                //var result = confirm('站点: [' + list[i].RTUID + '] [设备电流] 数据异常，点击 [确定] 查看详细...');
                                
                                //if (result) {
                                //    document.getElementById("myaudio").pause();
                                //    window.location.href = "../warning.aspx?rtuid=" + list[i].RTUID;
                                //}
                            }

                        }
                        else if ((NowVoltage > MaxVoltage * 0.8) || (NowVoltage < MinVoltage * 1.2)) {
                            
                            //var result;
                            //setTimeout(function () { result = confirm('站点: [' + list[i].RTUID + '] [设备电压] 数据异常，点击 [确定] 查看详细...'); }, 1000);
                            //var result = confirm('站点: [' + list[i].RTUID + '] [设备电压] 数据异常，点击 [确定] 查看详细...');
                            //document.getElementById("myaudio").onplaying = function () {
                            //    var result = confirm('站点: [' + list[i].RTUID + '] [设备电压] 数据异常，点击 [确定] 查看详细...');
                            //};
                            
                            //$('#jinggaomodelWarn').text('站点: [' + list[i].RTUID + '] [设备电压] 数据异常，点击 [确定] 查看详细...');
                            //globalRTUID = list[i].RTUID;
                            document.getElementById("myaudio").play();
                            $('#jinggaomodelWarn').html("站点 <a style='color:red;font-weight:bolder;' href='../warning.aspx?rtuid=" + list[i].RTUID + "'>[" + list[i].RTUID + "] </a>[设备电压] 数据异常，点击 <a style='color:red;font-weight:bolder;' href='../warning.aspx?rtuid=" + list[i].RTUID + "'> [确定] </a>查看详细...");
                            $('#myModalWarn').modal({
                                backdrop: false,
                                keyboard: false,
                                show: true

                            });
                            //$('#myModalWarn').on('hidden.bs.modal', function (e) {
                            //    document.getElementById("myaudio").pause();
                            //    window.location.href = "../warning.aspx?rtuid=" + list[i].RTUID;

                            //})
                            //if (result) {
                            //    document.getElementById("myaudio").pause();
                            //    window.location.href = "../warning.aspx?rtuid=" + list[i].RTUID;
                            //}
                            //电压warn
                            //alert("<a href='warning.aspx'>" + list[i].RTUID + "</a>vol warn");
                        }


                        //alert("<a href='warning.aspx'>ceshi</a>");
                    }
                }
                //alert(JSON.stringify(data));

            },
            error: function (jqXHR, textStatus, errorThrown) {
                if (jqXHR.status == 200) {
                    //alert("error1");
                }
                else {
                    //alert(jqXHR.status);
                }

            }

        });
    };
    //var userinfors = { "name5": "rtuwarning5s" };
    
    //function getNewin5s() {
    //    $.ajax({
    //        type: "POST",
    //        //contentType: "application/json;charset=UTF-8",
    //        url: "warningin5s.ashx",
    //        async: false,
    //        //data: JSON.stringify(userinfors),
    //        data: { name: "rtuwarning5s" },
    //        dataType: "json",
    //        //dataType: "html",
    //        //dataType: "text",
    //        success: function (data) {
                

    //        },
    //        error: function (jqXHR, textStatus, errorThrown) {
    //            if (jqXHR.status == 200) {

    //            }
    //            else {
    //                //alert("error");
    //            }

    //        }

    //    });
    //};
    //getNewin5s();



});