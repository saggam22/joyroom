<%@page import="co.dev.service.CafeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Home - Pintereso Bootstrap Template</title>
    <link rel="stylesheet" href="css/app.css">
    <link rel="stylesheet" href="css/theme.css">

</head>

<body>
    <main role="main">
        
    <section class="mt-4 mb-5">
    <div class="container mb-4">
    	<h1 class="font-weight-bold title">CAFES</h1>
    	<div class="row">
    		<nav class="navbar navbar-expand-lg navbar-light bg-white pl-2 pr-2">
    		<button class="navbar-light navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExplore" aria-controls="navbarsDefault" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
    		</button>
    		<div class="collapse navbar-collapse" id="navbarsExplore">
    			<ul class="navbar-nav">
    				<li class="nav-item">
    				<a class="nav-link" href="${pageContext.servletContext.contextPath }/cafeList.do">All</a>
    				</li>
    				<li class="nav-item">
    				<a class="nav-link" href="${pageContext.servletContext.contextPath }/cafeRegionList.do?job=susung">수성구</a>
    				</li>
    				<li class="nav-item">
    				<a class="nav-link" href="${pageContext.servletContext.contextPath }/cafeRegionList.do?job=seogu">서구</a>
    				</li>
    				<li class="nav-item">
    				<a class="nav-link" href="${pageContext.servletContext.contextPath }/cafeRegionList.do?job=bukgu">북구</a>
    				</li>
    			</ul>
    		</div>
    		</nav>
    	</div>
    </div>
    <div class="container-fluid">
    	<div class="row">
    		<div class="card-columns">
    			<c:forEach var="cafeinfo" items="${list }">
				<div class="card card-pin">
    				<img class="card-img" src="${pageContext.servletContext.contextPath }/img/cafeimg/${cafeinfo.img }" width="200px" height="250px" alt="Card image">
    				<div class="overlay">
    					<h2 class="card-title title">${cafeinfo.name }</h2>
    					<div class="more">
    						<a href="${pageContext.servletContext.contextPath }/cafeInfoSelect.do?no=${cafeinfo.no}">
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> More </a>
    					</div>
    				</div>
    			</div>
				</c:forEach>
    		</div>
    	</div>
    </div>
    </section>
    </main>  
	<div id="page">
<jsp:include page="/view/cafe/cafePaging.jsp">
    <jsp:param value="${paging.pageNum}" name="pageNum"/>
    <jsp:param value="${paging.startPage}" name="startPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
</jsp:include>	
	</div>
</body> 
</html> 
