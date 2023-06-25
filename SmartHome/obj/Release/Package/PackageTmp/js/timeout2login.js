var lastTime = new Date().getTime();

var currentTime = new Date().getTime();
//var timeOut = 10000; //设置超时时间： 10秒
var timeOut = 10 * 60 * 1000; //设置超时时间： 10分

window.onload = function() {

    window.document.onmousemove = function() {

        lastTime = new Date().getTime(); //更新操作时间

    }

};

function testTime() {

    currentTime = new Date().getTime(); //更新当前时间

    if (currentTime - lastTime > timeOut) { //判断是否超时
        window.location = "../login.html";
        //console.log("超时");

    }

}


window.setInterval(testTime, 1000);
