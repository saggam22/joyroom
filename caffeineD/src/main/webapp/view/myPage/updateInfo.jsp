<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/table.css">
<title>updateInfo.jsp</title>
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
<center>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">정보 수정</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap" style="overflow-x: hidden">
						<form class="table"
							action="${pageContext.servletContext.contextPath }/myPage.do"
							method="post" enctype="multipart/form-data">
							아이디: <input type="text" name="id" readonly value="${user.id }"><br>
							비밀번호: <input type="password" name="pwd" value="${user.pwd }"><br>
							닉네임: <input type="text" name="nickname" value="${user.nickname }"><br>
							연락처: <input type="text" name="tel" value="${user.tel }"><br>							
							<input type="submit" value="수정"> <a href= "${pageContext.servletContext.contextPath }/myPage.do"><input type="button" value="돌아가기"></a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>