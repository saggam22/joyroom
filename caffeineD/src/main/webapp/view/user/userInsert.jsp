<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userInsert.jsp</title>
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

#user_insert_section {
	text-align: center;
	margin-top: 100px;
}

h2 {
	margin: 50px 0 15px 0;
	font-size: 25pt;
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
	margin-top: 15px;
	color: rgb(120, 120, 120);
}

p {
	margin: 15px 0;
}

form {
	display:inline-block;
	width: 500px;
}

#user_insert_btn {
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

#user_insert_btn:hover {
	background: rgb(150, 189, 100);
}

</style>
</head>
<body>
	<section id="user_insert_section">
	<h2>회원가입</h2>
	<form action="${pageContext.servletContext.contextPath }/userInsert.do" method="post" name="insert">
		<div class="inner_section">
			<label for="uid">아이디(이메일)</label><input id="id" type="email" name="id" placeholder="아이디는 이메일 형식입니다." required
			oninvalid="this.setCustomValidity('아이디를 입력해주세요.')">
		</div>
		<div class="inner_section">
			<label for="nick">닉네임</label><input id="nick" type="text" name="nick" required
			oninvalid="this.setCustomValidity('닉네임을 입력해주세요.')">
		</div>
		<div class="inner_section">
			<label for="upwd">비밀번호</label><input id="upwd" type="password" name="pwd" required
			oninvalid="this.setCustomValidity('비밀번호를 입력해주세요.')">
		</div>
		<div class="inner_section">
			<label for="upwd">비밀번호 확인</label><input id="upwd" type="password" name="pwdCheck"  onchange="passwordCheck()" required
			oninvalid="this.setCustomValidity('비밀번호를 다시 한 번 입력해주세요.')">
		</div>
			<br><span id="check" role="alert"></span>
		<div class="inner_section">
			<label for="upwd">전화번호</label><input id="tel" type="tel" name="tel" placeholder="-없이 입력하세요" required
			oninvalid="this.setCustomValidity('연락처를 입력해주세요.')">
		</div>
			<input id="user_insert_btn" type="submit" value="회원 가입">
	</form>
	</section>
	<script>
	 // 비밀번호와 비밀번호 확인 동일한지 확인
	 function passwordCheck() {
	 		if(document.insert.pwd.value != '' && document.insert.pwdCheck.value != ''){
	 			if(document.insert.pwd.value == document.insert.pwdCheck.value) {
	 				document.getElementById('check').innerHTML='비밀번호가 일치합니다.';
	 				document.getElementById('check').style.color='blue';
	 			}
	 			else {
	 				document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
	 				document.getElementById('check').style.color='red';
	    	}
	 		}
	 }
	</script>
</body>
</html>