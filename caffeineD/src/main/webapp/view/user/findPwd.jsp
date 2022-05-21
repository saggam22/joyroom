<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findPwd.jsp</title>
<link href="${pageContext.servletContext.contextPath }/css/findIdPwd.css" rel="stylesheet">
</head>
<body>

<div id="container">

<a class="link_move_btn" href="${pageContext.servletContext.contextPath }/view/user/findId.tiles">아이디 찾기</a>
<a class="link_move_btn" href="${pageContext.servletContext.contextPath }/view/user/findPwd.tiles">비밀번호 찾기</a>

	<section id="find_pwd_sec">
			<h2>비밀번호 찾기</h2>
			<div>
					<p>비밀번호를 찾고자 하는 아이디를 입력해 주세요.<br>
					아이디는 이메일 형식입니다.</p>
				<form action="${pageContext.servletContext.contextPath }/userIdCheckForPwd.do" method="post">
					<input type="text" name="id" placeholder="Email" style="width: 250px;" required autofocus>
					<div>
						<input class="btn" type="submit" value="enter">
					</div>
				</form>	
			
			</div>
		</section>
			
</div>
</body>
</html>