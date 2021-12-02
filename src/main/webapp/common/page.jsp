<%--
  Created by IntelliJ IDEA.
  User: 黄渝斌
  Date: 2021/9/12
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col-md-6">
        当前${sessionScope.pageInfo.pageNum}页，总${sessionScope.pageInfo.pages}页，总${sessionScope.pageInfo.total}记录
    </div>
    <div class="col-md-6">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${!sessionScope.pageInfo.isFirstPage}">
                    <li>
                        <a href="${basePath}/order/list?page=1&search=${sessionScope.search}">首页</a>
                    </li>
                </c:if>

                <c:if test="${sessionScope.pageInfo.hasPreviousPage}">
                    <li>
                        <a href="${basePath}/order/list?page=${sessionScope.pageInfo.pageNum-1}&search=${sessionScope.search}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>

                <c:forEach items="${sessionScope.pageInfo.navigatepageNums}" var="page_num">
                    <c:if test="${page_num==sessionScope.pageInfo.pageNum}">
                        <li class="active"><a>${page_num}</a></li>
                    </c:if>
                    <c:if test="${page_num!=sessionScope.pageInfo.pageNum}">
                        <li><a href="${basePath}/order/list?page=${page_num}&search=${sessionScope.search}">${page_num}</a></li>
                    </c:if>
                </c:forEach>

                <c:if test="${sessionScope.pageInfo.hasNextPage}">
                    <li>
                        <a href="${basePath}/order/list?page=${sessionScope.pageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>

                <c:if test="${!sessionScope.pageInfo.isLastPage}">
                    <li>
                        <a href="${basePath}/order/list?page=${sessionScope.pageInfo.pages}">末页</a>
                    </li>
                </c:if>

            </ul>
        </nav>
    </div>
</div>
