<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectNotice.jsp</title>
</head>
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
	width: 100%;
	text-align: center;
	margin-top: 70px;
	margin-bottom: 80px;
}

h2 {
	margin: 50px 0 15px 0;
	font-size: 25pt;
}

table {
    margin: 30px auto;
    border: 0;
    color: #fff;
    line-height: 1.5;
    width: 60%;
    border: 0;
}

th {
    padding: 12px 0 12px 18px;
    border-bottom-width: 0;
    color: #353535;
    width: 10%;
    text-align: left;
    font-weight: normal;
    background-color: #fff;
}

td {
		color: #353535;
    font-size: 14px;
    vertical-align: middle;
    background-color: #fff;
}

#inner_td {
    position: relative;
		background-color: #fff;
}

span {
	margin: 0 10px;
}

#inner_td_date {
    position: absolute;
    right: 95px;
    top: 0px;
		background-color: #fff;
}

#inner_td_view {
    position: absolute;
    right: 10px;
    top: 0px;
		background-color: #fff;
}

#td_content {
	padding: 20px;
}

.line {
	border-top:1px solid #ddd;
	border-bottom:1px solid #ddd;
}

[type="button"] {
		cursor:pointer;
		font-weight: 700;
		border:none;
		width: 55px;
		height: 27px;
		text-decoration: none;
		border-radius: 25px;
		background: rgb(90, 90, 90);
		color: white;
		font-size: 12px;
	}
	
[type="button"]:hover {
		background: #d9bba9;
	}
</style>
<body>
<section id="notice_insert_section">
<h2>NOTICE</h2>
<table border="1">
	<tbody>
		<tr class="line"><th>제목</th><td>${notice.title }</td></tr>
		<tr class="line"><th>작성자</th><td><div id=inner_td>${notice.user }<div id=inner_td_date>작성일<span>${notice.date }</span></div><div id=inner_td_view>조회수<span>${notice.view }</span></div></div></td></tr>
		<tr><td colspan="2"><div id="td_content"><pre><c:out value="${notice.content }" /></pre>
		<c:if test="${!empty notice.img }">
		<img width="50px" alt="" src="${pageContext.servletContext.contextPath }/img/noticeimg/${notice.img }"></c:if></div></td></tr>
	</tbody>
</table>
 <c:if test="${user.nickname eq '관리자' }">
 	<button type="button" onclick="location.href='${pageContext.servletContext.contextPath }/noticeSelect.do?job=update&title=${notice.title }'">수정</button>
 	<button type="button" onclick="deleteBtn()">삭제</button>
 </c:if>
</section>
 <script>
 function deleteBtn() {
	 if(confirm("정말 삭제하시겠습니까?") == true) {
		 location.href='${pageContext.servletContext.contextPath }/noticeDelete.do?no=${notice.no}';
		 alert("삭제되었습니다");
	 }
 }
 </script>
</body>
</html>