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
 	<jsp:include page="/view/admin/adminMenu.jsp"></jsp:include>
 <c:choose>
 
 
 	<c:when test="${empty list }"><h4>회원이 없습니다.</h4></c:when>
 	<c:otherwise>
    <table border="1">
        <caption>회원리스트</caption>
        <thead>
            <tr>
                <th>회원ID</th>
                <th>닉네임</th>
                <th>전화번호</th>
                <th>프로필사진</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${list }" var="users">
        	<tr><td>${users.id }</td><td>${users.nickname }</td><td>${users.tel }</td><td>${users.img }</td></tr>
        </c:forEach>
        </tbody>
    </table>    
		</c:otherwise>
		</c:choose>
</body>
</html>
</html>