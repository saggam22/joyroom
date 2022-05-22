<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adReviewInsert.jsp</title>
</head>
<body>

	<div class="admin_menu">
		<a href="${pageContext.servletContext.contextPath }/user.do">회원
			리스트</a> <a
			href="${pageContext.servletContext.contextPath }/totalReviewList.do">리뷰
			리스트</a> <a href="${pageContext.servletContext.contextPath }/adList.do">광고
			리스트</a>
	</div>

	<form
		action="${pageContext.servletContext.contextPath }/adCafeInsert.do"
		method="get">
		<select name="cafe_no">
			<c:forEach items="${cafeList }" var="cafe">
				<option value="${cafe.no }">${cafe.name }</option>
			</c:forEach>
		</select>
		<textarea name="cafe_info"></textarea>
		<button type="submit">등록</button>
	</form>

</body>
</html>