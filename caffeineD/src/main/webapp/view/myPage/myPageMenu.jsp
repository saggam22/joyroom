<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageMenu.jsp</title>
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

		<a class="menu_btn" id="my_info"  href="${pageContext.servletContext.contextPath }/myPage.do">내 정보</a> 
		<a class="menu_btn" id="my_post"  href="${pageContext.servletContext.contextPath }/myBoard.do">내 글</a> 
		<a class="menu_btn" id="my_comment" href="${pageContext.servletContext.contextPath }/myComment.do">내 댓글</a>
		<a class="menu_btn" id="my_ review" href="${pageContext.servletContext.contextPath }/myReview.do">내 리뷰</a>
		<a class="menu_btn" id="my_bookmark" href="${pageContext.servletContext.contextPath }/myBookmark.do">내 북마크</a>

	</div>
</body>
</html>