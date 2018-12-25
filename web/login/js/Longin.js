function login(){
    var username = document.getElementById("ID").value;
    var password = document.getElementById("PASSWORD").value;
    if(username==""){
        $.jGrowl("用户名不能为空！", { header: '提醒' });
    }else if(password==""){
        $.jGrowl("密码不能为空！", { header: '提醒' });
    }else{
        AjaxFunc();
    }
}
function AjaxFunc()
{
    var username = document.getElementById("ID").value;
    var password = document.getElementById("PASSWORD").value;
    $.ajax({
        type: 'get',
        url: "",
        dataType: "json",
        data: {"username": username,"password": password},
        success: function (data) {
            
        },
        error: function (xhr, type) {
            console.log(xhr);
        }
    });
}