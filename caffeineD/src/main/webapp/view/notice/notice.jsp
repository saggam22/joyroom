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
 	<c:when test="${empty list }"><h4>게시글이 없습니다.</h4></c:when>
 	<c:otherwise>
    <table border="1">
        <caption>공지사항</caption>
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${list }" var="notice">
        	<tr><td>${notice.no }</td><td>${notice.title }</td><td>${notice.user }</td><td>${notice.date }</td><td>${notice.view }</td></tr>
        </c:forEach>
        </tbody>
    </table>    
		</c:otherwise>
		</c:choose>
 <c:if test="${user.nickname eq 'admin' }">
 	<button type="button" onclick="location.href='view/notice/insertNotice.jsp'">글쓰기</button>
 </c:if>
</body>
</html>