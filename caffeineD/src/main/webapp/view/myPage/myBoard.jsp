<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 글</title>
<style>
#notice_insert_btn {
	cursor: pointer;
	font-weight: 700;
	text-decoration: none;
	border-radius: 25px;
	background: rgb(90, 90, 90);
	color: white;
	font-size: 12px;
}

#notice_insert_btn:hover {
	background: white;
	color: rgb(90, 90, 90);
}

.ftco-section {
	padding: 80px 0;
}
#my_board {
	background: #d9bba9;
	color: #2F170F;
	font-weight: 600;
}

</style>
</head>
<body>
		<section class="ftco-section">
			<div class="container">
				<div class="heading-section"><jsp:include page="/view/myPage/myPageMenu.jsp"></jsp:include></div>
				<div class="row">
					<div class="col-md-12">
						<div class="table-wrap" style="overflow-x: hidden">
							<c:choose>
								<c:when test="${empty all }">
									<h3>게시글이 없습니다.</h3>
								</c:when>
								<c:otherwise>
									<form>
										<table class="table">
											<thead class="thead-primary">
												<tr>
													<th class="num">번호</th>
													<th class="title">제목</th>
													<th class="name">작성자</th>
													<th class="date">작성일</th>
													<th class="view">조회수</th>
											<tbody>
												<c:forEach items="${all }" var="board">
													<tr>
														<td class="num">${board.no }</td>
														<td class="title"><a
															href="boardContents.do?no=${board.no}">${board.title }</a></td>
														<td class="name">${board.user_id }</td>
														<td class="date">${board.date }</td>
														<td class="view">${board.view }</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</form>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</section>
</body>
</html>