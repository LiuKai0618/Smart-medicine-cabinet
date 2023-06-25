$(function () {
    //-----------------------普通用户--------------------------------------------------------------------------------------------
    if ($("#loginuser").text().indexOf("用户") != -1) {
        //$("#sidebar").children(":eq(1)").children(":eq(2)").children(":eq(1)").children(":eq(1)").css("display", "none");//用车审批
        //$("#sidebar").children(":eq(1)").children(":eq(4)").children(":eq(1)").children(":eq(2)").css("display", "none");//系统权限
        $("#user-nav").children(":eq(0)").children(":eq(0)").children(":eq(1)").children(":eq(2)").css("display", "none");
        $("#user-nav").children(":eq(0)").children(":eq(0)").children(":eq(1)").children(":eq(1)").css("display", "none");

        $("#sidebar").children(":eq(1)").children(":eq(0)").css("display", "none");//车辆最新定位
        $("#sidebar").children(":eq(1)").children(":eq(1)").css("display", "none");
        $("#sidebar").children(":eq(1)").children(":eq(2)").css("display", "none");
        $("#sidebar").children(":eq(1)").children(":eq(3)").css("display", "none");
        $("#sidebar").children(":eq(1)").children(":eq(4)").css("display", "none");
        $("#sidebar").children(":eq(1)").children(":eq(5)").css("display", "none");
        $("#sidebar").children(":eq(1)").children(":eq(6)").children(":eq(1)").children(":eq(0)").css("display", "none");
        $("#sidebar").children(":eq(1)").children(":eq(6)").children(":eq(1)").children(":eq(1)").css("display", "none");
        $("#sidebar").children(":eq(1)").children(":eq(6)").children(":eq(1)").children(":eq(2)").css("display", "none");
        $("#sidebar").children(":eq(1)").children(":eq(6)").children(":eq(1)").children(":eq(3)").css("display", "none");
    }
    //------------------------超级管理员-------------------------------------------------------------------------------------------
    else if ($("#loginuser").text().indexOf("超级") != -1) {
       
        //$("#sidebar").children(":eq(1)").children(":eq(2)").children(":eq(1)").children(":eq(1)").css("display", "");
        //$("#sidebar").children(":eq(1)").children(":eq(4)").children(":eq(1)").children(":eq(2)").css("display", "");
        //$("#user-nav").children(":eq(0)").children(":eq(0)").children(":eq(1)").children(":eq(2)").css("display", "");
        //$("#user-nav").children(":eq(0)").children(":eq(0)").children(":eq(1)").children(":eq(1)").css("display", "");
   }
       //--------------------一般管理员-----------------------------------------------------------------------------------------------
    else {
        
        //$("#sidebar").children(":eq(1)").children(":eq(2)").children(":eq(1)").children(":eq(1)").css("display", "");
        //$("#sidebar").children(":eq(1)").children(":eq(4)").children(":eq(1)").children(":eq(2)").css("display", "");
        //$("#user-nav").children(":eq(0)").children(":eq(0)").children(":eq(1)").children(":eq(2)").css("display", "");
        //$("#user-nav").children(":eq(0)").children(":eq(0)").children(":eq(1)").children(":eq(1)").css("display", "");
   }
    //-------------------------------------------------------------------------------------------------------------------
    
});