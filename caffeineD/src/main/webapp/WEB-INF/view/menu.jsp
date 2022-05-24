<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
    <style>
    .userProf {
		padding:0;
		width: 30px;
	   	height: 30px; 
	    border-radius: 70%;
	    overflow: hidden;
	    margin-top: 5px;
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
	</c:choose>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
            <div class="container">
                <a class="navbar-brand text-uppercase fw-bold d-lg-none" href="${pageContext.servletContext.contextPath }/index.jsp">caffeine D</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                	<ul class="navbar-nav mx-auto">

                        <li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="${pageContext.servletContext.contextPath }/index.jsp">home</a></li>
                        <li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="${pageContext.servletContext.contextPath }/notice.do">notice</a></li>
                        <li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="${pageContext.servletContext.contextPath }/cafeList.do">cafe</a></li>
                        <li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="${pageContext.servletContext.contextPath }/board.do">community</a></li>
                       
                    </ul>
                    <ul id="login_user" class="navbar-nav mx-auto">
					<!-- 유저 프로필 -->
					<c:choose>
						<c:when test="${empty user }"></c:when>
						<c:otherwise>
							<li class="nav-item px-lg-4">
							
								<c:set var="id" value="${user.id }"/>
								<c:choose>
									<c:when test="${fn:substring(id,0,5) == 'kakao' }">
										<span class="userProf" style="float:left;"><img src="${user.img }"></span>
									</c:when>
									<c:otherwise>
										<span class="userProf" style="float:left;"><img src="${pageContext.servletContext.contextPath }/img/profimg/${user.img }"></span>
									</c:otherwise>
								</c:choose>
									
								<c:choose>
									<c:when test="${user.nickname == '관리자'}"> <a class="nav-link text-uppercase" href="${pageContext.servletContext.contextPath }/user.do" style="display: inline-block;">${user.nickname }</a></c:when>
									<c:otherwise><a class="nav-link text-uppercase" href="${pageContext.servletContext.contextPath }/myPage.do" style="float:left;">${user.nickname }</a></c:otherwise>
								</c:choose>
									
							</li>
						</c:otherwise>
					</c:choose>
			
				<c:choose>
					<c:when test="${empty user }"> 
						<li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="${pageContext.servletContext.contextPath }/view/user/login.tiles">Login</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="${pageContext.servletContext.contextPath }/logout.do">logout</a></li>
					</c:otherwise>
				</c:choose>
                    </ul>
                </div>
            </div>
        </nav>


</body>
</html>
