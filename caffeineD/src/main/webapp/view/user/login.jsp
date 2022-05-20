<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<style>
@charset "UTF-8";
@import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');

* { 
	font-family: Pretendard, -apple-system, BlinkMacSystemFont, 
	system-ui, Roboto, 'Helvetica Neue', 'Segoe UI', 'Apple SD Gothic Neo', 
	'Noto Sans KR', 'Malgun Gothic', sans-serßif;
	font-size: 10pt;
	box-sizing: border-box;
}

#login_section {
	text-align: center;
	margin-top: 100px;
}

h2 {
	margin: 0 0 10px 0;
	font-size: 25pt;
}

p {
	margin: 0 0 35px 0;
}

label {	
	display: inline-block;
	width: 80px;
	text-align: left;
}

input {
	border: none;
	padding: 10px;
	width: 300px;
}

.inner_section {
	display: inline-block;
	width: 400px;
	border:none;
	border: 0.5px solid rgb(120, 120, 120);
	margin-bottom: 15px;
	color: rgb(120, 120, 120);
}

form {
	display:inline-block;
	width: 500px;
}

#login_btn {
	cursor:pointer;
	font-weight: 700;
	text-decoration: none;
	display: inline-block;
	width: 100px;
	height: 50px;
	border-radius: 30px;
	background: rgb(90, 90, 90);
	color: white;
	font-size: 15px;
	padding-top: 12px;
	margin: 30px 0;
}

#login_btn:hover {
	background: rgb(150, 189, 100);
}

.outer_section button {
	border: none;
	background: none;
	cursor:pointer;
	margin-bottom: 10px;
}

</style>
</head>
<body>
	<c:if test="${!empty error}">
		<script>
			alert("${error }")
		</script>
		<% request.getSession().removeAttribute("error"); %>
	</c:if>	
<section id="login_section">
	<h2>이메일 로그인</h2>
	<p>가입하신 이메일로 로그인하세요.</p>
	<form action="${pageContext.servletContext.contextPath }/login.do" method="post">
	<div class="inner_section">
		<label for="uid">Email</label><input id="uid" type="text" name="id" required
			oninvalid="this.setCustomValidity('아이디를 입력해주세요.')">
	</div>
	<div class="inner_section">
		<label for="upwd">Password</label><input id="upwd" type="password" name="pwd" required
			oninvalid="this.setCustomValidity('비밀번호를 입력해주세요.')">
	</div>
		<input id="login_btn" type="submit" value="Login">
	<div class="outer_section">
		<a href="findIdPwd.jsp?job=findid"><button type="button">아이디/비밀번호 찾기</button></a>
	</div>
	<div class="outer_section">
		<a href="${pageContext.servletContext.contextPath }/view/user/userInsert.tiles"><button type="button">회원 가입</button></a>
	</div>
	</form>
</section>
</body>
</html>