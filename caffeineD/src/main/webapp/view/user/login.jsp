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
h2 {
	margin-top:80px;
}

.body_btn {
	margin-top: 30px;
	margin-bottom: 15px;
}

p {
	margin: 0 0 35px 0;
}

#kakao-login-btn {	
	display: inline-block;
	margin-bottom: 35px;
}
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
				<label for="uid">Email</label><input id="uid" type="email" name="id"
					required oninvalid="this.setCustomVsalidity('아이디를 입력해주세요.')"
					autofocus>
			</div>
			<div class="inner_section">
				<label for="upwd">Password</label><input id="upwd" type="password"
					name="pwd" required
					oninvalid="this.setCustomValidity('비밀번호를 입력해주세요.')">
			</div>
			<input class="body_btn" type="submit" value="Login">
			<div>

				<a id="kakao-login-btn" href="javascript:loginWithKakao()"> <img
					src="${pageContext.servletContext.contextPath }/img/kakao_login_medium_narrow.png"
					width="150" alt="카카오 로그인 버튼" />
				</a>

			</div>
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




	<p id="token-result"></p>



</body>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
 	Kakao.init('84601a6d23d8e300abd7d586902cde2d');
 	console.log(Kakao.isInitialized());

 	function loginWithKakao() {
 	    Kakao.Auth.login({
 	      success: function(authObj) {
 	        console.log(JSON.stringify(authObj));
 	        Kakao.API.request({
                url: '/v2/user/me',
                success: function(response) {
                	console.log(response);
					let id = "kakao_" + response.id;
                    console.log(id);
                    
                    let properties = response.properties;
                    let nickname = properties.nickname;
                    console.log(JSON.stringify(nickname));
                    let userImg = properties.profile_image;
                    console.log(JSON.stringify(userImg));
                   
                    fetch('../../kakaoLogin.do', {
                    	method: 'post',
            			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            			body: `id=${'${id }'}&nickname=${'${nickname }'}&userImg=${'${userImg }'}`
                    })
                    	.then(result => result.json())
                    	.then(res => {
                    		console.log(`${'${res.messege}'}`);
                    		location.href="<%=request.getContextPath()%>"
                    	})
                    	.catch(error => console.log(error))
                	}
                    
                })
 	      },

 	      fail: function(err) {
 	    	 console.log(JSON.stringify(err));
 	      },
 	    })
 	  }
 	
</script>
</html>