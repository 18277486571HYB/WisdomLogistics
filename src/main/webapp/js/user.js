

$(document).on("click","#editUserBtn",function () {
    if(confirm("确定修改你的基本信息吗？")){
        $.ajax({
            url:basePath+"/user/update",
            type: "PUT",
            data:$(this).closest("form").serialize(),
            success:function (data) {
                if (data.code==="200"){
                    $("#editUserBtn").closest("form").css("display","none");
                    $("#userAlert h3").remove();
                    $("#userAlert").css("display","");
                    $("#userAlert").append($("<h3></h3>").addClass("text-center").css(
                        "padding-top","50px").css("padding-bottom","50px").append("修改成功！").append("点击").append($("<a href=''></a>").append("返回").attr("id","backMyMsg")))
                }else {
                    let editUsernameDiv=$("#editUsername").parent();
                    let editPasswordDiv=$("#editPassword").parent();
                    let editEmailDiv=$("#editEmail").parent();
                    let editPhoneDiv=$("#editPhone").parent();
                    let isEmptyText=data.map.isEmptyText;
                    let confirmText=data.map.confirmText;
                    let usename=data.map.resultMap.username;
                    let password=data.map.resultMap.password;
                    let email=data.map.resultMap.email;
                    let phone=data.map.resultMap.phone;
                    editUsernameDiv.find(".help-block").text(isEmptyText);
                    editPasswordDiv.find(".help-block").text(confirmText);
                    $("#editUserBtn").closest("form").find(".form-group").removeClass("has-success");
                    $("#editUserBtn").closest("form").find(".form-group").removeClass("has-error");
                    if ("undefined"!==usename){
                        editUsernameDiv.find(".help-block").text(usename);
                        editUsernameDiv.addClass("has-error");
                    }else {
                        if (isEmptyText!==""){
                            editUsernameDiv.addClass("has-error");
                        }else {
                            editUsernameDiv.addClass("has-success");
                        }
                    }
                    if ("undefined"!==password){
                        editPasswordDiv.find(".help-block").text(password);
                        editPasswordDiv.addClass("has-error");
                    }else {
                        if (confirmText!==""){
                            editPasswordDiv.addClass("has-error");
                        }else {
                            editPasswordDiv.addClass("has-success");
                        }
                    }
                    if ("undefined"!==email){
                        editEmailDiv.find(".help-block").text(email);
                        editEmailDiv.addClass("has-error");
                    }else {
                        editEmailDiv.addClass("has-success");
                    }
                    if ("undefined"!==phone){
                        editPhoneDiv.find(".help-block").text(phone);
                        editPhoneDiv.addClass("has-error");
                    }else {
                        editPhoneDiv.addClass("has-success");
                    }
                }
            }
        })
    }
})







