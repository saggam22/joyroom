<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminPage.jsp</title>
</head>
<body>
	
	<div id="container">
	
		<a href="${pageContext.servletContext.contextPath }/user.do">회원 리스트</a>
		<a href="${pageContext.servletContext.contextPath }/totalReviewList.do">리뷰 리스트</a>
		<a href="${pageContext.servletContext.contextPath }/adList.do">광고 리스트</a>
		
	</div>
</body>
</html>