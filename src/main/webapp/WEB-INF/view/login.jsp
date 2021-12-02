<%--
  Created by IntelliJ IDEA.
  User: 黄渝斌
  Date: 2021/10/7
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/headLink.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>
    <%@ include file="/common/nav.jsp"%>
    <!--登陆效果-->

    <div  class="container-fluid content" id="loginBackground" >
        <div class="row" >
            <div class="col-md-3"></div>
            <div class="col-md-6" >
                <form class="form-horizontal">
                    <div class="form-group">
                        <div class="col-sm-12">
                            <h1 class="text-center">用户名登录</h1>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label"><span class="glyphicon glyphicon-user"></span></label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="username" name="username" placeholder="用户名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label"><span class="glyphicon glyphicon-lock"></span> </label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control" id="password" name="password" placeholder="密码">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="checkedcode" class="col-sm-2 control-label"><span class="glyphicon glyphicon-check"></span> </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="checkedcode" name="checkedcode" placeholder="验证码">
                            <span class="help-block"></span>
                        </div>
                        <div class="col-sm-4">
                            <a href="javascript:reset();"><img src="${basePath}/captcha" id="captcha" alt="验证码"></a><br/>
                            <h6><a id="toCaptcha" href="javascript:reset();">验证码不清晰？更换换一张</a> </h6>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="login" class="col-sm-2 control-label"></label>
                        <div class="col-sm-8">
                            <%--注意，这里理论上应该是submit，但是会存在表单默认行为--%>
                            <button  type="button" class="btn btn-success col-sm-12 " id="login">登陆</button>
                        </div>
                    </div>


                    <div class="form-group">
                        <label  class="col-sm-2 control-label"></label>
                        <div class="col-sm-8">
                            <p style="float: right"><a class="otherBtn" href="${basePath}/nav/register">免费注册</a></p>
                        </div>
                    </div>

                </form>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>

    <%@include file="/common/footer.jsp"%>
    <%@ include file="/common/link.jsp" %>
    <script type="text/javascript" >
        var basePath="${basePath}";
    </script>
    <script type="text/javascript" src="${basePath}/js/login.js"></script>
</body>
</html>
