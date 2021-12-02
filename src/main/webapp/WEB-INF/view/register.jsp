<%--
  Created by IntelliJ IDEA.
  User: 黄渝斌
  Date: 2021/10/7
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/headLink.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>
    <%@include file="/common/nav.jsp"%>
    <div  class="container-fluid content" id="registerBackground">
        <div class="row" >
            <div class="col-md-3"></div>
            <div class="col-md-6" >
                <form class="form-horizontal" >
                    <div class="form-group">
                        <div class="col-sm-12">
                            <h1 class="text-center">注册</h1>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="registerUsername" class="col-sm-2 control-label"><span class="glyphicon glyphicon-user"></span></label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="registerUsername" name="username" placeholder="用户名">
                            <span class="help-block" ></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="registerPassword" class="col-sm-2 control-label"><span class="glyphicon glyphicon-lock"></span> </label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control" id="registerPassword" name="password" placeholder="密码">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword" class="col-sm-2 control-label"><span class="glyphicon glyphicon-lock"></span> </label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="确认密码">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="registerEmail" class="col-sm-2 control-label"><span class="glyphicon glyphicon-envelope"></span> </label>
                        <div class="col-sm-8">
                            <input type="email" class="form-control" id="registerEmail" name="email" placeholder="邮箱">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="registerPhone" class="col-sm-2 control-label"><span class="glyphicon glyphicon-phone"></span> </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="registerPhone" name="phone" placeholder="电话">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="registerCheckedcode" class="col-sm-2 control-label"><span class="glyphicon glyphicon-check"></span></label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="registerCheckedcode" name="checkedcode" placeholder="验证码">
                            <span class="help-block"></span>
                        </div>
                        <div class="col-sm-4">
                            <a  href="javascript:reset();"><img id="registerCaptcha" src="${basePath}/captcha" alt="验证码"/></a>
                            <h6><a href="javascript:reset();">验证码看不清？再次发送</a> </h6>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="register" class="col-sm-2 control-label"></label>
                        <div class="col-sm-8">
                            <button  type="button" class="btn btn-success col-sm-12" id="register">注册</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label"></label>
                        <div class="col-sm-8">
                            <p style="float: right">&nbsp;<a class="otherBtn" href="${basePath}/nav/login">免费登录</a></p>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
    <%@ include file="/common/footer.jsp"%>


    <%@include file="/common/link.jsp"%>
    <script type="text/javascript">
        var basePath="${basePath}";
    </script>
    <script type="text/javascript" src="${basePath}/js/register.js"></script>

</body>
</html>
