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
        当前${searchInfo.pageNum}页，总${searchInfo.pages}页，总${searchInfo.total}记录
    </div>
    <div class="col-md-6">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${!searchInfo.isFirstPage}">
                    <li>
                        <a href="${searchInfo}/order/search?page=1&search=${sessionScope.search}">首页</a>
                    </li>
                </c:if>

                <c:if test="${searchInfo.hasPreviousPage}">
                    <li>
                        <a href="${searchInfo}/order/search?page=${pageInfo.pageNum-1}&search=${sessionScope.search}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>

                <c:forEach items="${searchInfo.navigatepageNums}" var="page_num">
                    <c:if test="${page_num==searchInfo.pageNum}">
                        <li class="active"><a>${page_num}</a></li>
                    </c:if>
                    <c:if test="${page_num!=searchInfo.pageNum}">
                        <li><a href="${searchInfo}/order/search?page=${page_num}&search=${sessionScope.search}">${page_num}</a></li>
                    </c:if>
                </c:forEach>

                <c:if test="${searchInfo.hasNextPage}">
                    <li>
                        <a href="${searchInfo}/order/search?page=${searchInfo.pageNum+1}&search=${sessionScope.search}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>

                <c:if test="${!searchInfo.isLastPage}">
                    <li>
                        <a href="${searchInfo}/order/search?page=${searchInfo.pages}&search=${sessionScope.search}">末页</a>
                    </li>
                </c:if>

            </ul>
        </nav>
    </div>
</div>
