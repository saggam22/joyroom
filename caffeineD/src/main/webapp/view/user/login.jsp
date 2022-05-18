<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
</head>
<body>
	<c:if test="${!empty error}">
		<script>
			alert("${error }")
		</script>
		<% request.getSession().removeAttribute("error"); %>
	</c:if>	

	<h2>로그인</h2>
	<form action="${pageContext.servletContext.contextPath }/login.do" method="post">
		<input id="uid" type="text" name="id" placeholder="아이디">
		<input id="upwd" type="password" name="pwd" placeholder="비밀번호"><input type="submit" value="로그인">
	</form>
		<a href="findIdPwd.jsp?job=findid"><button type="button">아이디 찾기</button></a>
		<a href="findIdPwd.jsp?job=findpwd"><button type="button">비밀번호 찾기</button></a>
</body>
</html>