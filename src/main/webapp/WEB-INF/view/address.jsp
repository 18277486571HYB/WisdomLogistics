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
    <style>
        #updateAddressModal .modal-content,#addressModal .modal-content{
            background:linear-gradient(to right,white,whitesmoke);
        }
        #setHobbiesBtn{
            background: linear-gradient(to right,#bce8f1,#b9def0);
        }
    </style>
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
                <li ><a href="${basePath}/user/detail?page=1&status=3" } >我的快递</a></li>
                <li ><a href="${basePath}/address/selectAll" >地址簿</a></li>
                <li ><a href="${basePath}/user/list" >个人信息</a></li>
            </ul>
        </div>
        <div class="col-md-7 page-right">
            <div class="row">
                <div class="col-md-12">
                    <ol class=" breadcrumb ">
                        <li><a href="${basePath}/user/detail">用户中心</a></li>
                        <li><a href="${basePath}/address/selectAll">地址簿</a></li>
                    </ol>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 ">
                    <div class="page-right-content">
                        <div class="row"><h3 class="text-center">我的地址</h3></div>
                        <div class="row">
                            <div class="col-md-12" >
                                <c:if test="${sessionScope.addresses!=null}">
                                    <div id="myAddress" >
                                        <table  class="table table-hover " >
                                            <tr>
                                                <th>
                                                    <label for="edit_checkAll" >
                                                        <input type="checkbox" id="edit_checkAll" class="checkAll" name="checked" >
                                                    </label>
                                                </th>
                                                <th>姓名</th>
                                                <th>地址</th>
                                                <th>电话</th>
                                                <th colspan="3">
                                                    <button  data-val="addAddress" class="btn addAddressBtn" id="addAddressBtn">
                                                        <span class="glyphicon glyphicon-plus"></span>
                                                        新增
                                                    </button>
                                                    <button data-val="delAllAddress" class="btn " id="delAllAddressBtn">
                                                        <span class="glyphicon glyphicon-trash"></span>
                                                        批量删除
                                                    </button>
                                                    <button data-val="setHobbies" class="btn " id="setHobbiesBtn">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                        批量设常用
                                                    </button>
                                                </th>
                                            </tr>
                                            <c:forEach items="${sessionScope.addresses.list}" var="address">
                                                <tr>
                                                    <th data-val="${address.id}">
                                                        <label for="edit_checked_item" >
                                                            <input type="checkbox" id="edit_checked_item" class="checked_item" name="checked" >
                                                        </label>
                                                    </th>
                                                    <th data-val="${address.pName}">${address.pName}</th>
                                                    <th data-val="${address.pAddress}">${address.pAddress}</th>
                                                    <th data-val="${address.phone}">${address.phone}</th>
                                                    <th colspan="3">
                                                        <button data-val="" class="btn btn-success" id="editAddressBtn">
                                                            <span class="glyphicon glyphicon-edit"></span>修改
                                                        </button>
                                                        <button data-val="${address.id}" class="btn " id="delAddressBtn">
                                                            <span class="glyphicon glyphicon-trash"></span>
                                                            删除
                                                        </button>
                                                        <c:if test="${address.status=='0'}">
                                                            <button data-val="setHobby" class="btn " id="setHobbyBtn">
                                                                <span class="glyphicon glyphicon-edit"></span>
                                                                设置常用
                                                            </button>
                                                        </c:if>
                                                        <c:if test="${address.status=='1'}" >
                                                            <button   data-val="delHobby" class="btn " id="delHobbyBtn">
                                                                <span class="glyphicon glyphicon-edit"></span>
                                                                取消常用
                                                            </button>
                                                        </c:if>
                                                    </th>
                                                </tr>
                                            </c:forEach>
                                        </table>

                                        <div class="col-md-6">
                                            当前${sessionScope.addresses.pageNum}页，总${sessionScope.addresses.pages}页，总${sessionScope.addresses.total}记录
                                        </div>
                                        <div class="col-md-6">
                                            <nav aria-label="Page navigation">
                                                <ul class="pagination">
                                                    <c:if test="${!sessionScope.addresses.isFirstPage}">
                                                        <li>
                                                            <a href="${basePath}/address/selectAll?page=1" >首页</a>
                                                        </li>
                                                    </c:if>

                                                    <c:if test="${sessionScope.addresses.hasPreviousPage}">
                                                        <li >
                                                            <a href="${basePath}/address/selectAll?page=${sessionScope.pageInfo.pageNum-1}" aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                            </a>
                                                        </li>
                                                    </c:if>

                                                    <c:forEach items="${sessionScope.addresses.navigatepageNums}" var="page_num">
                                                        <c:if test="${page_num==sessionScope.addresses.pageNum}">
                                                            <li class="active" >
                                                                <a href="${basePath}/address/selectAll?page=${page_num}">${page_num}</a>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${page_num!=sessionScope.addresses.pageNum}">
                                                            <li >
                                                                <a href="${basePath}/address/selectAll?page=${page_num}">${page_num}</a>
                                                            </li>
                                                        </c:if>
                                                    </c:forEach>

                                                    <c:if test="${sessionScope.addresses.hasNextPage}">
                                                        <li>
                                                            <a href="${basePath}/address/selectAll?page=${sessionScope.addresses.pageNum+1}" aria-label="Next">
                                                                <span aria-hidden="true">&raquo;</span>
                                                            </a>
                                                        </li>
                                                    </c:if>

                                                    <c:if test="${!sessionScope.addresses.isLastPage}">
                                                        <li>
                                                            <a href="${basePath}/address/selectAll?page=${sessionScope.addresses.pages}">末页</a>
                                                        </li>
                                                    </c:if>

                                                </ul>
                                            </nav>
                                        </div>
                                    </div>

                                </c:if>

                                <c:if test="${sessionScope.addresses==null}">
                                    <div id="userAlert" >
                                        <h3 class="text-center">你的地址为空，可点击<a class="addAddressBtn">添加</a>或者<a href="${basePath}/nav/user">返回</a></h3>
                                    </div>
                                </c:if>
                                <div id="addressModal" class="modal fade" tabindex="-1" role="dialog">
                                    <div class="modal-dialog modal-lg" role="document">
                                        <div class="modal-content" >
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title text-center">添加新地址</h4>
                                            </div>
                                            <div class="modal-body" id="map">
                                                <form class="form-horizontal">
                                                    <div class="form-group">
                                                        <label for="addName" class="col-sm-3 control-label">姓名:</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" name="pName" class="form-control" id="addName" placeholder="姓名">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="addPhone" class="col-sm-3 control-label">电话:</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" name="phone" class="form-control" id="addPhone" placeholder="电话">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="addAddress" class="col-sm-3 control-label">收件人地址:</label>
                                                        <div class="col-sm-8">
                                                            <select class="form-control Address" id="addAddress" name="pAddress">
                                                                <option >-请选择-</option>
                                                                <option >北京市</option>
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
                                                            <select class="form-control City" id="addCity" name="pAddress">
                                                                <option value="">城市</option>
                                                            </select>
                                                            <label for="toDetailAddress"></label>
                                                            <input  type="text" class="form-control Detail" id="addDetailAddress" name="pAddress" placeholder="详细地址">
                                                            <span class="help-block"></span>
                                                        </div>

                                                    </div>

                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button id="resetAddress" type="button" class="btn btn-default" >清空</button>
                                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                <button id="saveAddress" type="button" class="btn btn-primary">保存</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="updateAddressModal" class="modal fade" tabindex="-1" role="dialog">
                                    <div class="modal-dialog modal-lg" role="document">
                                        <div class="modal-content" >
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title text-center">修改地址</h4>
                                            </div>
                                            <div class="modal-body" id="updateMap">
                                                <form class="form-horizontal">
                                                    <div class="form-group">
                                                        <label for="updateAddressName" class="col-sm-3 control-label">姓名:</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" name="pName" class="form-control" id="updateAddressName" placeholder="姓名">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="updateAddressPhone" class="col-sm-3 control-label">电话:</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" name="phone" class="form-control" id="updateAddressPhone" placeholder="电话">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="updateAddress" class="col-sm-3 control-label">收件人地址:</label>
                                                        <div class="col-sm-8">
                                                            <select class="form-control Address" id="updateAddress" name="pAddress">
                                                                <option >-请选择-</option>
                                                                <option >北京市</option>
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
                                                            <label for="updateCity"></label>
                                                            <select class="form-control City" id="updateCity" name="pAddress">
                                                                <option value="">城市</option>
                                                            </select>
                                                            <label for="updateDetailAddress"></label>
                                                            <input  type="text" class="form-control Detail" id="updateDetailAddress" name="pAddress" placeholder="详细地址">
                                                            <span class="help-block"></span>
                                                        </div>

                                                    </div>

                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                <button id="saveUpdateAddress" type="button" class="btn btn-primary">保存</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
    var pageNum="<c:out value='${sessionScope.addresses.pageNum}'/> ";
    var pageSize="<c:out value='${sessionScope.addresses.pageSize}'/> ";
    var total="<c:out value='${sessionScope.addresses.total}' />"
</script>
<script src="${basePath}/js/address.js"></script>
<script>
    $(function () {

    })
</script>
</body>
</html>
