<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteBoard.jsp</title>
</head>
<body>
	<h3>글삭제</h3>
	<form action="board.do" method="post">
		삭제할 글의 작성자: <input type="text" name="user" value="${board.user }"><br>
		<input type="submit" value="삭제">
	</form>
</body>
</html>