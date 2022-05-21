<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login.jsp</title>
	<link
		href="${pageContext.servletContext.contextPath }/css/findIdPwd.css"
		rel="stylesheet">
<style>
</style>
</head>
<body>
	<c:if test="${!empty error}">
		<script>
			alert("${error }")
		</script>
		<%
		request.getSession().removeAttribute("error");
		%>
	</c:if>
	<div id="container">
		<h2>이메일 로그인</h2>
		<p>가입하신 이메일로 로그인하세요.</p>
		<form action="${pageContext.servletContext.contextPath }/login.do"
			method="post">
			<div class="inner_section">
				<label for="uid">Email</label><input id="uid" type="text" name="id"
					required oninvalid="this.setCustomValidity('아이디를 입력해주세요.')"
					autofocus>
			</div>
			<div class="inner_section">
				<label for="upwd">Password</label><input id="upwd" type="password"
					name="pwd" required
					oninvalid="this.setCustomValidity('비밀번호를 입력해주세요.')">
			</div>
			<input id="login_btn" type="submit" value="Login">
			<div></div>
			<div class="outer_section">
				<a
					href="${pageContext.servletContext.contextPath }/view/user/findId.tiles"><button
						type="button">아이디/비밀번호 찾기</button></a>
			</div>
			<div class="outer_section">
				<a
					href="${pageContext.servletContext.contextPath }/view/user/userInsert.tiles"><button
						type="button">회원 가입</button></a>
			</div>
		</form>
	</div>


	<ul>
		<li onclick="kakaoLogin();"><a href="javascript:void(0)"> <span>카카오
					로그인</span>
		</a></li>
		<li onclick="kakaoLogout();"><a href="javascript:void(0)"> <span>카카오
					로그아웃</span>
		</a></li>
	</ul>

	<p id="token-result"></p>



</body>
<script>
	
</script>
<script src="https://developers.kakao.com/sdk/js/kakao.js">
	Kakao.init('84601a6d23d8e300abd7d586902cde2d');
	console.log(Kakao.isInitialized());

	function kakaoLogin() {
		Kakao.Auth.login({
			success : function(response) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(response) {
						console.log(response)
					},
					fail : function(error) {
						console.log(error)
					},
				})
			},
			fail : function(error) {
				console.log(error)
			},
		})
	}
	//카카오로그아웃  
	function kakaoLogout() {
		if (Kakao.Auth.getAccessToken()) {
			Kakao.API.request({
				url : '/v1/user/unlink',
				success : function(response) {
					console.log(response)
				},
				fail : function(error) {
					console.log(error)
				},
			})
			Kakao.Auth.setAccessToken(undefined)
		}
	}
</script>

</html>