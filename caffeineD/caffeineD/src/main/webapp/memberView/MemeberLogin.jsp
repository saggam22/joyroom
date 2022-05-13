<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view/MemeberLogin</title>
</head>
<body>
<h3>로그인페이지</h3>
아이디 : <input type="text" name ="user_id"><br>
비밀번호: <input type="text" name="user_pwd">
<input type="submit" value="로그인">
<input type="button" value="로그인">
<% String id = (String) session.getAttribute("user_id");
if (user_id ==null ) {
out.println("존재하지 않는 아이디입니다.");
}else if ( userId=="user_id" &&)
%>
</body>
</html>