<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findIdResult.jsp</title>
<link href="${pageContext.servletContext.contextPath }/css/findIdPwd.css" rel="stylesheet">
</head>
<body>

<div id="container">

	<a class="link_move_btn" href="${pageContext.servletContext.contextPath }/view/user/findId.tiles">아이디 찾기</a>
	<a class="link_move_btn" href="${pageContext.servletContext.contextPath }/view/user/findPwd.tiles">비밀번호 찾기</a>
	<p>
		입력하신 휴대전화 번호로 조회되는 아이디가 있습니다.<br> 로그인 페이지로 이동하여 로그인해 주세요.
	</p>
	
	<p><strong>${findId }</strong></p>
	
	<a class="login_move_btn" href="${pageContext.servletContext.contextPath }/view/user/login.tiles">로그인 페이지로 이동	</a>

</div>
</body>
</html>