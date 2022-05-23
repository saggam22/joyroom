<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

	[type="button"] {
		cursor:pointer;
		font-weight: 700;
		text-decoration: none;
		border-radius: 20px;
		background: rgb(90, 90, 90);
		color: white;
		font-size: 12px;
	}
	
	[type="button"]:hover {
		background: white;
		color: rgb(90, 90, 90);
	}
</style>
<body>
<table border="1">
	<tbody>
		<tr><th>제목</th><td>${notice.title }</td></tr>
		<tr><th>작성자</th><td>${notice.user }<div><div>작성일<span>${notice.date }</span></div><div>조회수<span>${notice.view }</span></div></div></td></tr>
		<tr><td colspan="2">${notice.content }${notice.img }</td></tr>
	</tbody>
</table>
 <c:if test="${user.nickname eq '관리자' }">
 	<button type="button" onclick="location.href='${pageContext.servletContext.contextPath }/noticeSelect.do?job=update&title=${notice.title }'">수 정</button>
 	<button type="button" onclick="deleteBtn()">삭 제</button>
 </c:if>
 
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