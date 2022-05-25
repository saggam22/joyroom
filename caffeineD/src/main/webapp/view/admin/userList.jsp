<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
  <head>
  	<title>userList.jsp</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="css/table.css">
	<link rel="stylesheet" href="css/adminCafe.css">
	<style>
		.ftco-section {
			padding: 80px 0;
		}
		#user {
			background: #d9bba9;
			color: #2F170F;
			font-weight: 600;
		}
	</style>
</head>
<body>
<div id="container">
	<section class="ftco-section">
		<div class="container">
			<div class="heading-section"><jsp:include
								page="/view/admin/adminMenu.jsp"></jsp:include></div>
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
							  	<td>
							  		<c:set var="id" value="${users.id }"/>
								  	<c:choose>
										<c:when test="${fn:substring(id,0,5) == 'kakao' }">
											<img src="${users.img }" width="50px" height="50px">
										</c:when>
										<c:otherwise>
											<img src="${pageContext.servletContext.contextPath }/img/profimg/${user.img }" width="50px" height="50px">
										</c:otherwise>
									</c:choose>
								</td>
						    </tr>
						   </c:forEach>
						  </tbody>
						</table>
						<form name="findF" action="userSearch.do" class="form-inline">
	           <select name="findType" class="form-control mr-2">
	           	<option value="">::검색 유형::</option>
	           	<option value="id">회원ID</option>
	           	<option value="nickname">닉네임</option>
	           	<option value="tel">전화번호</option>
	           </select>
	           <input type="text" name="findKeyword" placeholder="검색어를 입력하세요" 
	           class="form-control mr-2">
	           <button class="btn btn-success">검 색</button>
						</form>
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
	<div id="page">
<jsp:include page="/view/admin/userPaging.jsp">
    <jsp:param value="${paging.pageNum}" name="pageNum"/>
    <jsp:param value="${paging.startPage}" name="startPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
</jsp:include>	
	</div>
</div>
</body>
</html>