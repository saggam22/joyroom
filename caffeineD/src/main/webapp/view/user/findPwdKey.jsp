<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findPwdKey.jsp</title>
<link href="${pageContext.servletContext.contextPath }/css/findIdPwd.css" rel="stylesheet">
</head>
<body>

<div id="container">

<a class="link_move_btn" href="${pageContext.servletContext.contextPath }/view/user/findId.tiles">아이디 찾기</a>
<a class="link_move_btn" href="${pageContext.servletContext.contextPath }/view/user/findPwd.tiles">비밀번호 찾기</a>

	<div>
		${findId }
		<p>
			입력하신 이메일 주소로 인증 코드가 전송되었습니다.<br>
			인증 코드를 입력해 주세요.
		</p>
		
		<form action="makeTempPwd.do" method="post">
			<input type="text" name="input_key" autofocus required><input class="btn" type="submit" value="enter" >
		</form>
		${key }
	</div>

</div>
</body>

</html>