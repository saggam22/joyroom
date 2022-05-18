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
</style>
<body>
	<div class=container>
		<ul id="anchor">
			<li><a href="javascript:load1();">전체</a></li>
			<li><a href="javascript:load2();">수성구</a></li>
			<li><a href="javascript:load3();">서구</a></li>
			<li><a href="javascript:load4();">북구</a></li>
		</ul>
		<div class="row" align="center">
			<table>
				<thead></thead>
				<tbody id="tbody"></tbody>
			</table>
		</div>
		<hr>
	</div>
	<script>
	
	let fields = ['name'];
	
	function load(path => {
		
		let loadData = [];
		fetch(`${pageContext.servletContext.contextPath }/cafeList.do`, {
			 method: 'post',
		      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
		      body: `cmd=all`
				 })
		 		.then(result => result.json())
		 		.then(json => {
		 			console.log(json);
		 			json.forEach (cafe => {
		 				let obj ={no:cafe.no, name:cafe.name, address:cafe.address, tel:cafe.tel};
		 				loadData.push(obj);
		 			});
		 			makeBody(loadData);
		 		})
		 		.catch(error => console.log(error));
	})
	load1();
	function load2() {
		let loadData = [];
		fetch(`${pageContext.servletContext.contextPath }/cafeList.do`, {
			 method: 'post',
		      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
		      body: `cmd=susung`
				 })
		 		.then(result => result.json())
		 		.then(json => {
		 			console.log(json);
		 			json.forEach (cafe => {
		 				let obj ={no:cafe.no, name:cafe.name, address:cafe.address, tel:cafe.tel};
		 				loadData.push(obj);
		 			});
		 			makeBody(loadData);
		 		})
		 		.catch(error => console.log(error));
		}
	
	 function makeBody(ary) {
			let body = document.getElementById('tbody');
			let count = 1;
			//이미 생성된 조회정보가 있으면 삭제
			while (body.hasChildNodes()) {
	    	body.removeChild(body.firstChild);
			}
			ary.forEach((cafeinfo) => {
				let tr = document.createElement('tr');
				body.appendChild(tr);
				let numTd = document.createElement('td');
				numTd.innerHTML = count++;
				tr.appendChild(numTd);
				fields.forEach((elem) => {
				let td = document.createElement('td');
				//name 필드일 경우에는 링크
				if (elem == 'name') {
					let aTag = document.createElement('a');
					aTag.setAttribute('href', `cafeInfo.jsp?address=\${cafeinfo.address}&name=\${cafeinfo.name}&tel=\${cafeinfo.tel}&no=\${cafeinfo.no}`);
					aTag.setAttribute('target', '_blank');
					aTag.innerHTML = cafeinfo[elem];
					td.appendChild(aTag);		
				} else {
					td.innerHTML = cafeinfo[elem];
				}
				tr.appendChild(td);	
				});
			});
		}
	</script>
</body>

</html>