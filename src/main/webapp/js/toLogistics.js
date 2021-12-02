

$(document).on("click","#sender",function () {
    $(".City option").eq(0).prop("value","");
    $(".Address option").eq(0).prop("value","");
    $.ajax({
        url:basePath+"/logistics/toLogistics",
        type:"POST",
        dataType:"JSON",
        data:$(this).parents().find("form").serialize(),
        success:function (data) {
            let form = $("#sender").parents().find("form");
            form.find("input").parent().removeClass("has-error");
            form.find("input").parent().removeClass("has-success");
            form.find("input").parent().find(".help-block").text("");
            if (data.code==="200"){
                form.find("input").parent().addClass("has-success");
                clearForm("#sender");
                location.href=basePath+"/nav/toLogisticsSuccess";
            }else {

                let toAddress=$("#toAddress").parent();
                let toDetailAddress=$("#toDetailAddress").parent();
                let toPhone=$("#toPhone").parent();
                let toName=$("#toName").parent();
                let address=$("#address").parent();
                let phone=$("#customPhone").parent();
                let name=$("#customName").parent();
                let way=$("#toMethod").parent();
                let kinds=$("#kinds").parent();




                if ("undefined"!==data.map.result.address) {
                    address.addClass("has-error");
                    address.find(".help-block").text(data.map.result.addressText_2);

                }else {
                    address.removeClass("has-error");
                    address.addClass("has-success");
                    address.find(".help-block").text("");

                }

                if ("undefined"!==data.map.result.addressText_2 || undefined!==data.map.result.addressText_2 ){
                    address.addClass("has-error");
                    address.find(".help-block").text(data.map.result.addressText_2);

                }

                if ("undefined"!==data.map.result.toAddress){
                    toAddress.addClass("has-error");
                    toAddress.find(".help-block").text(data.map.result.toAdress);

                }else {
                    toAddress.removeClass("has-error");
                    toAddress.addClass("has-success");
                    toAddress.find(".help-block").text("");
                }

                if ("undefined"!==data.map.result.addressText_1 && undefined!==data.map.result.addressText_1 ){
                    toAddress.addClass("has-error");
                    toAddress.find(".help-block").text(data.map.result.addressText_1);

                }


                if ("undefined"!==data.map.result.toPhone){
                    toPhone.addClass("has-error");
                    toPhone.find(".help-block").text(data.map.result.toPhone);
                }else {
                    toPhone.find(".help-block").text("");
                }

                if ("undefined"!==data.map.result.toName){
                    toName.addClass("has-error");
                    toName.find(".help-block").text(data.map.result.toName);
                }else {
                    toName.find(".help-block").text("");
                }



                if ("undefined"!==data.map.result.phone) {
                    phone.addClass("has-error");
                    phone.find(".help-block").text(data.map.result.phone);
                }else {
                    phone.find(".help-block").text("");
                }

                if ("undefined"!==data.map.result.name){
                    name.addClass("has-error");
                    name.find(".help-block").text(data.map.result.name);
                }else {
                    name.find(".help-block").text("");
                }

                if ("undefined"!==data.map.result.way){
                    way.addClass("has-error");
                    way.find(".help-block").text(data.map.result.way);
                }else{
                    way.find(".help-block").text("")
                }

                if ("undefined"!==data.map.result.kinds){
                    kinds.hasClass("has-error");
                    kinds.find(".help-block").text(data.map.result.kinds);
                }else {
                    kinds.find(".help-block").text("");
                }
            }
        }
    })
})

$(document).on("blur","#toDetailAddress,#detailAddress",function () {
    let spanDiv=$(this).parent();
    if ($(this).parent().find("select option").eq(0).prop("selected")
    ||$(this).val()===""||$(this).val().length===0||$(this).val()===null
    ){
        $(this).parent().addClass("has-error");
        spanDiv.find(".help-block").text("请输入地址");

    }else {
        $(this).parent().removeClass("has-error");
        $(this).parent().addClass("has-success");
        spanDiv.find(".help-block").text("");
    }

})

$(document).on("blur","#customName,#toName",function () {
    let spanDiv=$(this).parent();
    if ($(this).val()===""){
        $(this).parent().addClass("has-error");
        $(spanDiv).find(".help-block").text("请输入名字")
    }else {
        $(this).parent().removeClass("has-error");
        $(this).parent().addClass("has-success");
        $(spanDiv).find(".help-block").text("")
    }
})

$(document).on("blur","#weight",function () {
    let spanDiv=$(this).parent().parent();
    if ($(this).val()===""){
        spanDiv.addClass("has-error");
        spanDiv.find(".help-block").text("请输入重量")
    }else {
        spanDiv.removeClass("has-error");
        spanDiv.find(".help-block").text("")
    }
})


var toAddress;
$(document).on("click",".hobbyFirstBtn",function () {
    toAddress="#"+$(this).prop("id");
    $("#toLogisticsModal").modal({
        backdrop:"static",
        keyboard:true,
    })
    toPage(list,basePath+"/address/selectDetail?page=","GET","#logCount","#logPage",0,1,alert);
})

function alert() {
    $("#hobbyMap table").empty();
    $("#hobbyMap table").append($("<thead></thead>").append(
        $("<h3></h3>").append("没有常用地址，可点击").append(
            $("<a></a>").append("地址簿").attr("href",basePath+"/address/selectAll?page=1")
        ).append("进行设置")))
}

function list(data){

    let $table = $("#hobbyMap table");
    $table.empty();
    let addresses=data.map.pageInfo.list;
    $.each(addresses,function (index,items) {
        let name=$("<th></th>").append(items.pName);
        let address=$("<th></th>").append(items.pAddress);
        let phone=$("<th></th>").append(items.phone);
        let sltBtn=$("<th></th>").append(
            $("<button></button>").append("选择").addClass("btn")
                .addClass("btn-success").attr("id","sltBtn")
                .attr("itemId",items.id)
        )
        let tr=$("<tr></tr>").append(name).append(address).append(phone).append(sltBtn)
        $table.append(tr);
    })
}

$(document).on("click","#sltBtn",function () {
    let id=$(this).attr("itemId");
    let name=$(this).closest("tr").find("th").eq(0).text();
    let address=$(this).closest("tr").find("th").eq(1).text();
    let phone=$(this).closest("tr").find("th").eq(2).text();
    $("#"+$(toAddress).attr("data-name")).attr("value",name);
    $("#"+$(toAddress).attr("data-phone")).attr("value",phone);
    let str = subString(address,",");
    $("#"+$(toAddress).attr("data-address")+" option:contains("+str[0]+")").attr("selected",true);
    listAddressById(str[0],"#"+$(toAddress).attr("data-city"));
    $("#"+$(toAddress).attr("data-city")+" option:contains("+str[1]+")").attr("selected",true);
    $("#"+$(toAddress).attr("data-detailAddress")).attr("value",str[2]);
    $("#toLogisticsModal").modal('hide');
    clearFormCss("#lp");
})
