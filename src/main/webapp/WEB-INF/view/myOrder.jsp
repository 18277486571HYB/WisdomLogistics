<%--
  Created by IntelliJ IDEA.
  User: 黄渝斌
  Date: 2021/10/23
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/common/headLink.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>用户中心</title>
    <%--    <link rel="stylesheet" href="${basePath}/css/common.css"/>--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>
<%@include file="/common/nav.jsp"%>
<div class="container-fluid page" >
    <div class="row pageContent">
        <div class="col-md-1"></div>
        <div class="col-md-2 page-left">
            <ul  class="nav nav-pills nav-stacked text-center">
                <li class="disabled"><a ><h3 >用户中心</h3></a></li>
            </ul>
            <ul  class="nav nav-pills nav-stacked rightLine">
                <li><a href="${basePath}/user/detail?page=1&status=3" >我的快递</a></li>
                <li ><a href="${basePath}/address/selectAll" >地址簿</a></li>
                <li data-target="#myMsg"><a href="${basePath}/user/list" >个人信息</a></li>
            </ul>
        </div>
        <div class="col-md-7 page-right">
            <div class="row">
                <div class="col-md-12">
                    <ol class=" breadcrumb ">
                        <li><a href="${basePath}/user/detail">用户中心</a></li>
                        <li><a href="${basePath}/user/detail?page=1&status=3">我的快递</a></li>
                    </ol>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 ">
                    <div class="page-right-content">
                        <div class="row">
                            <c:if test="${sessionScope.status==3}">
                                <h3 class="text-center">代签收</h3>
                            </c:if>
                            <c:if test="${sessionScope.status==4}">
                                <h3 class="text-center">已完成</h3>
                            </c:if>
                            <c:if test="${sessionScope.status==6}">
                                <h3 class="text-center">异常快递</h3>
                            </c:if>
                        </div>
                        <div class="row">
                            <div class="col-md-12" >
                                <c:if test="${sessionScope.pageInfo!=null}">
                                    <div id="myOrder" >
                                        <ul class="navbar-nav nav">
                                            <li ><a href="${basePath}/user/detail?page=1&status=3">待签收</a></li>
                                            <li ><a href="${basePath}/user/detail?page=1&status=4">已完成</a></li>
                                            <li ><a href="${basePath}/user/detail?page=1&status=6">异常</a></li>
                                        </ul>
                                        <table class="table table-hover">
                                            <tr>
                                                <th>时间</th>
                                                <th>签收人</th>
                                                <th>地点</th>
                                                <th>电话</th>
                                            </tr>
                                            <c:forEach items="${sessionScope.pageInfo.list}" var="logistics" varStatus="length">
                                                <tr>
                                                    <fmt:formatDate var="dateTime" value="${logistics.orders.oDate}" pattern="yyyy-MM-dd hh:mm:ss"/>
                                                    <th>
                                                        <a data-index="${length.index}" class="btn btn-primary date" type="button" data-toggle="collapse"  aria-expanded="false" aria-controls="collapseExample">
                                                                ${dateTime}
                                                        </a>
                                                    </th>
                                                    <th>${logistics.toName}</th>
                                                    <th>${logistics.toAddress}</th>
                                                    <th>${logistics.toPhone}</th>
                                                </tr>
                                                <tr>
                                                    <th colspan="4">
                                                        <div class="collapse collapseExampl" id="col_${length.index}" >
                                                            <div class="well" style="background-color: white">
                                                                寄件人：${logistics.name}<br/>
                                                                寄件地址：${logistics.address}<br/>
                                                                寄件电话：${logistics.phone}<br/>
                                                                状态：
                                                                <c:if test="${logistics.orders.oStatus=='0'}">
                                                                    未付款
                                                                </c:if>
                                                                <c:if test="${logistics.orders.oStatus=='1'}">
                                                                    已付款
                                                                </c:if>
                                                                <c:if test="${logistics.orders.oStatus=='2'}">
                                                                    未出货
                                                                </c:if>
                                                                <c:if test="${logistics.orders.oStatus=='3'}">
                                                                    运输中
                                                                </c:if>
                                                                <c:if test="${logistics.orders.oStatus=='4'}">
                                                                    已完成
                                                                </c:if>
                                                                <c:if test="${logistics.orders.oStatus=='5'}">
                                                                    已取消
                                                                </c:if>
                                                                <c:if test="${logistics.orders.oStatus=='6'}">
                                                                    丢失
                                                                </c:if>
                                                                <br/>
                                                                2021-10-26 10:35:20 快递被近邻宝签收 请联系快递员<a href="">18277486571</a>
                                                            </div>
                                                        </div>
                                                    </th>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                        <div class="col-md-6">
                                            当前${sessionScope.pageInfo.pageNum}页，总${sessionScope.pageInfo.pages}页，总${sessionScope.pageInfo.total}记录
                                        </div>
                                        <div class="col-md-6">
                                            <nav aria-label="Page navigation">
                                                <ul class="pagination">
                                                    <c:if test="${!sessionScope.pageInfo.isFirstPage}">
                                                        <li >
                                                            <a href="${basePath}/user/detail?page=1&status=${sessionScope.status}" >首页</a>
                                                        </li>
                                                    </c:if>

                                                    <c:if test="${sessionScope.pageInfo.hasPreviousPage}">
                                                        <li >
                                                            <a href="${basePath}/user/detail?page=${sessionScope.pageInfo.pageNum-1}&status=${sessionScope.status}" class="myOrder-list-page" aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                            </a>
                                                        </li>
                                                    </c:if>

                                                    <c:forEach items="${sessionScope.pageInfo.navigatepageNums}" var="page_num">
                                                        <c:if test="${page_num==sessionScope.pageInfo.pageNum}">
                                                            <li class="active" >
                                                                <a >${page_num}</a>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${page_num!=sessionScope.pageInfo.pageNum}">
                                                            <li >
                                                                <a href="${basePath}/user/detail?page=${page_num}&status=${sessionScope.status}">${page_num}</a>
                                                            </li>
                                                        </c:if>
                                                    </c:forEach>

                                                    <c:if test="${sessionScope.pageInfo.hasNextPage}">
                                                        <li >
                                                            <a href="${basePath}/user/detail?page=${sessionScope.pageInfo.pageNum+1}&status=${sessionScope.status}" aria-label="Next">
                                                                <span aria-hidden="true">&raquo;</span>
                                                            </a>
                                                        </li>
                                                    </c:if>

                                                    <c:if test="${!sessionScope.pageInfo.isLastPage}">
                                                        <li>
                                                            <a href="${basePath}/user/detail?page=${sessionScope.pageInfo.pages}&status=${sessionScope.status}">末页</a>
                                                        </li>
                                                    </c:if>

                                                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${sessionScope.pageInfo==null}">
                                    <div id="userAlert" >
                                        <h3 class="text-center">该类订单为空，可点击<a href="${basePath}/logistics/toLogistics">物流寄件</a>
                                        或<a href="${basePath}/user/detail?page=1&status=3">返回</a> </h3>
                                    </div>
                                </c:if>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>
<%@include file="/common/footer.jsp"%>
<%@include file="/common/link.jsp"%>
<link rel="stylesheet" href="${basePath}/css/user.css"/>
<link rel="stylesheet" href="${basePath}/css/common.css"/>
<script>
   $(function () {
        $(".date").click(function () {
            let index=$(this).attr("data-index");
            $("#"+"col_"+index).collapse("toggle");
        });
   })
</script>
</body>
</html>
