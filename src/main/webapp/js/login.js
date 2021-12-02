


/*javascript:reset() 表示防止页面刷新 */
function reset(){
    $("#captcha").attr("src",basePath+"/captcha?t="+new Date().getTime())
    $("#checkedcode").prop("value","");
}


$(document).on("click","#login",function () {

    let usernameDiv=$("#username").parent();
    let passwordDiv=$("#password").parent();
    let checkedcodeDiv=$("#checkedcode").parent();
    $.ajax({
        url:basePath+"/user/loginIn",
        type:"post",
        data:$(this).parents().find("form").serialize(),
        dataType:"JSON",
        success:function (data) {
            usernameDiv.find("span").text(data.map.msg);
            checkedcodeDiv.find("span").text(data.map.checkedText);
            usernameDiv.removeClass("has-error");
            usernameDiv.removeClass("has-success");
            passwordDiv.removeClass("has-error");
            passwordDiv.removeClass("has-success");
            checkedcodeDiv.removeClass("has-error");
            checkedcodeDiv.removeClass("has-success");
            if (data.code==="200"){
                if (data.map.checked){
                    clearForm("#login")
                    location.href=data.map.url;
                }else {
                    checkedcodeDiv.addClass("has-error");
                    checkedcodeDiv.find("#checkedcode").prop("value","");
                    reset();
                }
            }else {
                reset();
                usernameDiv.addClass("has-error");
                passwordDiv.addClass("has-error");
            }
        }
    })
    return false;
})
