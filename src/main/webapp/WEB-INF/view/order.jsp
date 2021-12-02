<%--
  Created by IntelliJ IDEA.
  User: 黄渝斌
  Date: 2021/10/8
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/headLink.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%@ include file="/common/link.jsp"%>
    <style>
        .table{
            border-top-style: hidden;
            margin-bottom: 100px;
        }
        .col-md-4,.col-md-8{
            padding: 0;
        }

        #paySuccessBtn{
            background-color: #9acfea;
        }
        #connectBtn{
            background-color: #e4b9b9;
        }
        #queryBtn{
            background-color: #c8e5bc;
        }
        #connectorBtn{
            background-color: #f0ad4e;
        }
        #secondOrderBtn{
            background-color: #c8e5bc;
        }

        #payAlert {
            border-radius: 15px 30px;
            background-color: #afd9ee;
        }

    </style>
</head>
<body>
    <%@ include file="/common/nav.jsp"%>

    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <form class="form-horizontal " style="margin-top: 20px" >
                    <div class="form-group">
                        <label for="orderAttribute"></label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="orderAttribute" name="orderAttribute" placeholder="订单关键字"/>
                        </div>
                        <div class="col-sm-4">
                            <a  class="btn btn-success col-sm-12 glyphicon glyphicon-search" id="search" href="" ></a>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-3"></div>
        </div>
        <div class="row" style="margin-bottom: 10px">
            <div class="col-md-7">
                <div id="payAlert" class="panel-collapse collapse ">
                    <div class="panel-body">
                        <h3></h3>
                    </div>
                </div>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-4">
                <c:if test="${sessionScope.search!='all'}">
                    <a href="${basePath}/order/list?page=1" class="btn btn-primary text-center">
                        <span>去首页</span>
                    </a>
                </c:if>
                <button data-val="payAll" class="btn btn-primary text-center" id="payAll">
                    <span class="glyphicon glyphicon-credit-card"></span>
                    <span>全部付款</span>
                </button>
                <a class="btn btn-success" href="${basePath}/nav/toLogistics">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                </a>
                <button class="btn btn-warning" id="delAll">
                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>全部删除
                </button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>
                            <label for="checkAll" >
                                <input type="checkbox" class="checkAll"  name="checkAll" id="checkAll">
                            </label>
                        </th>
                        <th>日期</th>
                        <th>订单号</th>
                        <th>价格</th>
                        <th>状态</th>
                        <th>网点</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${sessionScope.pageInfo.list}" var="order">
                            <tr>
                                <th>
                                    <label for="checked_item" >
                                        <input type="checkbox" id="checked_item" class="checked_item" name="checked" >
                                    </label>

                                </th>
                                <fmt:formatDate var="dateTime" value="${order.oDate}" pattern="yyyy-MM-dd hh:mm:ss"/>
                                <th>${dateTime}</th>
                                <th data-val="${order.oNumber}">${order.oNumber}</th>
                                <th data-val="${order.oPrice}">${order.oPrice}</th>
                                <th data-val="${order.oStatus}">
                                    <c:if test="${order.oStatus=='0'}">
                                        未付款
                                    </c:if>
                                    <c:if test="${order.oStatus=='1'}">
                                        已付款
                                    </c:if>
                                    <c:if test="${order.oStatus=='2'}">
                                        未出货
                                    </c:if>
                                    <c:if test="${order.oStatus=='3'}">
                                        运输中
                                    </c:if>
                                    <c:if test="${order.oStatus=='4'}">
                                        已完成
                                    </c:if>
                                    <c:if test="${order.oStatus=='5'}">
                                        已取消
                                    </c:if>
                                    <c:if test="${order.oStatus=='6'}">
                                        丢失
                                    </c:if>
                                </th>
                                <th>${order.oSId}</th>
                                <th>
                                    <c:if test="${order.oStatus=='0'}">
                                        <button data-val="pay" class="btn btn-success" id="otherPayRow">
                                            <span class="glyphicon glyphicon-credit-card"></span>
                                            付款
                                        </button>
                                    </c:if>
                                    <c:if test="${order.oStatus=='1'}">
                                        <button data-val="back" class="btn " id="paySuccessBtn">
                                            <span class="glyphicon glyphicon-credit-card"></span>
                                            退款
                                        </button>
                                    </c:if>
                                    <c:if test="${order.oStatus=='2'}">
                                        <button  data-val="connect" class="btn " id="connectBtn">
                                            <span class="glyphicon glyphicon-credit-card"></span>
                                            快递员
                                        </button>
                                    </c:if>
                                    <c:if test="${order.oStatus=='3'}">
                                        <button data-val="logistics" class="btn " id="queryBtn">
                                            <span class="glyphicon glyphicon glyphicon-search"></span>
                                            物流
                                        </button>
                                    </c:if>
                                    <c:if test="${order.oStatus=='4'|| order.oStatus=='-1'}">
                                        <button data-val="connector" class="btn " id="connectorBtn">
                                            <span class="glyphicon glyphicon-envelope"></span>
                                            售后
                                        </button>
                                    </c:if>
                                    <c:if test="${order.oStatus=='-2'}">
                                        <button data-val="secondOrder" class="btn " id="secondOrderBtn">
                                            <span class="glyphicon glyphicon-plus"></span>
                                            再来一单
                                        </button>
                                    </c:if>
                                    <c:if test="${order.oStatus!='-2' && order.oStatus!='-1'}">
                                        <button data-val="del" class="btn btn-warning" id="del">
                                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除
                                        </button>
                                    </c:if>
                                </th>
                            </tr>

                    </c:forEach>
                </table>
            </div>
        </div>
        <div class="row">
            <c:if test="${sessionScope.search=='all'}">
                <%@ include file="/common/page.jsp"%>
            </c:if>
        </div>
    </div>
    <%@include file="/common/footer.jsp"%>

    <script type="text/javascript">
        var basePath="${basePath}";
        var pageNum="<c:out value='${sessionScope.pageInfo.pageNum}' />";
        var totalPage="<c:out value='${sessionScope.pageInfo.pages}' />";
    </script>
    <script type="text/javascript" src="${basePath}/js/order.js">
    </script>
</body>
</html>
