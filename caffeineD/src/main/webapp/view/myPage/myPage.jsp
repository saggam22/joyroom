<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${!empty error}">
			<script>
				alert("${error }")
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
	
	<h1 style="text-align: center;">My Page</h1>
	<form >
		<table border="1">
			<thead>
				<tr>
					<th>아이디</th>
					<th>닉네임</th>
					<th>연락처</th>
					<th>프로필</th>
			<tbody>
				<tr>
					<td>${user.id }</td>
					<td>${user.nickname }</td>
					<td>${user.tel }</td>
					<td><img src = "${pageContext.servletContext.contextPath }/img/profimg/${user.img}" style="max-width: 100px; height: auto;"/>
				
				</tr>
			</tbody>
		</table>
	</form>

	<div style="margin-top: 10px;">

		<a href="${pageContext.servletContext.contextPath }/view/myPage/updateInfo.tiles"><input type="button" value="정보 수정"></a> 
		<a href="${pageContext.servletContext.contextPath }/myBoard.do"><input type="button" value="작성글 보기"></a> 
		<a href="${pageContext.servletContext.contextPath }/myComment.do"><input type="button" value="작성댓글 보기"></a>
		<a href="${pageContext.servletContext.contextPath }/myReview.do"><input type="button" value="내 리뷰"></a>

	</div>




</body>
</html>