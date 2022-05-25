<%@page import="co.dev.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

.ftco-section {
	padding: 80px 0;
}
#my_info {
	background: #d9bba9;
	color: #2F170F;
	font-weight: 600;
}

</style>
</head>
<body>
	<section class="ftco-section">
		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap" style="overflow-x: hidden">
						<div class="heading-section"><jsp:include page="/view/myPage/myPageMenu.jsp"></jsp:include></div>
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
									<td id="id">${myInfo.id }</td>
									<td>${myInfo.nickname }</td>
									<td>${myInfo.tel }</td>
									<td>
										<c:set var="id" value="${user.id }"/>
										<c:choose>
											<c:when test="${fn:substring(id,0,5) == 'kakao' }">
												<img src="${myInfo.img}"
													style="max-width: 100px; height: auto;">
											</c:when>
											<c:otherwise>
												<img src="${pageContext.servletContext.contextPath }/img/profimg/${myInfo.img}"
													style="max-width: 100px; height: auto;">
											</c:otherwise>
										</c:choose>
								</tr>
							</tbody>
						</table>
					</div>
						<a href="${pageContext.servletContext.contextPath }/updateInfo.do?=${user.id}" onclick="return userCheck();"><input
							type="button" value="정보 수정"></a>
				</div>
			</div>
		</div>
	</section>
</body>
<script>
	function userCheck() {
		let userId = document.getElementById('id');
		if(userId.innerHTML.substr(0,5) === 'kakao') {
			alert('카카오 로그인 접속은 내 정보를 수정할 수 없습니다.');
			return false;
		} else{
			return true;
		}
		
	}
</script>
</html>