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
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="/common/link.jsp" %>
    <style>
        #toLogisticsModal .modal-content{
            background-color: white;
        }
        #toLogisticsModal .modal-footer{
           border-top-style: hidden;
        }
        .col-md-6{
            padding: 0;
        }
        #toLogisticsModal .modal-content .col-md-6{
            padding: 0;
        }
    </style>
</head>
<body>
    <%@ include file="/common/nav.jsp"%>

    <!--物流配送-->
    <div class="container-fluid content" id="toLogistics" >
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <h1 class="text-center">物流寄送</h1>
                <form class="form-horizontal " id="lp" style="margin: 20px">
                    <div class="form-group">
                        <div class="col-sm-12">
                            <a class="otherBtn" href="${basePath}/nav/logistics">物流查询</a>&nbsp;&nbsp;
                            <a class="otherBtn" href="${basePath}/nav/order">订单管理</a>&nbsp;&nbsp;
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="toAddress" class="col-sm-4 control-label">收件人地址:</label>
                        <div class="col-sm-6">
                            <select class="form-control Address" id="toAddress" name="toAddress">
                                <option value="">-请选择-</option>
                                <option>北京市</option>
                                <option>上海市</option>
                                <option>天津市</option>
                                <option>重庆市</option>
                                <option>河北省</option>
                                <option>山西省</option>
                                <option>内蒙古自治区</option>
                                <option>辽宁省</option>
                                <option>吉林省</option>
                                <option>黑龙江省</option>
                                <option>江苏省</option>
                                <option>浙江省</option>
                                <option>安徽省</option>
                                <option>福建省</option>
                                <option>江西省</option>
                                <option>山东省</option>
                                <option>河南省</option>
                                <option>湖北省</option>
                                <option>湖南省</option>
                                <option>广东省</option>
                                <option>广西壮族自治区</option>
                                <option>海南省</option>
                                <option>四川省</option>
                                <option>贵州省</option>
                                <option>云南省</option>
                                <option>西藏自治区</option>
                                <option>陕西省</option>
                                <option>甘肃省</option>
                                <option>宁夏回族自治区</option>
                                <option>青海省</option>
                                <option>新疆维吾尔族自治区</option>
                                <option>香港特别行政区</option>
                                <option>澳门特别行政区</option>
                                <option>台湾省</option>
                                <option>其它</option>
                            </select>
                            <label for="toCity"></label>
                            <select class="form-control City" id="toCity" name="toAddress">
                                <option value="">城市</option>
                            </select>
                            <label for="toDetailAddress"></label>
                            <input  type="text" class="form-control Detail" id="toDetailAddress" name="toAddress" placeholder="详细地址">
                            <span class="help-block"></span>
                        </div>
                        <div class="col-sm-2">
                            <button id="slt_1"
                                    data-address="toAddress"
                                    data-city="toCity"
                                    data-detailAddress="toDetailAddress"
                                    data-name="toName"
                                    data-phone="toPhone"
                                    data-page="1" type="button"  class="btn btn-success hobbyFirstBtn">选择常用地址</button>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="toName" class="col-sm-4 control-label">收件人姓名:</label>
                        <div class="col-sm-8">
                            <input  type="text" class="form-control col-sm-12" id="toName" name="toName" placeholder="收件人姓名"/>
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="toPhone" class="col-sm-4 control-label">收件人电话:</label>
                        <div class="col-sm-8">
                            <input  type="text" class="form-control col-sm-12" id="toPhone" name="toPhone" placeholder="寄件人电话"/>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <hr>

                    <div class="form-group">
                        <label for="address" class="col-sm-4 control-label">寄件人地址:</label>
                        <div class="col-sm-6">
                            <select class="form-control Address" id="address" name="address">
                                <option value="">-请选择-</option>
                                <option>北京市</option>
                                <option>上海市</option>
                                <option>天津市</option>
                                <option>重庆市</option>
                                <option>河北省</option>
                                <option>山西省</option>
                                <option>内蒙古自治区</option>
                                <option>辽宁省</option>
                                <option>吉林省</option>
                                <option>黑龙江省</option>
                                <option>江苏省</option>
                                <option>浙江省</option>
                                <option>安徽省</option>
                                <option>福建省</option>
                                <option>江西省</option>
                                <option>山东省</option>
                                <option>河南省</option>
                                <option>湖北省</option>
                                <option>湖南省</option>
                                <option>广东省</option>
                                <option>广西壮族自治区</option>
                                <option>海南省</option>
                                <option>四川省</option>
                                <option>贵州省</option>
                                <option>云南省</option>
                                <option>西藏自治区</option>
                                <option>陕西省</option>
                                <option>甘肃省</option>
                                <option>宁夏回族自治区</option>
                                <option>青海省</option>
                                <option>新疆维吾尔族自治区</option>
                                <option>香港特别行政区</option>
                                <option>澳门特别行政区</option>
                                <option>台湾省</option>
                                <option>其它</option>
                            </select>
                            <label for="city"></label>
                            <select class="form-control City" id="city" name="city">
                                <option value="">城市</option>
                            </select>
                            <label for="detailAddress"></label>
                            <input style="margin-top: 5px;" type="text" class="form-control" id="detailAddress" name="address" placeholder="详细地址">
                            <span class="help-block"></span>
                        </div>
                        <div class="col-sm-2">
                            <button id="slt_2"
                                    data-address="address"
                                    data-city="city"
                                    data-detailAddress="detailAddress"
                                    data-name="customName"
                                    data-phone="customPhone"
                                    data-page="1" type="button" class="btn btn-success hobbyFirstBtn">选择常用地址</button>
                        </div>
                    </div>

                    <div class="form-group"  >
                        <label for="customName" class="col-sm-4 control-label">寄件人姓名:</label>
                        <div class="col-sm-8">
                            <input class="form-control col-sm-12" id="customName" name="name" placeholder="您的姓名"/>
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group"  >
                        <label for="customPhone" class="col-sm-4 control-label">电话号码:</label>
                        <div class="col-sm-8">
                            <input class="form-control col-sm-12" id="customPhone" name="phone" placeholder="电话号码"/>
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="toMethod" class="col-sm-4 control-label">快递员取件:</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="toMethod" name="way">
                                <option>服务点自寄</option>
                                <option>上门</option>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <!--折叠的选项-->
                    <div class="form-group" id="toTimeDiv" style="display:none;">
                        <label for="toTime" class="col-sm-4 control-label">上门时间:</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="toTime" name="toTime">
                                <option value="2">两小时之内</option>
                                <option value="4">四小时内</option>
                                <option value="5">6小时内</option>
                                <option disabled="disabled">其他时间请致电</option>
                            </select>
                        </div>
                    </div>



                    <div class="form-group"  >
                        <label for="weight" class="col-sm-4 control-label">物品重量:</label>
                        <div class="col-sm-8" id="weightDiv">
                            <div class="input-group">
                            <span class="input-group-addon ">
                                <span class="glyphicon glyphicon-plus"></span></span>
                                <input type="text" class="form-control col-sm-8 weight" id="weight" name="weight" placeholder="1/kg/请输入正整数" />
                                <span class="input-group-addon ">
                                <span class="glyphicon glyphicon-minus"></span>
                            </span>
                                <!--                            <span class="help-block"></span>-->
                            </div>
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group"  >
                        <label for="kinds" class="col-sm-4 control-label">物品种类:</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="kinds" name="kinds">
                                <option value="1">正常</option>
                                <option value="0">易碎</option>
                                <option disabled="disabled">其他种类请联系最近网点</option>
                            </select>
                            <span class="help-block"> </span>
                        </div>
                    </div>

                    <div class="form-group" style="margin-bottom: 10px" >
                        <label class="col-sm-4"></label>
                        <div class="col-sm-8">
                            <button type="button" class="btn btn-success col-sm-12"
                                    id="sender" name="sender">寄件</button>
                        </div>
                    </div>

                </form>
                <div  id="toLogisticsModal" class="modal fade" tabindex="-1" role="dialog">
                    <div class="modal-dialog modal-lg "  role="document">
                        <div class="modal-content" >
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title text-center">选择地址</h4>
                            </div>
                            <div class="modal-body" id="hobbyMap">
                                <table class="table table-hover">
                                    <tr>
                                        <th>姓名</th>
                                        <th>地址</th>
                                        <th>电话</th>
                                        <th>
                                            操作
                                        </th>
                                    </tr>
                                </table>
                                <div class="col-md-6" id="logCount">

                                </div>
                                <div class="col-md-6" id="logPage">

                                </div>
                            </div>
                            <div class="modal-footer">

                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
    <%@ include file="/common/footer.jsp"%>

</body>
<script type="text/javascript" >
    var basePath = "${basePath}";
</script>
<script src="${basePath}/js/toLogistics.js"></script>
</html>
