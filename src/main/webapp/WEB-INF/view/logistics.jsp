<%--
  Created by IntelliJ IDEA.
  User: 黄渝斌
  Date: 2021/10/11
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/headLink.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="/common/link.jsp" %>
    <style>
        .panel-body{
            background-color: whitesmoke;
        }
        #logistics .col-md-6{
            padding: 0;
        }
    </style>
</head>
<body>
<%@ include file="/common/nav.jsp"%>
<!--不登录查询快递-->
<div  class="container-fluid content" id="logistics"  >

    <div class="row" >
        <div class="col-md-3"></div>

        <div class="col-md-6" id="main">
            <h1 class="text-center">物流查询</h1>
            <form class="form-horizontal ">
                <div class="form-group">
                    <div class="col-sm-12" >
                        <a class="otherBtn" href="${basePath}/nav/toLogistics">物流寄件</a>&nbsp;&nbsp;
                        <a class="otherBtn" href="${basePath}/nav/order">订单管理</a>&nbsp;&nbsp;
                    </div>
                </div>
                <div class="form-group">
                    <label for="queryByNumber"></label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="queryByNumber" name="queryByNumber" placeholder="请输入订单号">
                    </div>
                    <div class="col-sm-6">
                        <button type="button" class="btn btn-success col-sm-6" id="queryByNumberBtn" name="queryByNumberBtn">订单查询</button>
                    </div>
                </div>

                <div class="form-group">
                    <label for="queryByPhone"></label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="queryByPhone" name="queryByPhone" placeholder="请输入手机号">
                        <span class="help-block"></span>
                    </div>
                    <div class="col-sm-6">
                        <button type="button"  class="btn btn-success col-sm-6" id="queryByPhoneBtn" name="queryByPhoneBtn">手机号查询</button>
                    </div>
                </div>

            </form>
            <div class="panel-collapse collapse ">
                <button style="margin-right: 5px" type="button" class="close"  aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <div class="panel-body">

                </div>
            </div>
        </div>
        <div class="col-md-3"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-1"></div>
                    <div id="list" class="col-md-10">

                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-1"></div>
                <div id="pageCount" class="col-md-5"></div>
                <div id="pageList" class="col-md-5"></div>
                <div class="col-md-1"></div>
            </div>
        </div>
    </div>

</div>

<%@ include file="/common/footer.jsp"%>

<script>
    $(document).on("click","#queryByNumberBtn",function () {
        $("#main .panel-body").empty();
        $(".col").slideUp('slow');
        $("#pageCount").empty();
        $("#pageList").empty();
        let number=$("#queryByNumber").val();
        $.ajax({
            url:basePath+"/logistics/qyN",
            type:"GET",
            data:"number="+number,
            success:function (data) {
                if (data.code==="100"){
                    $("#main .panel-body").append($("<h3></h3>").append("该订单不存在，可点击").append($("<a></a>").append("寄件").attr("href",basePath+"/nav/logistics")));
                }else{
                    let logistics=data.map.msg;
                    let well=$("#main .panel-body");
                    wellList(well,logistics);
                }
                $("#main .collapse").slideDown('slow');
            }
        })
    })

    function wellList(well,logistics){
        well.append(
            "寄件人姓名:"+logistics.name
        ).append("<br/>").append(
            "寄件人电话:"+logistics.phone
        ).append("<br/>").append(
            "寄件地址:"+logistics.address
        ).append("<br/>").append(
            "收件人姓名:"+logistics.toName
        ).append("<br/>").append(
            "收件人电话:"+logistics.toPhone
        ).append("<br/>").append(
            "收件地址:"+logistics.toAddress
        ).append("<br/>").append("状态:")
        let status=logistics.orders.oStatus;
        if (status==='0'){
            well.append("未付款");
        } else if (status==='1'){
            well.append("已付款")
        } else if (status==='2'){
            well.append("未出货");
        } else if (status==='3'){
            well.append("运输中");
        } else if (status==='4'){
            well.append("已完成");
        } else if (status==='5'){
            well.append("已取消");
        } else if (status==='6'){
            well.append("丢失");
        }
        well.append("<br/>").append("2021-10-26 10:35:20 快递被近邻宝签收 请联系快递员").append($("<a></a>").append("18277486571").attr("href","#"))
            .append("<br/>")
        ;
    }

    $(document).on("click","#queryByPhoneBtn",function () {
        $("#main .collapse").slideUp("slow");
        let phone=$("#queryByPhone").val();
        toPage(list,basePath+"/logistics/qyP?phone="+phone+"&page=","GET","#pageCount","#pageList",0,1,_alert);
    })


    var count=1;
    function list(data){
        let list = $("#list");
        list.empty();
        let logistics=data.map.pageInfo.list;
        $.each(logistics,function (index,items) {
            let div= $("<div class='col-md-3'></div>").append(
                $("<div class='panel-collapse collapse col'></div>")
                .append($("<button style='margin-right: 5px'  type='button' class='close' aria-label='Close'></button>").append($("<span aria-hidden='true'></span>").append("&times;")))
                .append($("<div  class='panel-body aj'></div>").attr("id","t_"+index))
            )
            list.append(div);
            wellList($("#t_"+index),items);
        })
        if (count===1){
            $(".col").slideDown('slow');
            count=0;
        }else{
            $(".col").removeClass("collapse")
        }
    }

    function _alert(){
        let list=$("#list");
        list.empty();
        let div= $("<div class='col-md-12'></div>").append(
            $("<div class='panel-collapse collapse col'></div>")
                .append($("<button style='margin-right: 5px'  type='button' class='close' aria-label='Close'></button>").append($("<span aria-hidden='true'></span>").append("&times;")))
                .append($("<div  class='panel-body aj'></div>").append($("<h3 class='text-center'></h3>").append("你还没有订单，可点击").append($("<a></a>").append("寄件").attr("href",basePath+"/nav/toLogistics")))
                )
        )
        list.append(div);
        $(".col").slideDown('slow')
    }

    $(document).on("click","#main .collapse .close",function () {
        $("#main .collapse").slideUp('slow')
    })
    $(document).on("click",".col",function () {
        $(this).slideUp('slow')
    })
</script>
</body>
</html>
