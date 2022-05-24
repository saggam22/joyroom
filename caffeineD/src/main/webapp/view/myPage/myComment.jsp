<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 style="margin-top:10px;" class="heading-section">내 댓글</h2>
				</div>
			</div>
			<c:choose>
				<c:when test="${empty all }">
					<h3>댓글이 없습니다.</h3>
				</c:when>
				<c:otherwise>
					<form>
						<table class="table">
							<thead class="thead-primary">
								<tr>
									<th>작성자</th>
									<th>내용</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${all }" var="comment">
									<tr>
										<td>${comment.user_id }</td>
										<td>${comment.comment_content }</td>
										<td>${comment.comment_date }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</section>
	<center>
		<a href="${pageContext.servletContext.contextPath }/myPage.do"><input
			style="margin-bottom: 10px; text-align: center" type="button"
			value="돌아가기"></a>
</body>
</html>