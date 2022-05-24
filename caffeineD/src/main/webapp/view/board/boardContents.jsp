<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width" , initial-scale="1"> -->
<title>Insert title here</title>
<style>
  table {
  	text-align:center;
    width: 40%;
    border: 1px solid #444444;
    border-collapse: collapse;
  }  
  th {
    border: 1px solid #444444;
    padding: 10px;
    background: #00131c;
  }
  td {  	
    border: 1px solid #444444;
    padding: 10px;
  }
  #tt{
  color:white;
  }
</style>
</head>
<body>
<center>
	<h2>작성 글</h2>
	<c:choose>
		<c:when test="${empty contents }">
			<h2>게시글이 없습니다.</h2>
		</c:when>
		<c:otherwise>
			<table border="1">
				<thead>
					<tr id="tt">
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
			<td><img src = "${pageContext.servletContext.contextPath }/img/${contents.img }"></td><br><br>
			<td>${contents.content }</td>
		</c:otherwise>
	</c:choose>
	<br>
	<br>
	<div style="margin-left:34%;">	
		<a href = "boardUpdate.do?no=${contents.no}&user=${contents.user_id}"><input type="button" value="수정"></a>
		<a href = "boardDelete.do?no=${contents.no}&user=${contents.user_id}"><input type="button" value="삭제"></a>
	</div>
	<c:choose>
		<c:when test="${empty comments }">
			<p>댓글이 없습니다.</p>
		</c:when>
		<c:otherwise>
			<form>
				<table id="ct" border="1">
					<thead>
						<tr id="tt">
							<th>번호</th>
							<th>작성자</th>
							<th>댓글내용</th>
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
	<form style="margin-top: 10px;" action="boardContents.do?no=${contents.no}" method="post">
		<textarea style="margin-top: 10px;" name="comment"
			placeholder="바르고 고운말을 씁시다." rows="3" cols="87" required></textarea><br>
		<div style= "margin-left:32%; margin-top: 5px; margin-bottom:5px;">
			<input type="submit" value="댓글등록"> <a href="board.do"><input type="button" value="돌아가기"></a>
		</div>
	</form>
</body>
</html>