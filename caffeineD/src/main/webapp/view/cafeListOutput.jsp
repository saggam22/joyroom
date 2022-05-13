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
<c:if test="${!empty error}"><script>alert("${error }")</script></c:if>

<c:choose>
	<c:when test="${empty reviewList }"><h3>리뷰가 없습니다.</h3></c:when>
	<c:otherwise>
	<div class="wrap">
  <a href="#pop_info" class="btn_open">등록</a>
  <div id="pop_info" class="pop_wrap" style="display:none;">
    <div class="pop_inner">
      	<form action="${pageContext.servletContext.contextPath }/reviewInsert.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="userNick" value="">
		<input type="hidden" name="cafeNo" value="">

        평점 
        <select name="rstar">
			<option value="5">★★★★★</option>
			<option value="4">★★★★☆</option>
			<option value="3">★★★☆☆</option>
			<option value="2">★★☆☆☆</option>
			<option value="1">★☆☆☆☆</option>
		</select><br>

		<input type="file" name="rimage"><br>
		<textarea name = "rcontents" placeholder="리뷰 내용을 입력해 주세요." cols="50" rows="10"></textarea><br>

		<input type="submit" value="등록">
	</form>
      <button type="button" class="btn_close">닫기</button>
    </div>
  </div>
 </div>
		<c:forEach var="review" items="${reviewList }">
			<table>
			<tr><td></td>
				<td><c:if test="${!empty review.rImage }">
					<img width="200px" src="${pageContext.servletContext.contextPath }/upload/${review.rImage }">
					</c:if></td>
			</tr>
			<tr><td>user</td><td>${review.rUser }</td></tr>
			<tr><td>date</td><td>${review.rDate }</td></tr>
			<tr><td>star</td><td>${review.rStar }</td></tr>
			<tr><td>like</td><td>${review.rLike }</td></tr>
			<tr><td>contents</td><td>${review.rContents }</td></tr>
			</table><br>
		</c:forEach>
	</c:otherwise>
</c:choose>


</body>

<script>

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
</script>
</html>