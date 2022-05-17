<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  <title>cafeSebuInfoOutput.jsp</title>
  <style>
   #map {
   	float: left;
   	}
   #info {
   	float: right;
   	width:35%;
   	margin-left:10px;
   	}
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
	<ul id="ulTag"></ul>
	<form action="${pageContext.servletContext.contextPath }/bookmarkInsert.do" method="post">
    <input type="hidden" name="cafeNo" value=${no }><br><!-- 카페 정보 받아오기 -->
		<input type="submit" value="북마크">
  </form>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4583766540818c898f0a4d850e5046e&libraries=services"></script>
<script>
let url = location.href;
console.log(url);
let apos = url.indexOf('address=');
let mpos = url.indexOf('name=');
let tpos = url.indexOf('tel=');
let npos = url.indexOf('no=');
let address = url.substring(apos+8, mpos-1);
let name = url.substring(mpos+5, tpos-1);
let tel = url.substring(tpos+4, npos-1);
let no = url.substring(mpos+3);
let kname = decodeURIComponent(name);
let kaddress = decodeURIComponent(address);
let raddress = kaddress.replace('%',' ');

obj = {
		name: kname,
		address: raddress,
		tel: tel,
};

let ul = document.getElementById('ulTag');
for (let feild in obj) {
	let li = document.createElement('li');
	li.innerHTML=obj[feild];
	ul.appendChild(li);
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
geocoder.addressSearch(raddress, function(result, status) {

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
            content: `<div style="width:150px;text-align:center;padding:6px 0;">\${kname}</div>`
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
</body>
</html>