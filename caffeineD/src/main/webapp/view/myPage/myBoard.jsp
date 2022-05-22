<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 글</title>
</head>
<body>	
	<form>
		<table border="1">
			<thead>
				<tr>
					<th>제목</th>					
					<th>작성일</th>
					<th>조회수</th>
			<tbody>

			</tbody>
		</table>
	</form>
		<button style="margin-top: 10px;" type="button"
		onclick="location.href='${pageContext.servletContext.contextPath }/myPage.do'">돌아가기</button>		
</body>
</html>