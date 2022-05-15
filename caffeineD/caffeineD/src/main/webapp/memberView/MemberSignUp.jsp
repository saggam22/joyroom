<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>회원가입페이지</h3>
<form action="../memberSignUp.do" method="post" enctype="multipart/form-data">
아이디 : <input type="text" name ="id"><br>
비밀번호: <input type="text" name="passwd"><br>
<input type="submit" value="추가">
</form>
</body>
</html>