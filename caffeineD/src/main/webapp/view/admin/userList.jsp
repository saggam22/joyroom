<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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