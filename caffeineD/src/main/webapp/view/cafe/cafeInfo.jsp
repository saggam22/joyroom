<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  <title>cafeInfo.jsp</title>
  <style>
   ul {
  	list-style: none;
  	margin: 0;
  	padding: 0;
  	}
  	input {
  	margin-top:20px;
  	}
  </style>
</head>
<body>
<div id="map" style="width:60%;height:350px;"></div>
<div id="info">
	<h4>information</h4>
	<ul id="ulTag">
		<li>${cafeinfo.name }</li>
		<li>${cafeinfo.address }</li>
		<li>${cafeinfo.tel }</li>
	</ul>
	<a href='#' onclick="changeBtn()" id="bookmarkBtn">
	<img id=mark src="${pageContext.servletContext.contextPath }/img/unbookmark.png" width="30px"></a>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4583766540818c898f0a4d850e5046e&libraries=services"></script>
<script>

function changeBtn() {
	
	 fetch('${pageContext.servletContext.contextPath }/bookmarkCheck.do', {
	 		method: 'post',
	    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
	    body: 'cafeNo=${cafeinfo.no}'
	 	})
	 	.then(result =>result.json())
	 	.then(result => {
	 		console.log(typeof result.bookmarkCheck);
	 		if(result.bookmarkCheck == "false") {
	 			console.log(result.bookmarkCheck);
	 			let tag = document.getElementById("mark");
	 			tag.setAttribute("src","${pageContext.servletContext.contextPath }/img/bookmark.png"); //속성값 부여할땐 절대경로 사용가능
		  	alert("북마크 완료")
	 		} else {
		  	console.log(result.bookmarkCheck);
		  	let tag = document.getElementById("mark").src = getPathRootJump()+"/img/unbookmark.png"; //함수 사용해보기
		  	alert("북마크 취소")
		  	}
	 	})
	 	.catch(error => console.log(error));
	 }

//절대경로 구하는 함수
function getPathRootJump() {
	var pathName = window.location.pathname.substring(1);
	var webName = pathName == '' ? '' : pathName.substring(0, pathName.indexOf('/'));
	var path_root = window.location.protocol + '//' + window.location.host + '/' + webName + '/';
	return path_root;
}

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch("${cafeinfo.address}", function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: `<div style="width:150px;text-align:center;padding:6px 0;">${cafeinfo.name}</div>`
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});
</script>
<jsp:include page="/view/review/review.jsp"></jsp:include>
</body>
</html>