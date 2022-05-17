<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userInsert.jsp</title>
</head>
<body>
	<h2>회원가입</h2>
	<form action="${pageContext.servletContext.contextPath }/userInsert.do" method="post" name="insert" onsubmit="return nullCheck()">
		<ul>
			<li>아이디: <input type="email" name="id" placeholder="e-mail"></li>
			<li>닉네임: <input type="text" name="nick"></li>
			<li>비밀번호: <input type="password" name="pwd" onchange="passwordCheck()"/></li>
			<li>비밀번호 확인: <input type="password" name="pwdCheck" onchange="passwordCheck()"/>&nbsp;&nbsp;<span id="check"></span></li>
			<li>연락처: <input type="tel" name="tel" placeholder="-없이 입력하세요"></li>
		</ul>
		<input type="submit" value="회원 가입">
	</form>

	<script>
	
	 
     //입력 null 값 확인
     function nullCheck()
     {
         if(!document.insert.id.value){
             alert("아이디를 입력하세요.");
             return false;
         }
         
         if(!document.insert.pwd.value){
             alert("비밀번호를 입력하세요.");
             return false;
         }
         
         if(!document.insert.nick.value){
             alert("닉네임을 입력하세요.");
             return false;
         }
         
         if(!document.insert.phone.value){
             alert("연락처를 입력하세요.");
             return false;
         }

     }
     
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