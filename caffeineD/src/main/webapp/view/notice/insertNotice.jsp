<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertNotice.jsp</title>
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
	background: #f6f6f6
}

.inner_section {
	display: inline-block;
	width: 450px;
	border:none;
	border: 0.5px solid rgb(120, 120, 120);
	margin-top: 15px;
	color: rgb(120, 120, 120);
	text-align: left;
}

form {
	display:inline-block;
	width: 500px;
}

textarea {
    width: 100%;
    height: 6.25em;
    border: none;
    resize: none;
    background: #f6f6f6
  }

#notice_insert_btn {
	cursor:pointer;
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
	background: #d9bba9;
}
</style>
</head>
<body>
	<section id="notice_insert_section">
		<h2>NOTICE</h2>
		<form action="${pageContext.servletContext.contextPath }/noticeInsert.do" method="post" enctype="multipart/form-data">
			<div class="inner_section">
				<label for="check" style="width:100px">공지사항 상단 고정</label><input style="width:50px" type="checkbox" name="check" value="checked">
			</div>
			<div class="inner_section">
				<label for="title" style="text-align:left">제목</label><input id="title" type="text" size="40" name="title">
			</div>
			<div class="inner_section">
				<label for="content">내용</label><textarea cols="60" row="5" id="content" name="content"></textarea>
			</div>
			<div class="inner_section">
				<label for="nfile">파일첨부</label><input id="nfile" type="file" name="nfile">
			</div>
				<input id="notice_insert_btn" type="submit" value="등록하기">
		</form>
	</section>
</body>
</html>