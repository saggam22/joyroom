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
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${contents.title}</td>
						<td>${contents.user}</td>
						<td>${contents.view}</td>
					</tr>
				</tbody>
			</table>
			내용<div style="height: 100px; border: 1px;">${contents.content}</div>			

		</c:otherwise>
	</c:choose>

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
							<tr>
								<td>${comment.comment_no }</td>
								<td>${comment.comment_user }</td>
								<td>${comment.comment_content }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
			<div>
				<form action="boardContents.do?no=${contents.no}" method="post">
					<textarea style="margin-top:10px;" name="comment" placeholder="바르고 고운말을 씁시다."  rows="3" cols="38"  required></textarea><br>
					<div style="margin-left:130px; margin-top:5px;" >
					<input type="submit" value="댓글등록">	<a href="board.do"><button type="button">돌아가기</button></a>
					</div>					
				</form>
			</div>
		</c:otherwise>
	</c:choose>

</body>
</html>