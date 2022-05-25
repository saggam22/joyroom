<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
  	<title>notice.jsp</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="css/table.css">
<style>
#container { 
	font-family: Pretendard, -apple-system, BlinkMacSystemFont, 
	system-ui, Roboto, 'Helvetica Neue', 'Segoe UI', 'Apple SD Gothic Neo', 
	'Noto Sans KR', 'Malgun Gothic', sans-serßif;
	font-size: 10pt;
	box-sizing: border-box;
}

#notice_insert_btn:hover {
	background: #d9bba9;
	}
	
#notice_insert_btn {
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
	
.form-control {
    display: block;
    width: 100%;
    padding: 0.375rem 0.75rem;
    font-size: 0.8rem;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;}

.form-inline {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row wrap;
          flex-flow: row wrap;
  -webkit-box-align: center;
      -ms-flex-align: center;
          justify-content: flex-end; }

.btn-success {
  color: #fff;
  background-color: black;
  border-color: black; }
  /* line 13, node_modules/bootstrap/scss/mixins/_hover.scss */
  .btn-success:hover {
    color: #fff;
    background-color: #d9bba9;
    border-color: #d9bba9 }
  /* line 18, node_modules/bootstrap/scss/mixins/_buttons.scss */
  .btn-success:focus, .btn-success.focus {
    -webkit-box-shadow: 0 0 0 0.2rem #d9bba9;
            box-shadow: 0 0 0 0.2rem #d9bba9; }

.btn {
  display: inline-block;
  font-weight: 500;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  border: 1px solid transparent;
  padding: 0.4rem 1.2rem;
  font-size: 0.8rem;
  line-height: 1.4;
  border-radius: 0.25rem;}
  
</style>
</head>
<body>
<div id="container">
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">NOTICE</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap" style="overflow-x: hidden">
						<c:if test="${!empty success }">
						<script>alert("${success }")</script>
							<% request.getSession().removeAttribute("success"); %>
						</c:if>
						<c:choose>
						<c:when test="${empty list }"><h6>게시글이 없습니다.</h6></c:when>
						<c:otherwise>
						<table class="table">
						  <thead class="thead-primary">
						    <tr>
						      <th>번호</th>
						      <th>제목</th>
						      <th>작성자</th>
						      <th>작성일</th>
							  <th>조회수</th>
						    </tr>
						  </thead>
						  <tbody>
							<c:forEach items="${list }" var="notice" varStatus="status">
						    <tr>
								<c:choose>
									<c:when test="${notice.check eq 'checked' }"><td style="color:red">[필독]</td></c:when>
									<c:otherwise>
										<th scope="row">${fn:length(list) - status.index }</th>
									</c:otherwise>
								</c:choose>
						      <th><a href="${pageContext.servletContext.contextPath }/noticeSelect.do?job=select&no=${notice.no }" >${notice.title }</a></th>
						      <td>${notice.user }</td>
						      <td>${notice.date }</td>
							  <td>${notice.view }</td>
						    </tr>
						   </c:forEach>
						  </tbody>
						</table>
						<form name="findF" action="noticeSearch.do" class="form-inline">
			<input type="text" name="findKeyword" placeholder="검색어를 입력하세요" 
			class="form-control mr-2">
			<button class="btn btn-success">검 색</button>
			</form>
					</c:otherwise>
					</c:choose>
					<c:if test="${user.nickname eq '관리자' }">
						<button id="notice_insert_btn" type="button" onclick="location.href='view/notice/noticeInsert.tiles'">글쓰기</button>
					</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
		<div id="page">
<jsp:include page="/view/notice/noticePaging.jsp">
    <jsp:param value="${paging.pageNum}" name="pageNum"/>
    <jsp:param value="${paging.startPage}" name="startPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
</jsp:include>	
	</div>
</div>
</body>
</html>
</html>