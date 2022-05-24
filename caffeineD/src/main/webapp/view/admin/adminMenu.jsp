<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="admin_menu">
		<a href="${pageContext.servletContext.contextPath }/user.do">회원 관리</a> 
		<a href="${pageContext.servletContext.contextPath }/totalReviewList.do">리뷰 관리</a>
		<a href="${pageContext.servletContext.contextPath }/adList.do">광고 관리</a>
	</div>
</body>
</html>