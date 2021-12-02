<%--
  Created by IntelliJ IDEA.
  User: 黄渝斌
  Date: 2021/10/11
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/headLink.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style type="text/css">


        .col-md-6 h3{
            font-size: 30px;
        }

        .progress
        {
            position:relative;
            animation:myfirst 5s;
            -webkit-animation:myfirst 5s; /* Safari and Chrome */
        }

        @keyframes myfirst
        {
            0%   {width: 0}
            100% {width: 100%}
        }

        @-webkit-keyframes myfirst /* Safari and Chrome */
        {
            0%   {width: 0}
            100% {width: 100%}
        }

    </style>
</head>
<body>
<%@include file="/common/nav.jsp"%>
<div  class="container-fluid content" id="registerSuccess">
    <div class="row" >
        <div class="col-md-3"></div>
        <c:if test="${not empty sessionScope.orderNumber}">

            <div class="col-md-6" >
                <c:if test="${sessionScope.price!=0.00}">
                    <h3 class="text-center">
                        <c:if test="${sessionScope.msg=='createOrder'}">
                            寄件成功，您的订单号为
                        </c:if>
                        <c:if test="${sessionScope.msg=='pay'}">
                            有效订单号为
                        </c:if>
                        <c:if test="${sessionScope.msg=='back'}">
                            快递员正在火速赶来，确定取消订单号为
                        </c:if>
                        <a href="${basePath}/order/list">${sessionScope.orderNumber}</a>
                        ，价格为${sessionScope.price}
                        <c:if test="${sessionScope.msg=='back'}">
                            元的订单吗？
                        </c:if>
                        ,可点击
                        <span class="glyphicon glyphicon-hand-right indication"></span>
                        <c:if test="${sessionScope.msg=='pay' || sessionScope.msg=='createOrder'}">
                            <button type="button" class="btn btn-success"
                                    id="pay" name="pay">付款</button>
                            哦！</h3>
                        </c:if>
                        <c:if test="${sessionScope.msg=='payAll'}">
                            <h3>
                            <button type="button" class="btn btn-success"
                                    id="payAll" name="pay">全部付款</button>
                            哦！</h3>
                        </c:if>
                        <c:if test="${sessionScope.msg=='back'}">
                            <h3>
                                <button type="button" class="btn btn-success"
                                    id="back" name="back">确定</button>
                            </h3>
                        </c:if>
                        若订单号为空，说明您对此订单操作无效，或者已经操作过。
                </c:if>
                <c:if test="${sessionScope.price==0.00}">
                    <h3 class="text-center">
                            有效订单号<a href="${basePath}/order/list">${sessionScope.orderNumber}</a>
                            但因你的物品重量过重，需要咨询快递员再做定夺哦！可点击<a href="${basePath}/order/list"> 订单管理</a>
                    </h3>
                </c:if>
                <div style="display: none">
                    <span class="help-block">正在加载...</span>
                    <div class="progress progress-striped active" id="paysuccessDiv"  >
                        <div class="progress-bar progress-bar-success" role="progressbar"
                             aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" id="paysuccess"
                             style="width: 100%">

                        </div>
                    </div>

                </div>
                <div style="display: none" id="payAlert">
                    <h3 class="text-center"></h3>
                </div>

            </div>
        </c:if>
        <c:if test="${empty sessionScope.orderNumber}">
            <div class="col-md-6" >
                <h3 class="text-center">寄件失败！服务器发生了非法访问，请稍后再试！</h3>
            </div>
        </c:if>
        <div class="col-md-3"></div>
    </div>
</div>
<%@include file="/common/footer.jsp"%>
<%@include file="/common/link.jsp"%>
<script>
    var basePath="${basePath}";
</script>
<script>
    $(document).on("click","#pay,#payAll",function () {

        /*
        * 在js中直接拥${sessionScope.orderNumber}有时候会获取失败
        * */

        let array=[];
        array[0]=["加载成功"];
        array[1]=["对接钱包中"];
        array[2]=["正在模拟付款..."];

        $.ajax({
            url:basePath+"/order/update",
            type:"PUT",
            data:"orderNumber="+"<c:out value='${sessionScope.orderNumber}' />",
            success:function (data) {
                counter(array);
                $("#payAlert").find("h3").text(data.map.updateAlert+",可点击");
                $("#payAlert").find("h3").append($("<a></a>").prop("href","${basePath}/order/list").append("订单管理"));

            }
        })
    })
    $(document).on("click","#back",function () {


        let array=[];
        array[0]=["加载成功"];
        array[1]=["对接你的钱包中"];
        array[2]=["正在模拟退款..."];

        $.ajax({
            url:basePath+"/order/backPay",
            type:"PUT",
            data:"orderNumber="+"<c:out value='${sessionScope.orderNumber}' />",
            success:function (data) {
                counter(array);
                $("#payAlert").find("h3").text(data.map.backPayAlert+",可点击");
                $("#payAlert").find("h3").append($("<a></a>").prop("href","${basePath}/order/list").append("订单管理"));
            }
        })
    })

    function counter(array) {

        $("#paysuccessDiv").parent().css("display","");

        let i=0;
        let count=setInterval(function () {
            $("#paysuccessDiv").parent().find(".help-block").text(array[i])
            i++;
            if (i===4){
                setTimeout(function () {
                    $("#paysuccessDiv").parent().find(".help-block").text("")
                    $("#paysuccessDiv").parent().css("display","none");
                    $("#payAlert").css("display","");
                },2000)
                clearInterval(count);
            }
        },700);
    }
    
</script>
</body>
</html>
