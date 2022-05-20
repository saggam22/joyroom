<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width" , initial-scale="1"> -->
<title>Insert title here</title>
</head>
<body>
	<h1>작성 글</h1>
	<c:choose>
		<c:when test="${empty contents }">
			<h3>게시글이 없습니다.</h3>
		</c:when>
		<c:otherwise>
			<table border="1">
				<thead>
					<tr>
						<th>제목</th>
						<th>작성자</th>
						<th>작성날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${contents.title}</td>
						<td>${contents.user_id}</td>
						<td>${contents.date }</td>
						<td>${contents.view}</td>
				</tbody>
			</table>
			<br>
			<td>${contents.img }</td><br><br>
			<td>${contents.content }</td>
		</c:otherwise>
	</c:choose>
	<br>
	<br>
	<div style="margin-left: 10%;">
		<button onclick="location.href='updateBoard.jsp'" type="button">글수정</button>
		<button onclick="location.href='deleteBoard.jsp'" type="button">삭제</button>
				

	</div>
	<c:choose>
		<c:when test="${empty comments }">
			<h3>댓글이 없습니다.</h3>
		</c:when>
		<c:otherwise>
			<form>
				<table border="1">
					<thead>
						<tr>
							<th>번호</th>
							<th>작성자</th>
							<th>내용</th>
					<tbody>
						<c:forEach items="${comments }" var="comment">
							<div style="margin-top: 100px;">
								<tr>
									<td>${comment.comment_no }</td>
									<td>${comment.user_id }</td>
									<td>${comment.comment_content }</td>
								</tr>
							</div>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</c:otherwise>
	</c:choose>
	<form style="margin-top: 10px;"
		"action="boardContents.do?no=${contents.no}" method="post">
		<textarea style="margin-top: 10px;" name="comment"
			placeholder="바르고 고운말을 씁시다." rows="3" cols="38" required></textarea>
		<br>
		<div style="margin-left: 130px; margin-top: 5px;">
			<input type="submit" value="댓글등록"> <a href="board.do"><button
					type="button">돌아가기</button></a>
		</div>
	</form>
</body>
</html>