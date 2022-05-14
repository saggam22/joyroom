<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>myReview.jsp</title>
	<style>
		.pop_wrap{position:fixed; top:0; left:0; right:0; bottom:0; background:rgba(0,0,0,.5); font-size:0; text-align:center;}
		.pop_wrap:after{display:inline-block; height:100%; vertical-align:middle; content:'';}
		.pop_wrap .pop_inner{display:inline-block; padding:20px 30px; background:#fff; width:500px; vertical-align:middle; font-size:15px; text-align:left;}
		button {background:rgba(0,0,0,0); border:none; padding:0}
		.star {color:#f5d36c;}
	</style>
</head>
<body>

	<c:choose>
	<c:when test="${!empty error}"><script>alert("${error }")</script></c:when>
	<c:otherwise><c:if test="${!empty success }"><script>alert("${success }")</script></c:if></c:otherwise>
	</c:choose>

	<c:choose>
		<c:when test="${empty myReviewList }">리뷰가 없습니다.</c:when>
		<c:otherwise>
			<article>
			<c:forEach var="review" items="${myReviewList }">
			<div id="${review.no }" class="review">
				<div><c:if test="${!empty review.img }">
					<img width="200px" src="${pageContext.servletContext.contextPath }/upload/${review.img }">
					</c:if>
				</div>
				<div>${review.user }</div>
				<div>
					<span class="star"><c:choose>
						<c:when test="${review.star eq '5' }">★★★★★</c:when>
						<c:when test="${review.star eq '4' }">★★★★☆</c:when>
						<c:when test="${review.star eq '3' }">★★★☆☆</c:when>
						<c:when test="${review.star eq '2' }">★★☆☆☆</c:when>
						<c:when test="${review.star eq '1' }">★☆☆☆☆</c:when>
					</c:choose></span>
					${review.date }
				</div>
				<div>
					<span id="likeCount_${review.no }">${review.like }</span>
					<button id="likeBtn_${review.no }" class="likeBtn" type="button" name="">
						<img id="heart_${review.no }" src="" width="15px">
					</button>
				</div>
				<div>
					${review.content }
				</div>
				<a href="#reviewUpdate" class="btn_open"><button type="button">수정</button></a>
				<button id="reviewDelBtn" type="button" name="#reviewDelete">삭제</button>
			</div>
			</c:forEach>
			</article>
		</c:otherwise>
	</c:choose>
	
	<!-- 리뷰 수정 팝업 -->
	<div id="reviewUpdate" class="pop_wrap" style="display:none;">
			
			<div class="pop_inner">
				<button type="button" class="btn_close">X</button><br>	
			    <form action="${pageContext.servletContext.contextPath }/reviewUpdate.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="user" value="wlqls12@naver.com">
					<input id="reviewNo" type="hidden" name="reviewNo" value="">
					<div id="reviewImg"></div>
					<div id="updateStar">
						<input class="starVal" type="hidden" name="star" value="">
						<button class="starBtn" type="button" name="1"><img src="${pageContext.servletContext.contextPath }/img/eptstar.svg.png" width="15px"></button>
						<button class="starBtn" type="button" name="2"><img src="${pageContext.servletContext.contextPath }/img/eptstar.svg.png" width="15px"></button>
						<button class="starBtn" type="button" name="3"><img src="${pageContext.servletContext.contextPath }/img/eptstar.svg.png" width="15px"></button>
						<button class="starBtn" type="button" name="4"><img src="${pageContext.servletContext.contextPath }/img/eptstar.svg.png" width="15px"></button>
						<button class="starBtn" type="button" name="5"><img src="${pageContext.servletContext.contextPath }/img/eptstar.svg.png" width="15px"></button>
					</div>
					<div><input type="file" name="img"></div>
					<textarea name="content" placeholder="리뷰 내용을 입력해 주세요." cols="50" rows="10"></textarea><br>
					<button type="submit">수정</button>
				</form>
			</div>
	</div>
	
	<!-- 리뷰 삭제 팝업 -->
	<div id="reviewDelete" class="pop_wrap" style="display:none;">
			
			<div class="pop_inner">
				정말로 리뷰를 삭제하시겠습니까?
				<button type="button">예</button><button type="button" class="btn_close">아니오</button>
			</div>
			
	</div>
</body>
<script>

	document.addEventListener('DOMContentLoaded', DOMLoadedCallBack);
	
	// 평점
	let starBtns = document.querySelectorAll('.starBtn');

	for(let i = 0; i < starBtns.length; i++){
		starBtns[i].addEventListener('click', starCallBack);
	}
	
	let reviewDelBtn = document.querySelector('#reviewDelBtn');
	reviewDelBtn.addEventListener('click', function() {
		console.log('click');
		
		targetID = this.getAttribute('href');
    	document.querySelector(targetID).style.display = 'block';
    	
	})
	
	
	function DOMLoadedCallBack() {
		
		// 좋아요 체크 조회
		let reviews = document.querySelectorAll('.review');
		
		for(let i = 0; i < reviews.length; i++) {
		    fetch('likeCheck.do', {
		    	method: 'post',
				headers: {'Content-Type': 'application/x-www-form-urlencoded'},
				body: `id=wlqls12@naver.com&reviewNo=${'${reviews[i].id}'}`
		    })
				.then(result => result.json())
				.then(likeResult => {
					
					let likeBtn = document.getElementById(`likeBtn_${'${reviews[i].id}'}`);
					let likeHeart = document.getElementById(`heart_${'${reviews[i].id}'}`);
					
						if (likeResult.likeCheck === 'true') {
							likeBtn.setAttribute('name', 'like');
							likeHeart.setAttribute('src', '${pageContext.servletContext.contextPath }/img/heart.svg.png');
						} else {
							likeBtn.setAttribute('name', 'unlike');
							likeHeart.setAttribute('src', '${pageContext.servletContext.contextPath }/img/eptheart.svg.png');
						}
						 
				})
				.catch(error => console.log(error));
			
		}
	
		// 좋아요 버튼
		let likeBtns = document.querySelectorAll('.likeBtn');
	
		for(let i = 0; i < likeBtns.length; i++){
			likeBtns[i].addEventListener('click', likeCallBack);
		}
		
		// 수정 팝업
		let target = document.querySelectorAll('.btn_open');
		let btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
		let targetID;
		
			// 팝업 열기
		for(let i = 0; i < target.length; i++){
			target[i].addEventListener('click', function(){
		    	targetID = this.getAttribute('href');
		    	document.querySelector(targetID).style.display = 'block';
		    
				fetch('reviewSelect.do', {
					method: 'post',
					headers: {'Content-Type': 'application/x-www-form-urlencoded'},
					body: `id=wlqls12@naver.com&reviewNo=${'${this.parentNode.id}'}`
				})
					.then(result => result.json())
					.then(review => {
							console.log(review);
						    
						    let imgDiv = document.getElementById('reviewImg');
						    let img = document.createElement('img');
						    img.setAttribute('src', `${pageContext.servletContext.contextPath }/upload/${'${review.img}'}`);
						    img.setAttribute('width', '300px');
						    imgDiv.appendChild(img);
						    
						    let starBtns = document.querySelectorAll('.starBtn');
						    for(let i = 0; i < Number(review.star); i++) {
								let starImg = starBtns[i].childNodes[0];
								starImg.setAttribute('src', '${pageContext.servletContext.contextPath }/img/star.svg.png');
							}
						    document.querySelector('#updateStar .starVal').value = review.star;
						    
						    document.querySelector('#reviewUpdate input[type=file]');
						    
						    document.querySelector('#reviewUpdate textarea').value = review.content;
						    
						    document.querySelector('#reviewNo').value = review.no;
						    
						})
					.catch(error => console.log(error));
						
			});
		}
			
			// 팝업 닫기
		for(let i = 0; i < target.length; i++){
		  btnPopClose[i].addEventListener('click', function(){	  
		    this.parentNode.parentNode.style.display = 'none';
		    document.querySelector('#reviewUpdate textarea').value = '';
		    		    
		    let starBtns = document.querySelectorAll('.starBtn');
			for(let i = 0; i < 5; i++) {
			    let starImg = starBtns[i].childNodes[0];
				starImg.setAttribute('src', '${pageContext.servletContext.contextPath }/img/eptstar.svg.png');
			}
			
			document.getElementById('reviewImg').childNodes[0].remove();

		  });
		}
			
	
	} //end of DOMLoadedCallBack()
	
	
	//좋아요 버튼 콜백
	function likeCallBack() {
	
		// 버튼을 누르면 해당 리뷰의 전체 좋아요 수 +1
		// 현재 유저의 좋아요 정보 추가 -> 다시 들어왔을 때 좋아요가 미리 선택되어 있는 기능 구현하기 위함.
		let reviewNo = this.id.substr(8);
		let likeBtn = document.getElementById(`likeBtn_${'${reviewNo}'}`);
		let likeHeart = document.getElementById(`heart_${'${reviewNo}'}`);
		let likeCount = document.getElementById(`likeCount_${'${reviewNo}'}`);
			
		if (this.name === 'unlike') {
			
			likeBtn.setAttribute('name', 'like');
			likeHeart.setAttribute('src', '${pageContext.servletContext.contextPath }/img/heart.svg.png');
			  
	 		fetch('reviewLike.do', {
			    method: 'post',
				headers: {'Content-Type': 'application/x-www-form-urlencoded'},
				body: `job=like&id=wlqls12@naver.com&reviewNo=${'${reviewNo}'}`
			})
			 	.then(like => {
			 		likeCount.innerHTML = String(Number(likeCount.innerHTML)+1);
			    }) 
			    .catch(error => console.log(error));  
	
		// 한번 더 누르면 전체 좋아요수 -1 / 현재 유저의 좋아요 정보 삭제
	
		} else if (this.name === 'like') {
	
			likeBtn.setAttribute('name', 'unlike');
			likeHeart.setAttribute('src', '${pageContext.servletContext.contextPath }/img/eptheart.svg.png')
			
			let reviewNo = this.id.substr(8);
				
	 	    fetch('reviewLike.do', {
		    	method: 'post',
				headers: {'Content-Type': 'application/x-www-form-urlencoded'},
				body: `job=unlike&id=wlqls12@naver.com&reviewNo=${'${reviewNo}'}`
		    })
		    	.then(like => {
		    		likeCount.innerHTML = String(Number(likeCount.innerHTML)-1);
		    	}) 
		    	.catch(error => console.log(error)); 
		}
			
	} //end of likeCallBack()
	
	// 평점 콜백
	function starCallBack() {
		let starBtns = document.querySelectorAll('.starBtn');
	
			for(let i = 0; i < 5; i++) {
				let starImg = starBtns[i].childNodes[0];
				starImg.setAttribute('src', '${pageContext.servletContext.contextPath }/img/eptstar.svg.png');
			}
		
			for(let i = 0; i < Number(this.name); i++) {
				
				let starImg = starBtns[i].childNodes[0];
				starImg.setAttribute('src', '${pageContext.servletContext.contextPath }/img/star.svg.png');
			}
			
			this.parentNode.childNodes[1].value = this.name;
		
	}
</script>
</html>