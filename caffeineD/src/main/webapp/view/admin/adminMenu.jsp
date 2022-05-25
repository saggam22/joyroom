<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMenu.jsp</title>
<style>
.admin_menu {
	margin:0;
	text-align: left;
}

.menu_btn {
	text-decoration: none;
	display: inline-block;
	width: 80px;
	background: white;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	color: #323232;
	font-size: 14px;
	padding: 7px 0 9px 0;
	text-align: center;
	box-shadow: 0 0 10px 1px rgb(240, 240, 240);
}

.menu_btn:hover {
	background: #d9bba9;
	color: #323232;
}
</style>
</head>
<body>
	<div class="admin_menu">

		<a class="menu_btn" id="user"  href="${pageContext.servletContext.contextPath }/user.do">회원</a> 
		<a class="menu_btn" id="cafe" href="${pageContext.servletContext.contextPath }/cafeList.do?path=admin">카페</a>
		<a class="menu_btn" id="review" href="${pageContext.servletContext.contextPath }/totalReviewList.do">리뷰</a>
		<a class="menu_btn" id="ad" href="${pageContext.servletContext.contextPath }/adList.do">광고</a>

	</div>
</body>
</html>