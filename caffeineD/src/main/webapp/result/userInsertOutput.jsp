<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userInserOutput.jsp</title>
</head>
<body>
	<h3>등록결과페이지</h3>
		
		<h4>${id } 님의 가입이 완료되었습니다.</h4>
    <a href="${pageContext.servletContext.contextPath }/view/user/login.jsp">로그인하기</a>

</body>
</html>