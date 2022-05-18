<%@page import="co.dev.service.CafeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>cafeList.jsp</title>
</head>
<style>
#anchor {
	text-align: center;
}
#anchor li {
	display: inline-block;
	margin: 0 20px;
}
#anchor li a {
	text-decoration: none;
	font-weight: bold;
	cursor: pointer;
}
img {
	width: 200px;
	height: 200px;
}
a {
	display: inline-block;
	margin: 0 20px;
}
</style>
<body>
	<div class=container>
		<ul id="anchor">
			<li><a href="javascript:load('all');">전체</a></li>
			<li><a href="javascript:load('susung');">수성구</a></li>
			<li><a href="javascript:load('seogu');">서구</a></li>
			<li><a href="javascript:load('bukgu');">북구</a></li>
		</ul>
	</div>
	<div class="cafelist" id="list">
		<hr>
		<div id="bigBox">
			<c:forEach var="cafeinfo" items="${list }">
				<a href="view/cafe/cafeInfo.jsp?address=${cafeinfo.address}&name=${cafeinfo.name}&tel=${cafeinfo.tel}&no=${cafeinfo.no}">
					<img src="${pageContext.servletContext.contextPath }/img/${cafeinfo.img }">${cafeinfo.name }
				</a>
			</c:forEach>
		</div>
	</div>
	<div class="pager">
	  <ul class="pagination">
	    <c:if test="${page.prev }">
      	<li><a href="${pageContext.servletContext.contextPath }/cafeList.do?pageNum=${page.startPage - 1 }&amount=${page.amount}">이전</a></li>
			</c:if>
			<c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">
	      <li class="${page.pageNum eq num ? 'active' : '' }">
	        <a href="${pageContext.servletContext.contextPath }/cafeList.do?pageNum=${num }&amount=${page.amount}">${num }</a></li>
      </c:forEach>
      <c:if test="${page.next }">
        <li><a href="${pageContext.servletContext.contextPath }/cafeList.do?pageNum=${page.endPage + 1 }&amount=${page.amount}">다음</a></li>
      </c:if>
    </ul>
	</div>
</body>
</html> 