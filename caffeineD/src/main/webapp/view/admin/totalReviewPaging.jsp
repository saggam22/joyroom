<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<span id="paging">

		<c:url var="action" value="/totalReviewList.do" />
		<c:if test="${param.prev}">
			<a href="${action}?pageNum=${param.startPage-1}">prev</a>
		</c:if>
		<c:forEach begin="${param.startPage}" end="${param.endPage}" step="1"
			var="index">
			<c:choose>
				<c:when test="${param.pageNum==index}">
            ${index}
        </c:when>
				<c:otherwise>
					<a href="${action}?pageNum=${index}">${index}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${param.next}">
			<a href="${action}?pageNum=${param.endPage+1}">next</a>
		</c:if>
	</span>
</body>
</html>