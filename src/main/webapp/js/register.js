/*javascript:reset() 表示防止页面刷新 */
function reset(){
    $("#registerCaptcha").attr("src",basePath+"/captcha?t="+new Date().getTime())
    $("#registerCheckedcode").prop("value","");
}

$(document).on("click","#register",function () {
    $.ajax({
        url:basePath+"/user/register",
        type:"POST",
        datatype:"JSON",
        data:$(this).parents().find("form").serialize(),
        success:function (data) {
            let usernameDiv=$("#registerUsername").parent();
            let passwordDiv=$("#registerPassword").parent();
            let confirmDiv = $("#confirmPassword").parent();
            let emailDiv=$("#registerEmail").parent();
            let phoneDiv=$("#registerPhone").parent();
            let codeDiv=$("#registerCheckedcode").parent();
            //去除表单所有的样式，防止成功的时候，错误的样式会显示
            let form = $("#register").parents().find("form");
            form.find("input").parent().removeClass("has-error");
            form.find("input").parent().removeClass("has-success");
            form.find("input").parent().find("span").text("");
            //将所有信息表示，这个信息可能为空，或者不为空，在后端已经保存

            if (data.code==="200"){
                if (!data.map.checked){
                    codeDiv.addClass("has-error");
                    codeDiv.find("span").text(data.map.checkedText);
                    reset();
                }else {
                    form.find("input").parent().addClass("has-success");
                    codeDiv.find("span").text("");
                    clearForm("#register");
                    location.href=basePath+"/nav/registerSuccess";
                }
            }else {
                reset();
                //将所有警告内容取出来


                if ("undefined"!==data.map.resultMap.username){
                    usernameDiv.addClass("has-error");
                    usernameDiv.find("span").text(data.map.resultMap.username);
                }else {
                    usernameDiv.addClass("has-success");
                    usernameDiv.find("span").text("");
                }
                if ("undefined"!==data.map.resultMap.password){
                    passwordDiv.addClass("has-error");
                    passwordDiv.find("span").text(data.map.resultMap.password);
                }else {
                    passwordDiv.addClass("has-success");
                    passwordDiv.find("span").text("");
                }
                if ("undefined"!==data.map.resultMap.email){
                    emailDiv.addClass("has-error");
                    emailDiv.find("span").text(data.map.resultMap.email);
                }else{
                    emailDiv.addClass("has-success");
                    emailDiv.find("span").text("");
                }
                if ("undefined"!==data.map.resultMap.phone){
                    phoneDiv.addClass("has-error");
                    phoneDiv.find("span").text(data.map.resultMap.phone);
                }else {
                    phoneDiv.addClass("has-success");
                    phoneDiv.find("span").text("");
                }
                if (!data.map.isEmpty){
                    usernameDiv.addClass("has-error");
                    usernameDiv.find("span").text(data.map.isEmptyText);
                }else {
                    usernameDiv.addClass("has-success");
                    usernameDiv.find("span").text("");
                }
                if (!data.map.confirm) {
                    confirmDiv.addClass("has-error");
                    confirmDiv.find("span").text(data.map.confirmText);
                }else {
                    confirmDiv.addClass("has-success");
                    confirmDiv.find("span").text("");
                }
            }
        }
    });
    return false;
})

