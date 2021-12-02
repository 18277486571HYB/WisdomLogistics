<%--
  Created by IntelliJ IDEA.
  User: 黄渝斌
  Date: 2021/10/5
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default " role="navigation" id="mainNav" >
    <div class="container-fluid ">
        <div class="row">
            <div class="col-md-12">
                <div class=" navbar-header" style="margin-left: 10%;margin-right: 5%">
                    <button  type="button" class="navbar-toggle " data-toggle="collapse"
                             data-target="#example-navbar-collapse">
                        <span class="sr-only">切换导航</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a id="brand" class="navbar-brand" href="#">智慧物流系统</a>
                </div>
                <div class=" collapse navbar-collapse " id="example-navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li  class="skip"><a href="${basePath}/nav/index">首页</a></li>
                        <li><a href="https://www.buu.edu.cn/" target="_blank">社区</a></li>

                        <li class="dropdown" >
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                消费者服务
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="skip"><a href="${basePath}/nav/toLogistics" >国内寄件</a></li>
                                <li class="skip"><a href="${basePath}/nav/logistics" >物流查询</a></li>
                                <li class="skip"><a href="${basePath}/nav/site" >网点查询</a></li>
                                <li class="skip"><a href="${basePath}/order/list" data-tar="">订单</a></li>
                                <li class="divider"></li>
                                <li><a href="https://w101.ttkefu.com/k/linkurl/?t=2B1ICB8" target="_blank">客服</a></li>
                            </ul>
                        </li>

                        <li class="dropdown" >
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                学习空间
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="skip skip-2" id="_card_1"><a href="${basePath}/nav/learning/#card_1">如何寄件</a></li>
                                <li class="skip skip-2" id="_card_2"><a href="${basePath}/nav/learning/#card_2">如何查询</a></li>
                                <li class="skip skip-2" id="_card_3"><a href="${basePath}/nav/learning/#card_3">如何查询网点</a></li>
                                <li class="skip skip-2" id="_card_4"><a href="${basePath}/nav/learning/#card_4">如何查询订单</a></li>
                                <li class="skip skip-2" id="_card_5"><a href="${basePath}/nav/learning/#card_5">如何维权</a></li>
                            </ul>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right" id="user-nav-right">
                        <c:if test="${empty sessionScope.user}">
                            <li class="breadcrumb-item skip" id="user-nav-login"><a href="${basePath}/nav/login" >登录</a></li>
                            <li class="breadcrumb-item skip" id="user-nav-register"><a href="${basePath}/nav/register" >注册</a></li>
                        </c:if>

                        <li class="dropdown breadcrumb-item " >
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <span class="glyphicon glyphicon-user"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li ><a href="${basePath}/user/detail" >个人中心</a></li>
                                <c:if test="${not empty sessionScope.user}">
                                    <li class="divider"></li>
                                    <li><a href="${basePath}/nav/login">其他账号登录</a></li>
                                    <li><a href="${basePath}/user/loginOut">注销</a></li>
                                    <li><a href="${basePath}/nav/register">注册中心</a></li>
                                </c:if>
                            </ul>
                        </li>
                        <c:if test="${not empty sessionScope.user}">
                            <li class="breadcrumb-item "><a></a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</nav>
