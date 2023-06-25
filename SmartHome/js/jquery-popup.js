// 修改弹出框的title, 显示弹框
function ShowCreateModal(title){
    $("#createFileTitle").text(title);
    $('#createFileMModal').modal('show');
}
// 关闭弹框， 获取输入值，然后执行逻辑
$("#createFileSureBut").click(function (){
    $("#createFileMModal").modal("hide");
    var inputFileName = $("#fileName").val();
    console.log("input file name : " + inputFileName);
});
