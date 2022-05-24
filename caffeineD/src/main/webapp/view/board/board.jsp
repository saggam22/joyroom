<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/table.css">
<style>
#notice_insert_btn {
	cursor: pointer;
	font-weight: 700;
	text-decoration: none;
	border-radius: 25px;
	background: rgb(90, 90, 90);
	color: white;
	font-size: 12px;
}

#notice_insert_btn:hover {
	background: white;
	color: rgb(90, 90, 90);
}
</style>
</head>
<body>
	<div class="container">
		<h2 class="heading-section">커뮤니티</h2>
		<table class="table">
			<thead class="thead-primary">
				<tr>
					<th class="num">번호</th>
					<th class="title">제목</th>
					<th class="name">작성자</th>
					<th class="date">작성일</th>
					<th class="view">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${all }" var="board">
					<tr>
						<td class="num">${board.no }</td>
						<td class="title"><a href="boardContents.do?no=${board.no}">${board.title }</a></td>
						<td class="name">${board.user_id }</td>
						<td class="date">${board.date }</td>
						<td class="view">${board.view }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div id="page">
		<jsp:include page="/view/board/boardPaging.jsp">
			<jsp:param value="${paging.pageNum}" name="pageNum" />
			<jsp:param value="${paging.startPage}" name="startPage" />
			<jsp:param value="${paging.endPage}" name="endPage" />
			<jsp:param value="${paging.prev}" name="prev" />
			<jsp:param value="${paging.next}" name="next" />
		</jsp:include>
	</div>
	</div>
	</div>
	<center>
		<a href="view/board/boardWrite.tiles"><input type="button"
			value="글쓰기"></a>
</body>
</html>
