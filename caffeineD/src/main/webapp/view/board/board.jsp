<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
	<h1>커뮤니티</h1>
	<div style="margin-bottom: 10px;">
		<a href="index.jsp">메인</a>
		 <h4>${user.id }님 환영합니다.</h4>
	</div>
	<c:choose>
		<c:when test="${empty all }">
			<h3>게시글이 없습니다.</h3>
		</c:when>
		<c:otherwise>
			<form>
				<table border="1">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
					<tbody>
						<c:forEach items="${all }" var="board">
							<tr>
								<td>${board.no }</td>
								<td><a href="boardContents.do?no=${board.no}">${board.title }</a></td>
								<td>${board.user_id }</td>
								<td>${board.date }</td>
								<td>${board.view }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</c:otherwise>
	</c:choose>
	<div style="margin-top: 10px;">
		<a href="view/board/boardWrite.jsp">글쓰기</a>
	</div>
</body>
</html>