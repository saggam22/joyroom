<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
  	<title>Table 01</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="css/table.css">
	<style>
		#notice_insert_btn {
		cursor:pointer;
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
					<h2 class="heading-section">NOTICE</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap" style="overflow-x: hidden">
						<c:if test="${!empty success }">
						<script>alert("${success }")</script>
							<% request.getSession().removeAttribute("success"); %>
						</c:if>
						<c:choose>
						<c:when test="${empty list }"><h4>게시글이 없습니다.</h4></c:when>
						<c:otherwise>
						<table class="table">
						  <thead class="thead-primary">
						    <tr>
						      <th>번호</th>
						      <th>제목</th>
						      <th>작성자</th>
						      <th>작성일</th>
							  <th>조회수</th>
						    </tr>
						  </thead>
						  <tbody>
							<c:forEach items="${list }" var="notice" varStatus="status">
						    <tr>
								<c:choose>
									<c:when test="${notice.check eq 'checked' }"><td style="color:red">[필독]</td></c:when>
									<c:otherwise>
										<th scope="row">${fn:length(list) - status.index }</th>
									</c:otherwise>
								</c:choose>
						      <th><a href="${pageContext.servletContext.contextPath }/noticeSelect.do?job=select&title=${notice.title }" >${notice.title }</a></th>
						      <td>${notice.user }</td>
						      <td>${notice.date }</td>
							  <td>${notice.view }</td>
						    </tr>
						   </c:forEach>
						  </tbody>
						</table>
					</c:otherwise>
					</c:choose>
					<c:if test="${user.nickname eq '관리자' }">
						<button id="notice_insert_btn" type="button" onclick="location.href='view/notice/insertNotice.tiles'">글쓰기</button>
					</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
</html>