<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<a href="index.jsp">메인</a>
	<h1>My Page</h1>

	<form>
		<table border="1">
			<thead>
				<tr>
					<th>아이디</th>
					<th>닉네임</th>
					<th>연락처</th>
					<th>프로필</th>
			<tbody>
				<tr>
					<td>${user.id }</td>
					<td>${user.nickname }</td>
					<td>${user.tel }</td>
					<td>${user.img }</td>
				</tr>
			</tbody>
		</table>
	</form>
	
	<div style="margin-top: 10px;">
		<a href="${pageContext.servletContext.contextPath }updateInfo.jsp"><input type="button" value="정보 수정"></a>
		<a href="${pageContext.servletContext.contextPath }myBoard.jsp"><input type="button" value="작성글 보기"></a>
		<a href="${pageContext.servletContext.contextPath }myComment.jsp"><input type="button" value="작성댓글 보기"></a>
		<a href="${pageContext.servletContext.contextPath }/myReview.do">내 리뷰</a><br>
	</div>




</body>
</html>
