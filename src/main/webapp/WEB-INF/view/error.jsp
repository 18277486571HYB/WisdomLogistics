<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/headLink.jsp"%>
<!DOCTYPE html>
<html lang="en-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>请求错误</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${basePath}/css/error.css">
</head>

<body>
<div id="wrapper">
    <a class="logo" href=""></a>
    <div id="main">
        <div id="header">
            <h1><span class="icon">!</span>ERROR<span class="sub">Internal Server Error</span></h1>
        </div>
        <div id="content">
            <h2>请求错误！</h2>
            <p>请您高抬贵手，勿绕开权限进行访问！如本网站存在自身问题，请您联系客服进行反馈</p>
            <div class="utilities">
                <div class="input-container" style="font: 13px 'TeXGyreScholaRegular', Arial, sans-serif;color: #696969; text-shadow: 0 1px white;text-decoration: none;">
                    <span id="totalSecond" style="color:red">10</span>秒后自动跳转首页…
                </div>
                <a class="button right" href="#" onclick="history.go(-1);return true;">返回...</a>
                <a class="button right" href="https://w101.ttkefu.com/k/linkurl/?t=2B1ICB8" target="_blank">联系客服</a>
                <div class="clear"></div>
            </div>
        </div>

    </div>
</div>

<!--定义js变量及方法-->
<script language="javascript" type="text/javascript">
    var second = document.getElementById('totalSecond').textContent;

    if (navigator.appName.indexOf("Explorer") > -1) {
        second = document.getElementById('totalSecond').innerText;
    } else {
        second = document.getElementById('totalSecond').textContent;
    }

    setInterval("redirect()", 1000);

    function redirect() {
        if (second < 0) {

            location.href = "${basePath}/nav/index";
        } else {
            if (navigator.appName.indexOf("Explorer") > -1) {
                document.getElementById('totalSecond').innerText = second--;
            } else {
                document.getElementById('totalSecond').textContent = second--;
            }
        }
    }
</script>

</html>