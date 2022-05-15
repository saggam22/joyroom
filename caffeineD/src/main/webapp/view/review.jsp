<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review.jsp</title>
</head>
<style>
.pop_wrap {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: rgba(0, 0, 0, .5);
	font-size: 0;
	text-align: center;
}

.pop_wrap:after {
	display: inline-block;
	height: 100%;
	vertical-align: middle;
	content: '';
}

.pop_wrap .pop_inner {
	display: inline-block;
	padding: 20px 30px;
	background: #fff;
	width: 500px;
	vertical-align: middle;
	font-size: 15px;
	text-align: left;
}

.star {
	color: #f5d36c;
}

button {
	background: rgba(0, 0, 0, 0);
	border: none;
	padding: 2px;
}

.review {
	font-size: 10pt;
	padding: 20px;
	text-align: center;
}

span {
	padding-left: 5px;
}
</style>
<body>
	<c:choose>
		<c:when test="${!empty error}">
			<script>
				alert("${error }")
			</script>
		</c:when>
		<c:otherwise>
			<c:if test="${!empty success }">
				<script>
					alert("${success }")
				</script>
			</c:if>
		</c:otherwise>
	</c:choose>

	<a href="#reviewInsert" class="btn_open">등록</a>

	<c:choose>
		<c:when test="${empty reviewList }">리뷰가 없습니다.</c:when>
		<c:otherwise>
			<article>
				<c:forEach var="review" items="${reviewList }">
					<div id="${review.no }" class="review">
						<div>
							<c:if test="${!empty review.img }">
								<img width="200px"
									src="${pageContext.servletContext.contextPath }/upload/${review.img }">
							</c:if>
						</div>
						<div>
							<span class="userProf" name="${review.userId }"><img src="" width="30px"></span>${review.userNick }</div>
						<div>
							<span class="star"><c:choose>
									<c:when test="${review.star eq '5' }">★★★★★</c:when>
									<c:when test="${review.star eq '4' }">★★★★☆</c:when>
									<c:when test="${review.star eq '3' }">★★★☆☆</c:when>
									<c:when test="${review.star eq '2' }">★★☆☆☆</c:when>
									<c:when test="${review.star eq '1' }">★☆☆☆☆</c:when>
								</c:choose></span> ${review.date }
						</div>
						<div>
							<span id="likeCount_${review.no }">${review.like }</span>
							<button id="likeBtn_${review.no }" class="likeBtn" type="button"
								name="">
								<img id="heart_${review.no }" src="" width="15px">
							</button>
						</div>
						<div>
							<pre>${review.content }</pre>
						</div>
					</div>
				</c:forEach>
			</article>
		</c:otherwise>
	</c:choose>


	<div class="wrap">
		<!-- 리뷰 등록 -->
		<div id="reviewInsert" class="pop_wrap" style="display: none;">

			<div class="pop_inner">
				<button type="button" class="btn_close">X</button>
				<br>
				<form
					action="${pageContext.servletContext.contextPath }/reviewInsert.do"
					method="post" enctype="multipart/form-data">
					<input type="hidden" name="user" value="wlqls12@naver.com">
					<input type="hidden" name="cafeNo" value="1">
					<div id="imgSection">
						<img id="reviewImg" src="" width="300px">
					</div>
					<div>
						<input type="hidden" id="filePath" disabled="disabled"
							value="리뷰 사진"> <label for="uploadImg"
							style="border: none; font-size: 10pt;">사진 첨부하기</label> <input
							id="uploadImg" type="file" name="img"
							accept="image/jpg, image/png, image/jpeg"
							style="position: absolute; clip: rect(0, 0, 0, 0);">
					</div>
					<div id="insertStar">
						<input class="starVal" type="hidden" name="star" value="">
						<button class="starBtn" type="button" name="1">
							<img
								src="${pageContext.servletContext.contextPath }/img/eptstar.svg.png"
								width="15px">
						</button>
						<button class="starBtn" type="button" name="2">
							<img
								src="${pageContext.servletContext.contextPath }/img/eptstar.svg.png"
								width="15px">
						</button>
						<button class="starBtn" type="button" name="3">
							<img
								src="${pageContext.servletContext.contextPath }/img/eptstar.svg.png"
								width="15px">
						</button>
						<button class="starBtn" type="button" name="4">
							<img
								src="${pageContext.servletContext.contextPath }/img/eptstar.svg.png"
								width="15px">
						</button>
						<button class="starBtn" type="button" name="5">
							<img
								src="${pageContext.servletContext.contextPath }/img/eptstar.svg.png"
								width="15px">
						</button>
					</div>
					<textarea id="rContent" name="content"
						placeholder="리뷰 내용을 10자 이상 입력해 주세요.&#13;&#10;사진은 5MB 이하의 PNG, JPG, JPEG 파일만 등록 가능합니다."
						cols="50" rows="10"></textarea>
					<br>
					<button type="submit">등록</button>
				</form>
			</div>
		</div>
	</div>

</body>

<script src="js/review.js"></script>
</html>