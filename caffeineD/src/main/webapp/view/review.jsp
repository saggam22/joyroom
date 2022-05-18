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

.userProf {
	padding: 0;
	display: inline-block;
	width: 30px;
	height: 30px;
	border-radius: 70%;
	overflow: hidden;
}

.userProf img {
	width: 100%;
	height: 100%;
	object-fit: cover;
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

    #imgSection {
      width: 400px;
      min-height: 30px;
      padding: 10px;
    }

    #imgSection:empty:before {
      content: attr(data-placeholder);
      color: #999;
      font-size: .9em;
    }
</style>
<body>
	<c:choose>
		<c:when test="${!empty error}">
			<script>
				alert("${error }")
			</script>
			<%
			request.getSession().removeAttribute("error");
			%>
		</c:when>
		<c:otherwise>
			<c:if test="${!empty success }">
				<script>
					alert("${success }")
				</script>
				<%
				request.getSession().removeAttribute("success");
				%>
			</c:if>
		</c:otherwise>
	</c:choose>

	<c:choose>
		<c:when test="${empty user }"></c:when>
		<c:otherwise>
			<a href="#reviewInsert" class="btn_open">등록</a>
		</c:otherwise>
	</c:choose>

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
							<span class="userProf"><img
								src="${pageContext.servletContext.contextPath }/img/${review.userImg }"></span>${review.userNick }</div>
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
								name="nonUser">
								<img id="heart_${review.no }"
									src="${pageContext.servletContext.contextPath }/img/eptheart.svg.png"
									width="15px">
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
					<input type="hidden" name="cafeNo" value="1">
					<div><img id="imgSection" src="" width="200px"></div>
		 				<input type="hidden" id="filePath" disabled="disabled"> 
						<label for="uploadImg" style="border: none; font-size: 10pt;">사진 올리기</label> 
						<input id="uploadImg" type="file"
							accept="image/jpg, image/png, image/jpeg"
							style="position: absolute; clip: rect(0, 0, 0, 0);">
						<!--<input type='file' id='reviewImg' multiple='multiple />' -->

					<div>
						
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