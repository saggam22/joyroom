<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@charset "UTF-8";

@import
	url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css')
	;

#container {
	font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui,
		Roboto, 'Helvetica Neue', 'Segoe UI', 'Apple SD Gothic Neo',
		'Noto Sans KR', 'Malgun Gothic', sans-serßif;
	font-size: 10pt;
	box-sizing: border-box;
}

#notice_insert_section {
	width: 100%;
	text-align: center;
	margin-top: 70px;
	margin-bottom: 80px;
}

h2 {
	margin: 50px 0 15px 0;
	font-size: 25pt;
}

table {
	margin: 30px auto;
	border: 0;
	color: #fff;
	line-height: 1.5;
	width: 55%;
	border: 0;
}

th {
	padding: 12px 0 12px 18px;
	border-bottom-width: 0;
	color: #353535;
	width: 14%;
	text-align: left;
	font-weight: normal;
	background-color: #fff;
}

td {
	color: #353535;
	font-size: 14px;
	vertical-align: middle;
	background-color: #fff;
}

input {
	border: none;
	width: 85%;
}

.line {
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
}

.td_content {
	margin: 0 10px 10px 10px;
}

textarea {
	width: 100%;
	height: 6.25em;
	border: none;
	resize: none;
}

#notice_insert_btn {
	cursor: pointer;
	font-weight: 700;
	border: none;
	width: 80px;
	height: 40px;
	text-decoration: none;
	border-radius: 25px;
	background: rgb(90, 90, 90);
	color: white;
	font-size: 12px;
}

#notice_insert_btn:hover {
	background: #d9bba9;
}
</style>
</head>
<body>
	<div id="container">
		<section id="notice_insert_section">
			<h2 style="margin-top: 10px;">글을 수정하는 공간입니다.</h2>
			<form
				action="${pageContext.servletContext.contextPath }/boardUpdate.do"
				method="post">
				<table border="1">
					<tbody>
						<tr class="line">
							<th>제목</th>
							<td><input id="title" type="text" value="${board.title}" name="title" autofocus required></td>
						</tr>
						<tr>
							<th>내용</th>
							<td></td>
						</tr>
						<tr>
							<td colspan="2"><div class="td_content">
									<textarea cols="60" row="5" id="content" name="content">${board.content}</textarea>
								</div></td>
						</tr>
						 <input	type="hidden" name="board_no" value="${board.no}">
					</tbody>
				</table>
				<input id="notice_insert_btn" type="submit" value="수정"> <a
					href="${pageContext.servletContext.contextPath }/board.do"><input
					id="notice_insert_btn" type="button" value="돌아가기"></a>
			</form>
		</section>
	</div>
</body>
</html>