<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view/cafeListOutput.jsp</title>
</head>
<style>
.pop_wrap{position:fixed; top:0; left:0; right:0; bottom:0; background:rgba(0,0,0,.5); font-size:0; text-align:center;}
.pop_wrap:after{display:inline-block; height:100%; vertical-align:middle; content:'';}
.pop_wrap .pop_inner{display:inline-block; padding:20px 30px; background:#fff; width:500px; vertical-align:middle; font-size:15px;}
</style>
<body>
<c:choose>
<c:when test="${!empty error}"><script>alert("${error }")</script></c:when>
<c:otherwise><c:if test="${!empty success }"><script>alert("${success }")</script></c:if></c:otherwise>
</c:choose>

	<div class="wrap">
  <a href="#pop_info" class="btn_open">등록</a>
  
  <div id="pop_info" class="pop_wrap" style="display:none;">
    <div class="pop_inner">
		<button type="button" class="btn_close">X</button><br>
		
    <form action="${pageContext.servletContext.contextPath }/reviewInsert.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="user" value="wlqls12@naver.com">
		<input type="hidden" name="cafeNo" value="1">
      평점 
      <select name="star">
				<option value="5">★★★★★</option>
				<option value="4">★★★★☆</option>
				<option value="3">★★★☆☆</option>
				<option value="2">★★☆☆☆</option>
				<option value="1">★☆☆☆☆</option>
			</select><br>
		<input type="file" name="img"><br>
		<textarea name="content" placeholder="리뷰 내용을 입력해 주세요." cols="50" rows="10"></textarea><br>

		<input type="submit" value="등록">
	</form>
     
    </div>
  </div>
 </div>
 
<c:choose>
	<c:when test="${empty reviewList }"><h3>리뷰가 없습니다.</h3></c:when>
	<c:otherwise>
		<c:forEach var="review" items="${reviewList }">
			<table id="${review.no }">
			<tr><td></td>
				<td><c:if test="${!empty review.img }">
					<img width="200px" src="${pageContext.servletContext.contextPath }/upload/${review.img }">
					</c:if></td>
			</tr>
			<tr><td>user</td><td>${review.user }</td></tr>
			<tr><td>date</td><td>${review.date }</td></tr>
			<tr><td>star</td><td>${review.star }</td></tr>
			<tr><td>like</td><td>${review.like }<input class="likeBtn" type="button" name="like" value="좋아요"></td></tr>
			<tr><td>content</td><td>${review.content }</td></tr>
			</table><br>
		</c:forEach>
	</c:otherwise>
</c:choose>


</body>

<script type="text/javascript">

var target = document.querySelectorAll('.btn_open');
var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
var targetID;

// 팝업 열기
for(var i = 0; i < target.length; i++){
  target[i].addEventListener('click', function(){
    targetID = this.getAttribute('href');
    document.querySelector(targetID).style.display = 'block';
  });
}

// 팝업 닫기
for(var j = 0; j < target.length; j++){
  btnPopClose[j].addEventListener('click', function(){
    this.parentNode.parentNode.style.display = 'none';
  });
}


// 좋아요
let likeBtn = document.querySelectorAll('.likeBtn');

for(var i = 0; i < likeBtn.length; i++){
	likeBtn[i].addEventListener('click', function(){
			// 버튼을 누르면 해당 리뷰의 전체 좋아요 수 +1
			// 현재 유저가 해당 리뷰에 좋아요를 눌렀다는 것을 저장 -> 다음에 들어왔을 때 좋아요 표시가 되어있어야 함.
			console.log(this);
			if (this.value === '좋아요') {
		  	this.value = '좋아요 해제';		
		  	let reviewNo = this.parentNode.parentNode.parentNode.parentNode.id;
		  	
		     fetch('reviewLike.do', {
		    	method: 'post',
					headers: {'Content-Type': 'application/x-www-form-urlencoded'},
				  body: `job=like&id=wlql12@naver.com&reviewNo=${'${reviewNo}'}`
		    })
		    	.then(result => result.json())
/* 		    	.then(likeCount => {
		    		this.parentNode.innerHTML = ${'${result.likeCount }'};
		    	}) */
		    	.catch(error => console.log(error)); 
		    
		    
			// 한번 더 누르면 전체 좋아요수 -1 / 현재 유저의 리뷰 좋아요 삭제
			} else if (this.value === '좋아요 해제') {
				this.value = '좋아요';
				let reviewNo = this.parentNode.parentNode.parentNode.parentNode.id;
				
		    fetch('reviewLike.do', {
		    	method: 'post',
					headers: {'Content-Type': 'application/x-www-form-urlencoded'},
				  body: `job=unlike&id=wlql12@naver.com&reviewNo=${'${reviewNo}'}`
		    
		    })
		    	.then(result => console.log(result))
		    	.catch(error => console.log(error));
			}
			
});
}


</script>
</html>