<%@page import="co.dev.service.CafeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<li><a
				href="${pageContext.servletContext.contextPath }/cafeList.do">전체</a></li>
			<li><a
				href="${pageContext.servletContext.contextPath }/cafeRegionList.do?job=susung">수성구</a></li>
			<li><a
				href="${pageContext.servletContext.contextPath }/cafeRegionList.do?job=seogu">서구</a></li>
			<li><a
				href="${pageContext.servletContext.contextPath }/cafeRegionList.do?job=bukgu">북구</a></li>
		</ul>
	</div>
	<div class="cafelist" id="list">
		<hr>
		<div id="bigBox">
			<c:forEach var="cafeinfo" items="${list }">
				<a
					href="${pageContext.servletContext.contextPath }/cafeInfoSelect.do?no=${cafeinfo.no}">
					<img
					src="${pageContext.servletContext.contextPath }/img/cafeimg/${cafeinfo.img }">
					<span>${cafeinfo.name }</span>
				</a>
			</c:forEach>
		</div>

		<jsp:include page="/view/cafe/cafePaging.jsp">
			<jsp:param value="${paging.pageNum}" name="pageNum" />
			<jsp:param value="${paging.startPage}" name="startPage" />
			<jsp:param value="${paging.endPage}" name="endPage" />
			<jsp:param value="${paging.prev}" name="prev" />
			<jsp:param value="${paging.next}" name="next" />
		</jsp:include>
	</div>

</body>
</html>
