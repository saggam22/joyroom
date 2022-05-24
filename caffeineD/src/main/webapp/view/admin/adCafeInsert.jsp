<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adReviewInsert.jsp</title>

</head>
<body>

	<jsp:include page="/view/admin/adminMenu.jsp"></jsp:include>

	<form
		action="${pageContext.servletContext.contextPath }/adCafeInsert.do"
		method="get">
		<select name="cafe_no">
			<c:forEach items="${cafeList }" var="cafe">
				<option value="${cafe.no }">${cafe.name }</option>
			</c:forEach>
		</select>
		<textarea name="cafe_info"></textarea>
		<button type="submit">등록</button>
	</form>

</body>
</html>