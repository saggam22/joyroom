<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width" , initial-scale="1"> -->
<title>Insert title here</title>
<style>
html {
	font-family: "Noto Sans KR", sans-serif;
}

/* 노말라이즈 */
body, ul, li, h1, h2, h3, h4, h5, h6 {
	margin: 0;
	padding: 0;
	list-style: none;
}

a:link {
	color: lightblue;
}

/* 라이브러리 */
.con {
	margin: 0 auto;
}

.img-box>img {
	width: 100%;
	display: block;
}

.row::after {
	content: "";
	display: block;
	clear: both;
}

.cell {
	float: left;
	box-sizing: border-box;
}

.cell-right {
	float: right;
	box-sizing: border-box;
}

.margin-0-auto {
	margin: 0 auto;
}

.block {
	display: block;
}

.inline-block {
	display: inline-block;
}

.text-align-center {
	text-align: center;
}

.line-height-0-ch-only {
	line-height: 0;
}

.line-height-0-ch-only>* {
	line-height: normal;
}

.relative {
	position: relative;
}

.absolute-left {
	position: absolute;
	left: 0;
}

.absolute-right {
	position: absolute;
	right: 0;
}

.absolute-middle {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
}

/* 커스텀 */
/* 반응형 레이아웃 */
.con {
	max-width: 950px;
}

.con-min-width {
	min-width: 320px;
}

.top-menu a {
	text-decoration: none;
	color: gray;
	font-weight: bold;
	font-size: 1.2rem;
}

html, body {
	overflow-x: hidden;
}

.table-common>table {
	width: 100%;
	border-collapse: collapse;
}

.table-common .btn-box {
	text-align: center;
}

.table-common>table th, .table-common>table td {
	border: 1px solid black;
	padding: 10px;
}

.article-list table {
	border: none;
	border-top: 2px solid lightgray;
	border-bottom: 2px solid lightgray;
}

.article-list>table th, .article-list>table td {
	border: none;
}

.article-list>table td {
	border-bottom: 1px solid lightgray;
}

.article-list>table thead {
	border-bottom: 2px solid lightgray;
	background-color: #F5F5F5;
}

.article-detail {
	border: 2px solid lightgray;
}

.article-detail>table {
	border: none;
	width: calc(100% - 100px);
}

.article-detail>table th, .article-detail>table td {
	border: none;
}

.article-detail>table tr:not(:last-child) {
	border-bottom: 1px solid lightgray;
}

.article-detail>table tr:not(.article-body), .article-detail>table tr:not(.article-body)>td
	{
	height: 20px;
	font-size: 0.8rem;
}

.article-detail>table tr.article-title>td {
	height: 40px;
	font-weight: bold;
	font-size: 1.2rem;
}

.article-detail>table td:last-child {
	padding-right: 100px;
}

.article-detail>.article-writer {
	width: 100px;
	height: 90px;
	background-color: lightgray;
	border-bottom: 1px solid lightgray;
	text-align: center;
}

.article-detail>.article-writer .writer-icon {
	margin: 0 auto;
	background-color: white;
	width: 80px;
	height: 80px;
	border-radius: 50%;
}

.reply {
	margin-top: 20px;
	border: 2px solid lightgray;
	padding: 15px;
	box-sizing: border-box;
}

.reply-form {
	padding: 10px;
}

.reply-form>form input[type="text"] {
	width: 200px;
}

.reply-form>form textarea {
	width: calc(100% - 100px);
	min-height: 40px;
}

.reply-form>form input[type="submit"] {
	width: 80px;
	height: 40px;
	transform: translatey(-40%);
}

.reply-form>form>div:not(:last-child) {
	margin-bottom: 5px;
}

.reply-list>table {
	border: none;
}

.reply-list>table th {
	display: none;
}

.reply-list>table td {
	border: none;
}

.reply-list>table tr:nth-child(2n+1) {
	background-color: rgba(0, 0, 0, 0.06);
}

.reply-list>table td:first-child {
	font-weight: bold;
}

.reply-list>table td:first-child::after {
	content: " : ";
	font-weight: bold;
}
#iii{
	display:block;
	width:300px;
	float:left;
}
#p{
	display: block;
	float:left;
	text-align:left;
}

</style>
</head>
<body>	
		<h2 style="margin-bottom:10px; margin-top:10px; align="center">작성 글</h2>
		<c:choose>
			<c:when test="${empty contents }">
				<h2>게시글이 없습니다.</h2>
			</c:when>
			<c:otherwise>
				<section class="article-detail table-common con row">
					<div class="article-writer cell">
						<span>${user_id }</span>
					</div>
					<table class="cell" border="1">
						<colgroup>
							<col width="100px">							
						</colgroup>
						<tbody>
							<tr class="article-title">
								<th>제목</th>
								<td colspan="3">${contents.title}</td>
								<th>글번호</th>
								<td colspan="3">${contents.no }</td>
							</tr>
							<tr class="article-title">
								<th>날짜</th>
								<td colspan="3">${contents.date }</td>
								<th>조회수</th>
								<td colspan="3">${contents.view}</td>
							</tr>
							<tr class="article-body">
								<td></td>
								<td colspan="4"></td>
							</tr>
						</tbody>
					</table>
					<p><img id="iii" src="${pageContext.servletContext.contextPath }/img/${contents.img }"></p>
					<p id="p">${contents.content }</p>					
			</c:otherwise>
		</c:choose>
		<br> <br>		
		<div style="margin-left: 86%; margin-top: 10px; margin-bottom:10px;">
			<a href="boardUpdate.do?no=${contents.no}&user=${contents.user_id}"><input
				type="button" value="수정"></a> <a
				href="boardDelete.do?no=${contents.no}&user=${contents.user_id}"><input
				type="button" value="삭제"></a>
		</div>
		<hr>
		<c:choose>
			<c:when test="${empty comments }">
				<p>댓글이 없습니다.</p>
			</c:when>
			<c:otherwise>
				<section class="reply-list table-common">
					<table border="1">
						<colgroup>
							<col width="100px">
						</colgroup>
						<thead>
							<tr>
								<th>작성자</th>
								<th>댓글내용</th>
							</tr>
						</thead>
						<form>
							<table border="1">
								<thead>
									<tr>										
										<th>작성자</th>
										<th>댓글내용</th>
									</tr>
								<tbody>
									<c:forEach items="${comments }" var="comment">
										<tr>
											<td>${comment.user_id }</td>
											<td>${comment.comment_content }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						</form>
			</c:otherwise>
		</c:choose>
		<form style="margin-top: 10px;"	action="boardContents.do?no=${contents.no}" method="post">
			<textarea style="margin-top: 10px;" name="comment"
				placeholder="바르고 고운말을 씁시다." rows="3" cols="106" required></textarea>
			<br>
			<div style="margin-left: 82%; margin-top: 5px; margin-bottom: 5px;">
				<input type="submit" value="댓글등록"> <a href="board.do"><input
					type="button" value="돌아가기"></a>
			</div>
		</form>
</body>
</html>