<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>리스트.</title>
</head>

<body>
		<c:choose>
		<c:when test="${empty list }"><h4></h4></c:when>
		<c:otherwise>
    <table border="1">
        <caption></caption>
        <thead>
            <tr>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${list }" var="book">
        	<tr><td>${book.bookCode }</td><td>${book.bookTitle }</td><td>${book.bookAuthor }</td><td>${book.bookPress }</td><td>${book.bookPrice }</td></tr>
        </c:forEach>
        </tbody>
    </table>    
    let aTag = document.createElement('a');
				aTag.setAttribute('href', `cafeSebuInfoOutput.jsp?juso=\${cafeinfo.doro}&name=\${cafeinfo.name}&tel=\${cafeinfo.tel}&menu=\${cafeinfo.menu}&open=\${cafeinfo.open}`);
				aTag.setAttribute('target', '_blank');
				aTag.innerHTML = cafeinfo[elem];
				td.appendChild(aTag);	
		</c:otherwise>
		</c:choose>
</body>

</html>