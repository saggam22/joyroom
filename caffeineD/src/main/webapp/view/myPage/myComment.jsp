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
	<c:choose>
		<c:when test="${empty all }">
			<h3>댓글이 없습니다.</h3>
		</c:when>
		<c:otherwise>
			<form>
				<table border="1">
					<thead>
						<tr>							
							<th>작성자</th>
							<th>내용</th>
					<tbody>
						<c:forEach items="${all }" var="comment">
							<div style="margin-top: 100px;">
								<tr>
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
	<button style="margin-top: 10px;" type="button"
		onclick="location.href='${pageContext.servletContext.contextPath }/myPage.do'">돌아가기</button>
</body>
</html>