<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#table {
	width: 1000px;
	height: auto;
	margin: 50px auto;
	border_top: solid 3px black;
	border_bottom: solid 3px black;
}

#table th {
	height: 30px;
	background: #f5d36c;
	border-bottom: solid 1px black;
}

th.num {
	width: 50px;
	text-indent: 10px;
}

th.title {
	width: 150px;
	text-indent: 100px;
}

th.name {
	width: 150px;
	text-indent: 85px;
}

th.date {
	width: 150px;
}

th.view {
	width: 50px;
}

#table td {
	height: 30px;
	border-bottom: dotted 1px black;
}

#table td.num {
	text-indent: 24px;
}

#table td.name {
	text-indent: 80px;
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${!empty error}">
			<script>
				alert("${error }")
			</script>
			<%
			request.getSession().removeAttribute("error");
			%>
		</c:when>
		<c:otherwise>
			<c:if test="${!empty success }">
				<script>
					alert("${success }")
				</script>
				<%
				request.getSession().removeAttribute("success");
				%>
			</c:if>
		</c:otherwise>
	</c:choose>
	<h1 style="text-align: center;">커뮤니티</h1>
	<c:choose>
		<c:when test="${empty all }">
			<h3>게시글이 없습니다.</h3>
		</c:when>
		<c:otherwise>
			<form>
				<table id="table" border="1">
					<thead>
						<tr>
							<th class="num">번호</th>
							<th class="title">제목</th>
							<th class="name">작성자</th>
							<th class="date">작성일</th>
							<th class="view">조회수</th>
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
			</form>
		</c:otherwise>
	</c:choose>
	<a href="view/board/boardWrite.jsp"><input style="margin-bottom:10px; text-align:center" type="button" value="글쓰기"></a>
</body>
</html>