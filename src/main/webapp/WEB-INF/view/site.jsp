<%--
  Created by IntelliJ IDEA.
  User: 黄渝斌
  Date: 2021/10/8
  Time: 13:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/headLink.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>
    <%@ include file="/common/nav.jsp"%>
    <!--网点查询-->
    <div class="container-fluid content" id="querySite" >
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <h1 class="text-center">网点查询</h1>
                <a class="callback otherBtn" href="">返回上一级</a>

                <form class="form-horizontal " style="margin-top: 20px" >
                    <div class="form-group">
                        <label for="site"></label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="site" name="site" placeholder="网点关键字">
                            <span class="help-block"></span>
                        </div>
                        <div class="col-sm-4">
                            <a href="${basePath}/nav/alert"  class="btn btn-success col-sm-12 glyphicon glyphicon-search" id="queryBySite" ></a>
                        </div>
                    </div>
                </form>

                <div class="row" style="margin: 0;padding: 0;">
                    <div class="col-md-6" style="margin: 0;padding: 0;">
                        <h5 class="text-center siteHeader" >全部<span class="glyphicon glyphicon-chevron-right"></span></h5>
                        <div class="siteContent" style="display: none;">
                            <hr>
                            <p class="text-center"><a  data-placement="left"  data-toggle="popover" data-trigger="hover" title="地址：" data-content="北四环东路97号；电话：18277486571">北四环校区校园营业站</a></p>
                            <hr>
                            <p class="text-center">更多合作中...</p>
                        </div>
                    </div>
                    <div class="col-md-6" style="margin: 0;padding: 0; ">
                        <h5 class="text-center siteHeader" id="siteHeader_2">近邻宝<span class="glyphicon glyphicon-chevron-right"></span></h5>
                        <div class="siteContent" style="display: none;">
                            <hr>
                            <p class="text-center">南院一号柜二号柜足球场旁</p>
                            <hr>
                            <p class="text-center">北院三号柜北院食堂旁</p>
                            <hr>
                            <p class="text-center">更多待合作中</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3"></div>
        </div>

    </div>
    <%@include file="/common/footer.jsp"%>

    <%@ include file="/common/link.jsp"%>
    <script type="text/javascript">


    </script>
</body>
</html>
