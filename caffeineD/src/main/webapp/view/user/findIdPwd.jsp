<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findId.jsp</title>
</head>
<body>
	<a href="findIdPwd.jsp?job=findid"><button type="button">아이디
			찾기</button></a>
	<a href="findIdPwd.jsp?job=findpwd"><button type="button">비밀번호
			찾기</button></a>
	<c:choose>
		<c:when test="${param.job eq 'findid'}">
			<h2>아이디 찾기</h2>
			<div id="iFindDiv" name="iFindDiv">
				<p>회원 정보에 등록한 휴대전화 번호를 입력해 주세요.</p>
				<input id="iTel1" type="text" name="tel1" maxlength="3" placeholder="000">-
				<input id="iTel2" type="text" name="tel2" maxlength="4" placeholder="0000">-
				<input id="iTel3" type="text" name="tel3" maxlength="4" placeholder="0000">
				<input id="iFindBtn" type="submit" value="찾기">
			</div>
			<div id="iResultDiv"></div>
		</c:when>
		<c:when test="${param.job eq 'findpwd'}">
			<h2>비밀번호 찾기</h2>
			<div id="bFindDiv">
				<div id="bIdDiv">
					<p>비밀번호를 찾고자하는 아이디를 입력해 주세요.</p>
					<input id="bUserId" type="text" name="id" placeholder="이메일" required>
					<input id="idBtn" type="submit" value="입력"><br>
				</div>	
				<div id="bTelDiv" style="display: none;">
					<p id="findId"></p>
					<p>회원 정보에 등록한 휴대전화 번호를 입력해 주세요.</p>
					<input id="bTel1" type="text" name="tel1" maxlength="3" placeholder="000"> 
					<input id="bTel2" type="text" name="tel2" maxlength="4" placeholder="0000">
					<input id="bTel3" type="text" name="tel3" maxlength="4" placeholder="0000">
					<input id="bFindBtn" type="submit" value="찾기">
				</div>
			</div>
			<div id="bResultDiv"></div>
		</c:when>
	</c:choose>
</body>
<script src="../../js/findIdPwd.js"></script>

</html>