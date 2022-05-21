<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>review.jsp</title>
</head>
<link href="css/review.css" rel="stylesheet">
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
		
	<div id="container">
	<c:choose>
		<c:when test="${empty reviewList }">첫 리뷰를 남겨보세요!	</c:when>
		<c:otherwise>
			<article id="reviews_info" >
					<div><span id="star_avg"></span><span style="color:rgb(120, 120, 120);"> / 5</span></div>
					<div id="star_show"></div>
					<div id="review_count" ></div>

					<table style="display:inline-block; ">
						<tr>
							<td>1</td><td class="star_info">★</td><td><div class="star_count_show"><div class="star_count_show_color"></div></div></td>
						</tr>
						<tr>
							<td>2</td><td class="star_info">★</td><td><div class="star_count_show"><div class="star_count_show_color"></div></div></td>
						</tr>
						<tr>
							<td>3</td><td class="star_info">★</td><td><div class="star_count_show"><div class="star_count_show_color"></div></div></td>
						</tr>
						<tr>
							<td>4</td><td class="star_info">★</td><td><div class="star_count_show"><div class="star_count_show_color"></div></div></td>
						</tr>
						<tr>
							<td>5</td><td class="star_info">★</td><td><div class="star_count_show"><div class="star_count_show_color"></div></div></td>
						</tr>
					</table>
						
			</article>
		</c:otherwise>
	</c:choose>
	

				<article>
					<c:choose>
						<c:when test="${empty user }"></c:when>
						<c:otherwise>
							<div>
								<a href="#reviewInsert" id="btn_open" onclick="javascript:topBtnNone();">Write</a>
							</div>
						</c:otherwise>
					</c:choose>
					<c:forEach var="review" items="${reviewList }">
						<div id="${review.no }" class="review">
							<div class="review_left">
								<c:if test="${!empty review.img }">
									<img width="100%"
										src="${pageContext.servletContext.contextPath }/img/reviewimg/${review.img }">
								</c:if>
							</div>
							<div class="review_right">
								<div style="position: relative;">
									<input type="hidden" value="${user.id }" name="loginUser">
									<span class="userProf"><img
										src="${pageContext.servletContext.contextPath }/img/profimg/${review.userImg }"></span>
									<span class="bold_text"
										style="margin-left: 15px; position: absolute; bottom: 15px;">${review.userNick }</span>
								</div>
								<div>
								<span class="star" style="">
									<c:choose>
										<c:when test="${review.star eq '5' }">★★★★★</c:when>
										<c:when test="${review.star eq '4' }">★★★★☆</c:when>
										<c:when test="${review.star eq '3' }">★★★☆☆</c:when>
										<c:when test="${review.star eq '2' }">★★☆☆☆</c:when>
										<c:when test="${review.star eq '1' }">★☆☆☆☆</c:when>
									</c:choose>
								</span>
									<span class="like_section">
										<span id="likeCount_${review.no }" style="color:black;">${review.like }</span>
										<button id="likeBtn_${review.no }" class="likeBtn"
											type="button" name="nonUser">
											
											<img id="heart_${review.no }"
												src="${pageContext.servletContext.contextPath }/img/eptheart.svg.png"
												width="14px">
										</button>
									</span>
								</div>
								<div style="line-height: 16pt; margin: 20px 0;">${review.content }</div>

							</div>
							<div
								style="font-size: 8pt; color: rgb(190, 190, 190); clear: both; text-align: right;">${review.date }</div>
						</div>

					</c:forEach>
				</article>
			<button id="moreBtn" onClick="listMore()"><img src="${pageContext.servletContext.contextPath }/img/moreBtn.png" style="width: 50px;" ></button>
			<div id="topBtn" style="cursor:pointer;" onclick="window.scrollTo(0,0);">TOP</div>
	</div>	


		<div class="wrap">
			<!-- 리뷰 등록 -->
			<div id="reviewInsert" class="pop_wrap" style="display: none;">

				<div class="pop_inner">
					<button type="button" id="btn_close">X</button>
					<br>

					<form name="insertForm" action="${pageContext.servletContext.contextPath }/reviewInsert.do" 
					method="post" enctype="multipart/form-data" onsubmit="return submitCheck();">
						<div class="pop_left">
							<input type="hidden" name="cafeNo" value="${cafeinfo.no }">
							<div id="imgSection"><div id="reviewImgDiv"><img id="firstImg" src="${pageContext.servletContext.contextPath }/img/emptyimg.jpg"></div></div>
							 <label for="uploadImg" style="border: none; font-size: 10pt; margin:20px 0 0 120px; color:rgb(120, 120, 120); ">사진 올리기</label> <input id="uploadImg" name="img" type="file"
								accept="image/jpg, image/png, image/jpeg"
								style="position: absolute; clip: rect(0, 0, 0, 0);">
						</div>
						<div class="pop_right">
							<div id="insertStar">
								<input id="starVal" type="hidden" name="star" value="">
								<button class="starBtn" type="button" name="1">
									<img
										src="${pageContext.servletContext.contextPath }/img/eptstar.svg.png"
										width="30px">
								</button>
								<button class="starBtn" type="button" name="2">
									<img
										src="${pageContext.servletContext.contextPath }/img/eptstar.svg.png"
										width="30px">
								</button>
								<button class="starBtn" type="button" name="3">
									<img
										src="${pageContext.servletContext.contextPath }/img/eptstar.svg.png"
										width="30px">
								</button>
								<button class="starBtn" type="button" name="4">
									<img
										src="${pageContext.servletContext.contextPath }/img/eptstar.svg.png"
										width="30px">
								</button>
								<button class="starBtn" type="button" name="5">
									<img
										src="${pageContext.servletContext.contextPath }/img/eptstar.svg.png"
										width="30px">
								</button>
							</div>
							<textarea id="rContent" name="content"
								placeholder="리뷰는 10자 이상 입력해 주세요.&#13;&#10;5MB 이하 PNG, JPG, JPEG 형식의&#13;&#10;파일 1개만 등록 가능합니다."
								cols="30" rows="9" minlength="10" required
								oninvalid="this.setCustomValidity('리뷰를 10자 이상 입력해주세요.')"></textarea>
							<div style="text-align: center;"><button id="innerBtn" type="submit">Upload</button></div>
						</div>
					</form>
					
					
				</div>
			</div>

		</div>
		
		

</body>

<script src="js/review.js"></script>
<script>
	const firstCount = 3;
	const moreCount = 5;
	let showCount = firstCount;

	let reviews = document.getElementsByClassName('review');
	let moreBtn = document.getElementById('moreBtn');
	
	if (reviews.length < 4) {
		moreBtn.style.display = 'none';
	} else {
		for (let i = firstCount; i < reviews.length; i++) {
			reviews[i].style.display = 'none';
		}
	}
	

	function listMore() {
		console.log('more');
		for (let i = showCount; i < showCount + moreCount; i++) {
			if (reviews[i] != null) {
				reviews[i].style.display = 'inline-block';
			} else {
				moreBtn.style.display = 'none';
			}
		}
		showCount += moreCount;
	}

	function submitCheck() {
		let starVal = document.querySelector('#starVal');
		if (starVal.value === '') {
			alert('평점을 선택해주세요.')
			return false;
		}
	}
	
	function topBtnNone() {
		let topBtn = document.querySelector('#topBtn');
		topBtn.style.display = 'none';
	}
</script>
</html>