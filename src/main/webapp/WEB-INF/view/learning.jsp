<%--
  Created by IntelliJ IDEA.
  User: 黄渝斌
  Date: 2021/10/10
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/headLink.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>
<%@include file="/common/nav.jsp"%>
<!--学习空间-->
<div class="container-fluid content" id="learning" >
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6 runListening"   >
            <div class="row" >
                <div class="panel panel-primary card" id="card_1" >
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box" viewBox="0 0 16 16">
                                <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5 8 5.961 14.154 3.5 8.186 1.113zM15 4.239l-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"></path>
                            </svg>
                            如何寄件？
                        </h3>
                    </div>
                    <div class="panel-body text-center">
                        <p>
                            1.鼠标滑动到消费者服务，点击<span class="glyphicon glyphicon-hand-right indication"></span>
                            <a class="otherBtn" data-a-id="card_1" href="${basePath}/nav/toLogistics">国内寄件</a>
                        </p>
                        <p>2.正确填写相关信息</p>
                        <p>3.确认信息</p>
                        <p>4.付款，寄件</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="panel panel-success card" id="card_2">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box" viewBox="0 0 16 16">
                                <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5 8 5.961 14.154 3.5 8.186 1.113zM15 4.239l-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"/>
                            </svg>
                            如何查询快递？
                        </h3>
                    </div>
                    <div class="panel-body text-center">
                        <p>
                            1.鼠标滑动到消费者服务，点击<span class="glyphicon glyphicon-hand-right indication"></span>
                            <a class="otherBtn" data-a-id="card_2" href="${basePath}/nav/logistics">快递查询</a>
                        </p>
                        <p>2.正确填写相关信息</p>
                        <p>3.确认信息</p>
                        <p>4.付款，寄件</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="panel panel-success card" id="card_3">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box" viewBox="0 0 16 16">
                                <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5 8 5.961 14.154 3.5 8.186 1.113zM15 4.239l-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"></path>
                            </svg>
                            如何查询网点？
                        </h3>
                    </div>
                    <div class="panel-body text-center">
                        <p>
                            1.鼠标滑动到消费者服务，点击<span class="glyphicon glyphicon-hand-right indication"></span>
                            <a class="otherBtn" data-a-id="card_3" href="${basePath}/nav/site">网点查询</a>
                        </p>
                        <p>2.可搜索网点</p>
                        <p>3.可点击查看全部网点</p>
                        <p>4.鼠标滑动至网点可显示网点信息</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="panel panel-warning card" id="card_4">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box" viewBox="0 0 16 16">
                                <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5 8 5.961 14.154 3.5 8.186 1.113zM15 4.239l-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"></path>
                            </svg>
                            如何查询订单？
                        </h3>
                    </div>
                    <div class="panel-body text-center">
                        <p>
                            1.鼠标滑动到消费者服务，点击<span class="glyphicon glyphicon-hand-right indication"></span>
                            <a class="otherBtn" data-a-id="card_4" href="${basePath}/nav/order">订单查询</a>
                        </p>
                        <p>2.可查看进行中，已完成，已取消的历史订单</p>
                        <p>3.点击订单可查看订单信息</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="panel panel-danger card" id="card_5">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box" viewBox="0 0 16 16">
                                <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5 8 5.961 14.154 3.5 8.186 1.113zM15 4.239l-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"></path>
                            </svg>
                            如何维权？
                        </h3>
                    </div>
                    <div class="panel-body text-center">
                        <p>
                            1.鼠标滑动到消费者服务，点击<span class="glyphicon glyphicon-hand-right indication"></span>
                            <a class="otherBtn" data-a-id="card_5" href="https://w101.ttkefu.com/k/linkurl/?t=2B1ICB8" target="_blank">客服</a>
                        </p>
                        <p>2.可与客服沟通</p>
                        <p>3.沟通无果可进行<a class="otherBtn">投诉</a></p>
                        <p>4.无效沟通建议客户联系律师！</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-1"></div>
        <div class="col-md-2" id="attachNav">
            <ul class="nav nav-pills nav-stacked"  data-spy="affix" id="attNav_1"  >
                <li><a href="#footer" >直达底层</a></li>
                <li><a href="#card_1">如何寄件</a></li>
                <li><a href="#card_2">如何查询快递</a></li>
                <li><a href="#card_3">如何查询网点</a></li>
                <li><a href="#card_4">如何查询订单</a></li>
                <li><a href="#card_5">如何维权</a></li>
                <li><a href="#mainNav">返回顶层</a> </li>
            </ul>
        </div>

    </div>
</div>
<%@include file="/common/footer.jsp"%>




<%@include file="/common/link.jsp"%>
<script>


</script>
</body>
</html>
