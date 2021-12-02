$(document).on("click","#search",function () {
    var attribute = $("#orderAttribute").val();
    $(this).prop("href",basePath+
        "/order/list?page="+1+"&search="+attribute);
})

$(document).on("click","#otherPayRow,#paySuccessBtn",function () {

    let number=$(this).parent().parent().find("th").eq(2).attr("data-val");
    let price=$(this).parent().parent().find("th").eq(4).attr("data-val");
    let msg=$(this).attr("data-val");
    $.ajax({
        url:basePath+"/order/others",
        type:"post",
        data:"orderNumber="+number+"&msg="+msg,
        success:function (data) {
            $("#payAlert").find("h3").text("");
            if(msg==="pay"){
                if (data.code==="200"){
                    location.href=basePath+"/nav/toLogisticsSuccess";
                }else {
                    $("#payAlert").find("h3").text("该订单已付款");
                    $("#payAlert").slideDown("slow");
                    $("#payAlert").slideUp("slow");
                }
            }else if (msg==="back"){
                if (data.code==="200"){
                    location.href=basePath+"/nav/toLogisticsSuccess";
                }else {
                    $("#payAlert").find("h3").text("该订单已退款");
                    $("#payAlert").slideDown("slow");
                    $("#payAlert").slideUp("slow");
                }
            }

        }
    })
})

$(document).on("click","#del",function () {
    let val=$(this).parent().parent().find("th").eq(2).attr("data-val");
    if (confirm("你确定删除订单号为"+"【"+val+"】"+"订单吗")){
        $.ajax({
            url:basePath+"/order/del",
            type: "delete",
            data: "orderNumber="+val,
            success:function (data) {
                $("#payAlert").find("h3").text(data.map.delAlert);
                $("#payAlert").slideDown("slow");
                $("#payAlert").slideUp("slow");
                location.href=basePath+"/order/list?page="+pageNum;
            }
        })
    }

})



$(document).on("click","#delAll",function () {
    let orderNumber="";
    $.each($(".checked_item:checked"),function () {
        orderNumber+=$(this).parents("tr").find("th:eq(2)").attr("data-val")+"-";
    })
    //去掉后缀多余符号
    orderNumber=orderNumber.substring(0,orderNumber.length-1);
    let confirmAll;
    if (totalPage===0){
        confirm("该表没有员工数据!")
    } else if (orderNumber.length===0){
        confirm("你还未选中，请选择！")
    } else if ($("#checkAll").prop("checked")){
        confirmAll=confirm("你确定全部删除吗？");
    } else {
        confirmAll=confirm("确定要删除"+"["+orderNumber+"]"+"吗?")
    }
    if (confirmAll){
        $.ajax({
            url:basePath+"/order/delAll",
            type:"delete",
            data:"orderNumbers="+orderNumber,
            success:function (data) {
                $("#payAlert").find("h3").text(data.map.delAllAlert);
                $("#payAlert").slideDown("slow");
                $("#payAlert").slideUp("slow");
                location.href=basePath+"/order/list?page="+pageNum;
            }
        })
    }else {
        $("#checkAll").prop("checked",false);
        $.each($(".checked_item:checked"),function () {
            $(this).prop("checked",false);
        })
    }
});

$(document).on("click","#payAll",function () {
    let msg=$(this).attr("data-val");
    let orderNumber="";
    $.each($(".checked_item:checked"),function () {
        orderNumber+=$(this).parents("tr").find("th:eq(2)").attr("data-val")+"-";
    })

    //去掉后缀多余符号
    orderNumber=orderNumber.substring(0,orderNumber.length-1);
    if (orderNumber===""){
        confirm("你未选中，你先勾选")
    }

    $.ajax({
        url:basePath+"/order/others",
        type:"POST",
        data:"orderNumber="+orderNumber+"&msg="+msg,
        success:function (data) {
            if (data.code==="200"){
                location.href=basePath+"/nav/toLogisticsSuccess";
            }else {
                $("#payAlert").find("h3").text(data.map.payAlert);
                $("#payAlert").slideDown("slow");
                $("#payAlert").slideUp("slow");

            }
        }
    })

})