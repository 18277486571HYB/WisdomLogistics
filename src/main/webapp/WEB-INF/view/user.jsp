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
                    <li ><a href="${basePath}/user/detail?page=1&status=3" >我的快递</a></li>
                    <li ><a href="${basePath}/address/selectAll" >地址簿</a></li>
                    <li ><a href="${basePath}/user/list" >个人信息</a></li>
                </ul>
        </div>
        <div class="col-md-7 page-right">
            <div class="row">
                <div class="col-md-12">
                    <ol class=" breadcrumb ">
                        <li><a href="${basePath}/user/detail">用户中心</a></li>
                        <li><a href="${basePath}/user/list">我的信息</a></li>
                    </ol>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 ">
                    <div class="page-right-content">
                        <div class="row"><h3 class="text-center">我的信息</h3></div>
                        <div class="row">
                            <div class="col-md-12" >
                                <form id="myMsg" class="form-horizontal "  >
                                        <div class="form-group">
                                            <label for="editUsername" class="col-sm-3 control-label"><span class="glyphicon glyphicon-user"></span></label>
                                            <div class="col-sm-6">
                                                <input value="${sessionScope.userMsg.username}"  type="text" class="form-control" id="editUsername" name="username" placeholder="用户名">
                                                <span class="help-block" ></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="editPassword" class="col-sm-3 control-label"><span class="glyphicon glyphicon-lock"></span> </label>
                                            <div class="col-sm-6">
                                                <input value="${sessionScope.userMsg.password}"  type="password" class="form-control" id="editPassword" name="password" placeholder="密码">
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="editEmail" class="col-sm-3 control-label"><span class="glyphicon glyphicon-envelope"></span> </label>
                                            <div class="col-sm-6">
                                                <input value="${sessionScope.userMsg.email}"  type="email" class="form-control" id="editEmail" name="email" placeholder="邮箱">
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="editPhone" class="col-sm-3 control-label"><span class="glyphicon glyphicon-phone"></span> </label>
                                            <div class="col-sm-6">
                                                <input value="${sessionScope.userMsg.phone}" type="text" class="form-control" id="editPhone" name="phone" placeholder="电话">
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="editUserBtn" class="col-sm-3 control-label"></label>
                                            <div class="col-sm-6">
                                                <button  type="button" class="btn btn-success col-sm-12" id="editUserBtn">修改</button>
                                            </div>
                                        </div>
                                    </form>
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
<script >
    var basePath="${basePath}";
</script>
<script type="text/javascript" src="${basePath}/js/user.js"></script>
</body>
</html>
