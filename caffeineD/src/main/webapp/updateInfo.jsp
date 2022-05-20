<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateInfo.jsp</title>
</head>
<body>	
	<h2>정보 수정</h2>
	<form action="${pageContext.servletContext.contextPath }/updateInfo.do" method="post">
		아이디: <input type="text" name="id" readonly value="${user.id }"><br>
		비밀번호: <input type="password" name="pwd" value="${user.pwd }"><br>
		닉네임: <input type="text" name="nickname" value="${user.nickname }"><br>
		연락처: <input type="text" name="tel" value="${user.tel }"><br>
		<input style="margin-top:10px;" type="submit" value="수정"> <button style="margin-top:10px;" type="button" onclick="location.href='myPage.jsp'">돌아가기</button>
	</form>	
</body>
</html>