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
		<button style="margin-top: 10px;" type="button"	onclick="location.href='${pageContext.servletContext.contextPath }/myPage.do'">돌아가기</button>		
</body>
</html>