$(function () {
    var fullName1 = $("#welcome").text().split(":")[1];
    var fullName = fullName1.split("]")[0];


    $("#rtu2mms").empty();
    $.ajax({
        type: "post",                          //提交方式
        url: "h5carorderlist.ashx",        //一般处理程序的路径
        data: { "name": fullName },           //向后台传入的值
        dataType: "html",                       //返回值格式
        success: function (data) {
            
            $("#rtu2mms").append(data);

        },
        complete: function (XMLHttpRequest, textStatus) {
           
        },


    });
});