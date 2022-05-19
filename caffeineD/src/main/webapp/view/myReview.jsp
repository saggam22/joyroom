<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myReview.jsp</title>
<style>
	<link href="css/review.css" rel="stylesheet">
</style>

</head>
<body>

	<c:choose>
		<c:when test="${!empty error}">
			<script>
				alert("${error }")
			</script>
			<% request.getSession().removeAttribute("error"); %>
		</c:when>
		<c:otherwise>
			<c:if test="${!empty success }">
				<script>
					alert("${success }")
				</script>
				<% request.getSession().removeAttribute("success"); %>
			</c:if>
		</c:otherwise>
	</c:choose>

	<c:choose>
		<c:when test="${empty myReviewList }">리뷰가 없습니다.</c:when>
		<c:otherwise>
			<article>
				<c:forEach var="review" items="${myReviewList }">
					<div id="${review.no }" class="review">
						<div>
							<c:if test="${!empty review.img }">
								<img width="200px"
									src="${pageContext.servletContext.contextPath }/img/reviewimg/${review.img }">
							</c:if>
						</div>
						<div>
							<span class="userProf"><img src="${pageContext.servletContext.contextPath }/img/profimg/${review.userImg }"></span>${review.userNick }</div>
						<div>
							<span>${review.date }</span> <span class="star"><c:choose>
									<c:when test="${review.star eq '5' }">★★★★★</c:when>
									<c:when test="${review.star eq '4' }">★★★★☆</c:when>
									<c:when test="${review.star eq '3' }">★★★☆☆</c:when>
									<c:when test="${review.star eq '2' }">★★☆☆☆</c:when>
									<c:when test="${review.star eq '1' }">★☆☆☆☆</c:when>
								</c:choose></span> <span id="likeCount_${review.no }">${review.like }</span>
							<button id="likeBtn_${review.no }" class="likeBtn" type="button"
								name="">
								<img id="heart_${review.no }" src="" width="15px">
							</button>
						</div>
						<div>
							<pre>${review.content }</pre>
						</div>
						<a href="#reviewUpdate" class="btn_open"><button type="button">수정</button></a>
						<button name="delBtn_${review.no }" class="delBtn" type="button">삭제</button>
					</div>
				</c:forEach>
			</article>
		</c:otherwise>
	</c:choose>

	<div class="wrap">
		<!-- 리뷰 수정 팝업 -->
		<div id="reviewUpdate" class="pop_wrap" style="display: none;">

			<div class="pop_inner">
				<button type="button" id="btn_close">X</button>
				<br>
				<form
					action="${pageContext.servletContext.contextPath }/reviewUpdate.do"
					method="post" enctype="multipart/form-data" onsubmit="return submitCheck();">
					<input type="hidden" name="cafeNo" value="1">
					<input type="hidden" id="reviewNo" name="reviewNo">
					
					<div id="imgSection" data-placeholder='방문한 카페에서 찍은 사진을 자랑해 주세요!'></div>
						<label for="uploadImg" style="border: none; font-size: 10pt;">사진 변경</label> 
						<input id="uploadImg" name="img" type="file"
							accept="image/jpg, image/png, image/jpeg"
							style="position: absolute; clip: rect(0, 0, 0, 0);">
					<div id="updateStar">
						<input id="starVal" type="hidden" name="star" value="">
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

					<textarea name="content"
						placeholder="리뷰는 10자 이상 입력해 주세요.&#13;&#10;사진은 5MB 이하의 PNG, JPG, JPEG 파일만 등록 가능합니다."
						cols="50" rows="10" minlength="10" required oninvalid="this.setCustomValidity('리뷰를 10자 이상 입력해주세요.')"></textarea>
					<br>
					<button type="submit">수정</button>
				</form>
			</div>
		</div>
	</div>


</body>
<script src="js/myReview.js"></script>
<script>
function submitCheck() {
	let starVal = document.querySelector('#starVal');
	if (starVal.value === '') {
		alert('평점을 선택해주세요.')
		return false;
	}
}
</script>
</html>