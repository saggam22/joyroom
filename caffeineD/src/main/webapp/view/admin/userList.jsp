<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
  	<title>userList.jsp</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="css/table.css">
	<style>
	#user_delete_btn {
		cursor:pointer;
		font-weight: 700;
		border:none;
		width: 55px;
		height: 27px;
		text-decoration: none;
		border-radius: 25px;
		background: rgb(90, 90, 90);
		color: white;
		font-size: 12px;
	}
	#user_delete_btn:hover {
		background: #d9bba9;
	}
	</style>
</head>
<body>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">회원리스트</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap" style="overflow-x: hidden">
						<c:choose>
						<c:when test="${empty list }"><h4>회원이 없습니다.</h4></c:when>
						<c:otherwise>
						<table class="table">
						  <thead class="thead-primary">
						    <tr>
						      <th></th>
						      <th>회원ID</th>
						      <th>닉네임</th>
						      <th>전화번호</th>
							  	<th>프로필사진</th>
						    </tr>
						  </thead>
						  <tbody>
							<c:forEach items="${list }" var="users">
						    <tr>
									<td><input type="checkbox" name="usersId" value="${users.id }"></td>
						      <td>${users.id }</td>
						      <td>${users.nickname }</td>
						      <td>${users.tel }</td>
							  	<td><img width="50px" alt="" src="${pageContext.servletContext.contextPath }/img/profimg/${users.img }"></td>
						    </tr>
						   </c:forEach>
						  </tbody>
						</table>
							<button id="user_delete_btn" type="button" onclick="userDelete();">삭제</button>
					</c:otherwise>
					</c:choose>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
	function userDelete() {
		if(confirm('정말로 삭제하시겠습니까?') == true ) {
			let userSelect = document.getElementsByName('usersId');
			for (let i=0; i<userSelect.length; i++) {
				if(userSelect[i].checked) {
					location.href='${pageContext.servletContext.contextPath }/userDelete.do?id='+userSelect[i].value;
				}
			}
			alert("삭제되었습니다.");
		}
		location.reload();
	}
	</script>
</body>
</html>
</html>