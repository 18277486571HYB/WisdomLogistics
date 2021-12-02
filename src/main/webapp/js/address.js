
$(document).on("blur","#addDetailAddress,#addName",function () {
    if (Checked("",this,"输入不能为空！"));
})

$(document).on("click",".addAddressBtn",function () {
    clearForm(this);
    $("#addressModal").modal({
        backdrop:"static",
        keyboard:true,
    })
})

$(document).on("click","#resetAddress",function () {
    clearForm(this);
})



$(document).on("click","#saveAddress",function () {
    $(this).parents().find("form").find("div").removeClass("has-error");
    $(this).parents().find("form").find("div").removeClass("has-success");
    $(this).parents().find("form").find("div").find(".help-block").text("")
    $.ajax({
        url:basePath+"/address/add",
        type:"PUT",
        data:$(this).parents().find("form").serialize(),
        success:function (data) {

            if (data.code==="200"){
                let sv=$("#saveAddress");
                sv.parents().find("form").find("div").addClass("has-success");
                sv.closest(".modal").modal("hide");
                if ((total+1)%pageSize==0){
                    pageNum+=1;
                }
                location.href=basePath+"/address/selectAll?page="+pageNum;
            }else{
                let nameDiv=$("#addName").parent();
                let phoneDiv=$("#addPhone").parent();
                let detailAddressDiv=$("#addDetailAddress").parent();
                if ("undefined"!==data.map.result.pName){
                    nameDiv.addClass("has-error");
                    nameDiv.find(".help-block").text(data.map.result.pName);
                }else{
                    nameDiv.addClass("has-success");
                }
                if ("undefined"!==data.map.result.phone){
                    phoneDiv.addClass("has-error");
                    phoneDiv.find(".help-block").text(data.map.result.phone);
                }else{
                    phoneDiv.addClass("has-success");
                }
                if ("undefined"!==data.map.result.pAddress){
                    detailAddressDiv.addClass("has-error");
                    detailAddressDiv.find(".help-block").text(data.map.result.pAddress);
                }else{
                    detailAddressDiv.add("has-success");
                }
            }
        }
    })
})

$(document).on("click","#delAddressBtn",function () {
    let id=$(this).attr("data-val");
    let address=$(this).closest("tr").children().eq(2).attr("data-val");
    if (confirm("确定删除地址为【"+address+"】的地址吗？"))
        $.ajax({
            url:basePath+"/address/del",
            type: "delete",
            data:"id="+id,
            success:function (data) {
                if(data.code==="200"){
                    if ((total-1)%pageSize==0){
                        pageNum-=1;
                    }
                    location.href=basePath+"/address/selectAll?page="+pageNum;
                }else {
                    alert("删除失败");
                }
            }
        })
})

$(document).on("click","#editAddressBtn",function () {
    clearToForm("#updateMap form")
    $("#updateAddressModal").modal({
        backdrop:"static",
        keyboard:true,
    })
    let id=$(this).closest("tr").children().eq(0).attr("data-val");
    let name = $(this).closest("tr").children().eq(1).attr("data-val");
    let addresses=$(this).closest("tr").children().eq(2).attr("data-val");
    let phone=$(this).closest("tr").children().eq(3).attr("data-val");
    $("#saveUpdateAddress").attr("data-val",id);
    $("#updateAddressName").attr("value",name);
    $("#updateAddressPhone").attr("value",phone);
    let str = subString(addresses,",");
    $("#updateAddress option:contains("+str[0]+")").attr('selected', true);
    listAddress(str[0]);
    $("#updateCity option:contains("+str[1]+")").attr("selected",true);
    $("#updateDetailAddress").prop("value",str[2])
})

