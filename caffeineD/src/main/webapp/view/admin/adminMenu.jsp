<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMenu.jsp</title>
</head>
<body>
	<div class="admin_menu">
		<a class="menu_btn" id="user" href="${pageContext.servletContext.contextPath }/user.do">회원 관리</a> 
		<a class="menu_btn" id="review" href="${pageContext.servletContext.contextPath }/totalReviewList.do">리뷰 관리</a>
		<a class="menu_btn" id="ad" href="${pageContext.servletContext.contextPath }/adList.do">광고 관리</a>
	</div>
</body>
</html>