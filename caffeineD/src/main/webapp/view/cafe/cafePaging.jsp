<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cafePaging.jsp</title>
<style type="text/css">
@charset "UTF-8";
@import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');

* { 
	font-family: Pretendard, -apple-system, BlinkMacSystemFont, 
	system-ui, Roboto, 'Helvetica Neue', 'Segoe UI', 'Apple SD Gothic Neo', 
	'Noto Sans KR', 'Malgun Gothic', sans-serßif;
	font-size: 10pt;
	box-sizing: border-box;
}
body{
    text-align:center;
}
#paging{
    font-size: 15pt;
}
</style>
</head>
<body>
<div id="paging">

<c:url var="action" value="/cafeList.do"/>
<c:if test="${param.prev}">
    <a href="${action}?pageNum=${param.startPage-1}">prev</a>
</c:if>
<c:forEach begin="${param.startPage}" end="${param.endPage}" step="1" var="index">
    <c:choose>
        <c:when test="${param.pageNum==index}">
            ${index}
        </c:when>
        <c:otherwise>
            <a href="${action}?pageNum=${index}">${index}</a>
        </c:otherwise>
    </c:choose>
</c:forEach>
<c:if test="${param.next}">
    <a href="${action}?pageNum=${param.endPage+1}">next</a>
</c:if>
</div>
</body>
</html>
