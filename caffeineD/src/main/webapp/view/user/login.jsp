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
		<label for="uid">아이디</label><input id="uid" type="text" name="id">
		<label for="upwd">비밀번호</label><input id="upwd" type="password" name="pwd"><input type="submit" value="로그인">
	</form>
		<a href="findId.jsp"><button type="button">아이디 찾기</button></a>
		<a href="findPwd.jsp"><button type="button">비밀번호 찾기</button></a>
</body>
</html>