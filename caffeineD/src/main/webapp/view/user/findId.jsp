<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>findId.jsp</title>
	<link href="${pageContext.servletContext.contextPath }/css/findIdPwd.css" rel="stylesheet">
	
</head>
<body>
<div id="container">


		<a class="link_move_btn" href="${pageContext.servletContext.contextPath }/view/user/findId.tiles">아이디 찾기</a>
		<a class="link_move_btn" href="${pageContext.servletContext.contextPath }/view/user/findPwd.tiles">비밀번호 찾기</a>

		<section id="find_id_sec">
			<h2>아이디 찾기</h2>
			<form action="${pageContext.servletContext.contextPath }/userIdCheck.do" method="post">
				<p>회원 정보에 등록한 휴대전화 번호를 입력해 주세요.</p>
				<div>
					<select name="tel1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
					<input type="text" name="tel2" maxlength="4" required autofocus>
					<input type="text" name="tel3" maxlength="4" required>
				</div>
				<div>
					<input class="btn" type="submit" value="enter">
				</div>
			</form>
		
		</section>
		
</div>
</body>

<script>

</script>
</html>