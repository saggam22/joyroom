<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>home</title>
    <style>
    .userProf {
		padding:0;
		display: inline-block;
		width: 30px;
	   	height: 30px; 
	    border-radius: 70%;
	    overflow: hidden;
	}

	.userProf img {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	}
    </style>
</head>

<body>
	<c:choose>
		<c:when test="${!empty error }">
			<script>
				alert("${error }")
			</script>
				<% request.getSession().removeAttribute("error"); %>
		</c:when>
		<c:otherwise>
			<c:if test="${!empty success }">
				<script>
					alert("${success }")
				</script>
				<% request.getSession().removeAttribute("success"); %>
			</c:if>
		</c:otherwise>
	</c:choose>
	
	<h2><a href="index.jsp">CaffeineD</a></h2><br>
	
    <a href="notice.do">공지사항</a><br>
    <a href="cafeList.do">카페</a><br>
    <a href="review.do">카페리뷰</a><br>
    <a href="community.do">커뮤니티</a><br>
    <a href="myPage.do">마이페이지</a><br>
    <a href="myReview.do">내 리뷰</a><br>
    
	<c:choose>
   		<c:when test="${empty user }"></c:when>
   		<c:otherwise><span class="userProf"><img src="${pageContext.servletContext.contextPath }/img/${user.img }"></span>${user.nickname }</c:otherwise>
    </c:choose>
	<c:choose>
   		<c:when test="${empty user }"><a href="view/user/login.jsp">로그인</a></c:when>
   		<c:otherwise><a href="logout.do">로그아웃</a></c:otherwise>
    </c:choose>
    
</body>
</html>