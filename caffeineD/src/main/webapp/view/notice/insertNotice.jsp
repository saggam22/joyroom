<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
form ul {
 list-style: none;
}
</style>
</head>
<body>
<form action="${pageContext.servletContext.contextPath }/noticeInsert.do" method="post" enctype="multipart/form-data">
<fieldset>
	  <ul>
		  <li><label><input type="checkbox" name="check" value="checked">공지사항 상단 고정</label></li>
	    <li><label for="title">제목</label>
	      <input id="title" type="text" size="40" name="title"></li>
	    <li><label for="content">내용</label>
	      <textarea cols="60" row="5" id="content" name="content"></textarea></li>
	    <li><label for="file">파일첨부</label>
	      <input id="img" type="file" name="img"></li>
	    <li><button type="submit">등록하기</button></li>
	  </ul>
</fieldset>
</form>
</body>
</html>