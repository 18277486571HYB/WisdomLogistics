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
            font-size: 50px;
        }

    </style>
</head>
<body>
<%@include file="/common/nav.jsp"%>
<div  class="container-fluid content" id="registerSuccess">
    <div class="row" >
        <div class="col-md-3"></div>
        <div class="col-md-6" >

            <h3 class="text-center">欢迎注册新用户<span></span>，请<a href="${basePath}/nav/login">登录</a></h3>

        </div>
        <div class="col-md-3"></div>
    </div>
</div>
<%@include file="/common/footer.jsp"%>
<%@include file="/common/link.jsp"%>
</body>
</html>
