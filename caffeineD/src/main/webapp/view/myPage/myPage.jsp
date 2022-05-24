<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<c:choose>
		<c:when test="${!empty error}">
			<script>
				alert("${error }", "로그인이 필요합니다.")
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

	<section class="ftco-section">
		<div class="container">
			
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap" style="overflow-x: hidden">
						<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h1 class="heading-section">My Page</h1>
				</div>
			</div>
						<table class="table">
							<thead class="thead-primary">
								<tr id="tt">
									<th>아이디</th>
									<th>닉네임</th>
									<th>연락처</th>
									<th>프로필</th>
								</tr>
							<tbody>
								<tr>
									<td>${user.id }</td>
									<td>${user.nickname }</td>
									<td>${user.tel }</td>
									<td><img
										src="${pageContext.servletContext.contextPath }/img/profimg/${user.img}"
										style="max-width: 100px; height: auto;" />
								</tr>
							</tbody>
						</table>
					</div>
					<center>
		<a
			href="${pageContext.servletContext.contextPath }/view/myPage/updateInfo.tiles"><input
			type="button" value="정보 수정"></a> <a
			href="${pageContext.servletContext.contextPath }/myBoard.do"><input
			type="button" value="작성글 보기"></a> <a
			href="${pageContext.servletContext.contextPath }/myComment.do"><input
			type="button" value="작성댓글 보기"></a> <a
			href="${pageContext.servletContext.contextPath }/myReview.do"><input
			type="button" value="내 리뷰"></a>
				</div>
			</div>
		</div>
	</section>
	
</body>
</html>