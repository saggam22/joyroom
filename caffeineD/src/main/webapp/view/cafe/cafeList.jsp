<%@page import="co.dev.service.CafeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>cafeList.jsp</title>
</head>
<style>
#anchor {
	text-align: center;
}
#anchor li {
	display: inline-block;
	margin: 0 20px;
}
#anchor li a {
	text-decoration: none;
	font-weight: bold;
	cursor: pointer;
}
img {
	width: 200px;
	height: 200px;
}
a {
	display: inline-block;
	margin: 0 20px;
}
</style>
<body>
	<div class=container>
		<ul id="anchor">
			<li><a href="javascript:load('all');">전체</a></li>
			<li><a href="javascript:load('susung');">수성구</a></li>
			<li><a href="javascript:load('seogu');">서구</a></li>
			<li><a href="javascript:load('bukgu');">북구</a></li>
		</ul>
	</div>
	<div class="cafelist" id="list">
		<hr>
	</div>
	<div class="" id=pagination style="text-align:center">
	</div>
	<script>
	
	function load(path) {
		let loadData = [];
		fetch(`${pageContext.servletContext.contextPath }/cafeList.do`, {
			 method: 'post',
		      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
		      body: 'job='+path
				 })
		 		.then(result => result.json())
		 		.then(json => {
		 			console.log(json);
		 			json.forEach (cafe => {
		 				let obj ={no:cafe.no, name:cafe.name, address:cafe.address, tel:cafe.tel, img:cafe.img};
		 				loadData.push(obj);
		 			});
		 			makeDiv(loadData);
		 		})
		 		.catch(error => console.log(error));
		}
	
	load('all');
	
	 function makeDiv(ary) {
			let div = document.getElementById('list');
			//이미 생성된 조회정보가 있으면 삭제
			while (div.hasChildNodes()) {
	    	div.removeChild(div.firstChild);
			}
				let div1 = document.createElement('div');
				div1.className = "bigBox";
			ary.forEach((cafeinfo) => {
				let aTag = document.createElement('a');
				aTag.setAttribute('href', `cafeInfo.jsp?address=\${cafeinfo.address}&name=\${cafeinfo.name}&tel=\${cafeinfo.tel}&no=\${cafeinfo.no}`);
				div1.appendChild(aTag)
				let div2 = document.createElement('div');
				div2.className = "sallBox";
				aTag.appendChild(div2)
				
				let imgTag = document.createElement('img');
				imgTag.setAttribute('src', `${pageContext.servletContext.contextPath }/img/\${cafeinfo.img }`);
				let hTag = document.createElement('h4');
				hTag.innerHTML = cafeinfo.name;
				div2.appendChild(imgTag);
				div2.appendChild(hTag);
			});
			div.appendChild(div1);
		}
	 
	</script>
</body>

</html> 