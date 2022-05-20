<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findId.jsp</title>
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

#container {
	text-align: center;
}

a {
	cursor:pointer;
	text-decoration: none;
	display: inline-block;
	width: 200px;
	height: 30px;
	background: rgb(90, 90, 90);
	color: white;
	font-size: 15px;
	padding-top: 6px;
	margin: 30px 0;
}

h2 {
	margin: 50px 0 10px 0;
	font-size: 25pt;
}

p {
	margin: 0 0 35px 0;
}

input {
	border: 0.5px solid rgb(120, 120, 120);
	padding: 10px;
	width: 100px;
}

select {

	padding: 10px;
	width: 100px;
}

.btn {
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

.btn:hover {
	background: rgb(150, 189, 100);
}

p {
	line-height: 17pt;
}

.result {
	font-size: 15px;	
	margin-bottom: 25px;
}

</style>
</head>
<body>
<div id="container">
<c:choose>
	<c:when test="${param.job eq 'findid' }">
		<a href="findIdPwd.jsp?job=findid" style="background: rgb(150, 189, 100);">아이디 찾기</a>
		<a href="findIdPwd.jsp?job=findpwd">비밀번호 찾기</a>
	</c:when>
	<c:otherwise>
		<a href="findIdPwd.jsp?job=findid">아이디 찾기</a>
		<a href="findIdPwd.jsp?job=findpwd" style="background: rgb(150, 189, 100);">비밀번호 찾기</a>
	</c:otherwise>
	
</c:choose>
	<c:choose>
	
		<c:when test="${param.job eq 'findid'}">
		<section id="find_id_sec">
			<h2>아이디 찾기</h2>
			<div id="iFindDiv" name="iFindDiv">
				<p>회원 정보에 등록한 휴대전화 번호를 입력해 주세요.</p>
				<div>
					<select id="iTel1" name="tel1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
					<input id="iTel2" type="text" name="tel2" maxlength="4" >
					<input id="iTel3" type="text" name="tel3" maxlength="4" 
						onkeypress="javascript:iTelEnterPress()">
				</div>
	
				<div>
					<input id="iFindBtn" class="btn" type="submit" value="찾기">
				</div>
			</div>
			<div id="iResultDiv" style="display:none;">
					<p>입력하신 휴대전화 번호로 조회되는 아이디가 있습니다.<br>
					로그인 페이지로 이동하여 로그인해 주세요.</p>
				<div class="result"></div>
			</div>
		</section>
		
		</c:when>
		<c:when test="${param.job eq 'findpwd'}">
		<section id="find_pwd_sec">
			<h2>비밀번호 찾기</h2>
			<div id="bFindDiv">
				<div id="bIdDiv">
					<p>비밀번호를 찾고자 하는 아이디를 입력해 주세요.<br>
					아이디는 이메일 형식입니다.</p>
					<input id="bUserId" type="text" name="id" placeholder="Email" style="width: 250px;" required 
						onkeypress="javascript:idEnterPress()">
					<div>
						<input id="idBtn" class="btn" type="submit" value="입력">
					</div>
				</div>	
				<div id="bTelDiv" style="display: none;">
					<p>입력하신 아이디를 확인하신 후<br>
					회원 정보에 등록한 휴대전화 번호를 입력해 주세요.</p>
					<div class="result"></div>
					<select id="bTel1" name="tel1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
					<input id="bTel2" type="text" name="tel2" maxlength="4">
					<input id="bTel3" type="text" name="tel3" maxlength="4" 
						onkeypress="javascript:bTelEnterPress()">
					<div>
						<input id="bFindBtn" class="btn" type="submit" value="찾기">
					</div>
				</div>
			</div>
		</section>

			<div id="bResultDiv"></div>
		</c:when>
	</c:choose>
</div>
</body>
<script src="${pageContext.servletContext.contextPath }/js/findIdPwd.js"></script>
<script>
	function iTelEnterPress() {
		let keyCode = window.event.keyCode;
		if (keyCode == 13) {
			idFindCallBack();
			
		}
	}
	
	function bTelEnterPress() {
		let keyCode = window.event.keyCode;
		if (keyCode == 13) {
			pwdFindCallBack();
		}

	}
	
	function idEnterPress() {
		let keyCode = window.event.keyCode;
		if (keyCode == 13) {
			idCheckCallBack();
		}
	}
</script>
</html>