<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@charset "UTF-8";

@import
	url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css')
	;

* {
	font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui,
		Roboto, 'Helvetica Neue', 'Segoe UI', 'Apple SD Gothic Neo',
		'Noto Sans KR', 'Malgun Gothic', sans-serßif;
	font-size: 10pt;
	box-sizing: border-box;
}

#notice_insert_section {
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
}

input {
	border: none;
	padding: 10px;
	width: 300px;
}

.inner_section {
	display: inline-block;
	width: 450px;
	border: none;
	border: 0.5px solid rgb(120, 120, 120);
	margin-top: 15px;
	color: rgb(120, 120, 120);
	text-align: left;
}

form {
	display: inline-block;
	width: 500px;
}

textarea {
	width: 100%;
	height: 6.25em;
	border: none;
	resize: none;
}

#notice_insert_btn {
	cursor: pointer;
	font-weight: 700;
	text-decoration: none;
	display: inline-block;
	width: 100px;
	height: 45px;
	border-radius: 30px;
	background: rgb(90, 90, 90);
	color: white;
	font-size: 15px;
	padding-top: 12px;
	margin: 30px 0;
}

#notice_insert_btn:hover {
	background: rgb(150, 189, 100);
}
</style>
</head>
<body>
	<section id="notice_insert_section">
		<h2 style="margin-top: 10px;">글을 작성하는 공간입니다.</h2>
		<form
			action="${pageContext.servletContext.contextPath }/boardWrite.do"
			method="post" enctype="multipart/form-data">
			<div class="inner_section">
				<label for="title" style="text-align: left">제목</label><input
					id="title" type="text" size="40" name="title">
			</div>
			<div class="inner_section">
				<label for="content">내용</label>
				<textarea cols="60" row="5" id="content" name="content"></textarea>
			</div>
			<div class="inner_section">
				<label for="img">파일첨부</label><input id="nfile" type="file"
					name="img">
			</div>
			<input id="notice_insert_btn" type="submit" value="등록하기"> <a
				href="${pageContext.servletContext.contextPath }/board.do"><input
				id="notice_insert_btn" type="button" value="돌아가기"></a>
		</form>
	</section>
</body>
</html>