$(document).on("click","#saveUpdateAddress",function () {
    let form = $("#updateAddressModal form");
    let data = form.serialize();
    let id=$(this).attr("data-val");
    $.ajax({
        url:basePath+"/address/update",
        type:"POST",
        data:data+"&id="+id,
        success:function (data) {
            form.find(".form-group").find("div").removeClass("has-error");
            form.find(".form-group").find("div").removeClass("has-success");
            form.find(".form-group").find("div").find(".help-block").text("");
            if (data.code==="200"){
                location.href=basePath+"/address/selectAll?page="+pageNum;
            }else {
                let nameDiv=$("#updateAddressName").parent();
                let phoneDiv=$("#updateAddressPhone").parent();
                let addressDiv=$("#updateAddress").parent();
                if ("undefined"!==data.map.result.pName){
                    nameDiv.addClass("has-error");
                    nameDiv.find(".help-block").text(data.map.result.pName);
                }else {
                    nameDiv.addClass("has-success");
                }
                if ("undefined"!=data.map.result.phone){
                    phoneDiv.addClass("has-error");
                    phoneDiv.find(".help-block").text(data.map.result.phone);
                }else{
                    phoneDiv.addClass("has-success");
                }
                if ("undefined"!=data.map.result.pAddress){
                    addressDiv.addClass("has-error");
                    addressDiv.find(".help-block").text(data.map.result.pAddress);
                }else{
                    addressDiv.addClass("has-success");
                }

            }
        }
    })
})

$(document).on("click","#delAllAddressBtn",function () {
    let ids="";
    let addresses=""
    $.each($(".checked_item:checked"),function () {
       ids+=$(this).closest("th").attr("data-val")+"-";
        addresses+=$(this).closest("tr").find("th").eq(2).attr("data-val")+"-";
    })
    ids=ids.substring(0,ids.length-1);
    addresses=addresses.substring(0,addresses.length-1);
    let confirmAll;
    if (total==0){
        confirm("该表没有员工数据!")
    } else if (ids.length===0){
        confirm("你还未选中，请选择！")
    } else if ($("#edit_checkAll").prop("checked")){
        confirmAll=confirm("你确定全部删除吗？");
    } else {
        confirmAll=confirm("确定要删除这些地址为"+"["+addresses+"]"+"的地址吗?")
    }
    if (confirmAll){
        $.ajax({
            url:basePath+"/address/delAll",
            type:"DELETE",
            data:"ids="+ids,
            success:function (data) {
                if (data.code==="200"){
                    if ((total-$(".checked_item:checked"))%pageSize==0){
                        pageNum-=$(".checked_item:checked");
                    }
                    location.href=basePath+"/address/selectAll?page="+pageNum;
                }else{
                    alert(data.map.delAlert);
                }
            }
        })
    }else{
        $(".checkAll:checked").prop("checked",false)
        $(".checked_item:checked").prop("checked",false)
    }
})

$(document).on("click","#setHobbyBtn",function () {
    let id = $(this).closest("tr").find("th").eq(0).attr("data-val");
    $.ajax({
        url:basePath+"/address/setHobby",
        type:"PUT",
        data:"id="+id,
        success:function (data) {
            if (data.code==="200"){
                location.href=basePath+"/address/selectAll?page="+pageNum;
            }else{alert("错误异常")}
        }
    })
})

$(document).on("click","#setHobbiesBtn",function () {
    let ids="";
    let addresses=""
    $.each($(".checked_item:checked"),function () {
        ids+=$(this).closest("th").attr("data-val")+"-";
        addresses+=$(this).closest("tr").find("th").eq(2).attr("data-val")+"-";
    })
    ids=ids.substring(0,ids.length-1);
    addresses=addresses.substring(0,addresses.length-1);
    let confirmAll;
    if (total==0){
        confirm("该表没有员工数据!")
    } else if (ids.length===0){
        confirm("你还未选中，请选择！")
    } else if ($("#edit_checkAll").prop("checked")){
        confirmAll=confirm("你确定全部设置吗？");
    } else {
        confirmAll=confirm("确定要设置"+"["+addresses+"]"+"这些地址为常用地址吗?")
    }
    if (confirmAll){
        $.ajax({
            url:basePath+"/address/setHobbies",
            type:"PUT",
            data:"ids="+ids,
            success:function (data) {
                if (data.code==="200"){
                    location.href=basePath+"/address/selectAll?page="+pageNum;
                }else{alert("错误异常")}
            }
        })
    }else{
        $(".checkAll:checked").prop("checked",false)
        $(".checked_item:checked").prop("checked",false)
    }

})

$(document).on("click","#delHobbyBtn",function () {
    let id = $(this).closest("tr").find("th").eq(0).attr("data-val");
    $.ajax({
        url:basePath+"/address/delHobby",
        type:"PUT",
        data:"id="+id,
        success:function (data) {
            if (data.code==="200"){
                location.href=basePath+"/address/selectAll?page="+pageNum;
            }else {
                alert("异常错误");
            }
        }
    })
})