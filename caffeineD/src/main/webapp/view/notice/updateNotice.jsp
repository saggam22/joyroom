<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

form ul {
 list-style: none;
}
</style>
</head>
<body>
<form action="${pageContext.servletContext.contextPath }/noticeUpdate.do" method="post" enctype="multipart/form-data">
<input id="no" type="hidden" size="40" name="no" value="${notice.no }">
<fieldset>
	  <div>
		  <div><label><input type="checkbox" name="check" value="${notice.check }">공지사항 상단 고정</label></div>
	    <div><label for="title">제목</label>
	      <input id="title" type="text" size="40" name="title" value="${notice.title }"></div>
	    <div><label for="content">내용</label>
	      <textarea cols="60" row="5" id="content" name="content"><c:out value="${notice.content }" /></textarea></div>
	    <div><label for="nfile">파일첨부</label>
	      <input id="nfile" type="file" name="nfile"><span>${notice.img }</span></div>
	    <div><button type="submit">수정하기</button></div>
	  </div>
</fieldset>
</form>
</body>
</html>