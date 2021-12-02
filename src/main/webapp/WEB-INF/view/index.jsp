<%--
  Created by IntelliJ IDEA.
  User: 黄渝斌
  Date: 2021/10/2
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/headLink.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>智慧物流系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>
<a href="${basePath}/nav/test">集合</a>
<div class="container-fluid">
    <div class="row">
        <%@include file="/common/head.jsp"%>
    </div>
</div>
<%@include file="/common/nav.jsp"%>
<!--轮播效果-->
<div class="container-fluid sideshow" id="sideshow">
    <div class="row" >
        <div  class="col-md-12  col-lg-12 bg-success">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="${basePath}/images/listbox_1.png" alt="...">
                        <div class="carousel-caption">
                            ...
                        </div>
                    </div>
                    <div class="item">
                        <img src="${basePath}/images/listbox_2.png" alt="...">
                        <div class="carousel-caption">
                            ...
                        </div>
                    </div>
                    <div class="item">
                        <img src="${basePath}/images/listbox_3.png" alt="...">
                        <div class="carousel-caption">
                            ...
                        </div>
                    </div>

                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>
</div>
<%@include file="/common/footer.jsp"%>
<%@include file="/common/link.jsp"%>

</body>
</html>
