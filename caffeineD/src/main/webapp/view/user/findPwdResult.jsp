<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findPwdResult.jsp</title>
<link href="${pageContext.servletContext.contextPath }/css/findIdPwd.css" rel="stylesheet">
</head>
<body>

<div id="container">

<a class="link_move_btn" href="${pageContext.servletContext.contextPath }/view/user/findId.tiles">아이디 찾기</a>
<a class="link_move_btn" href="${pageContext.servletContext.contextPath }/view/user/findPwd.tiles">비밀번호 찾기</a>

	<p>임시 비밀번호가 발급 되었습니다.<br>
	로그인 페이지로 이동하여 로그인해 주세요.<br>
	비밀번호 변경은 마이페이지의 내 정보에서 변경 가능합니다.</p>
	<strong>${tempPwd }</strong>
	
</div>
</body>
</html>