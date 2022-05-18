<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페정보</title>
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
</head>
<body>
	<div class=container>
		<ul id="anchor">
			<li><a href="javascript:path1();">수성구</a></li>
			<li><a href="javascript:path2();">서구</a></li>
			<li><a href="javascript:path3();">북구</a></li>
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
	let path = '';
	
	function path1() {
			path='https://api.odcloud.kr/api/15038007/v1/uddi:9e4ee99e-33f1-47c0-95c5-fcbdc7d5a83d?page=1&perPage=10&serviceKey=2FmiSQ4c4HNQcQ6eMrBVg4pRxsodEnXzbwQGOLOcb7Il%2BtTSwFCJMHGMuRvjlEiQeab4vnMkJJQbHT2qcqiStQ%3D%3D';
			loadPath();
		} 
	function path2() {
			path='https://api.odcloud.kr/api/15092718/v1/uddi:e151f387-d46c-4d3b-99de-9d4255fea609?page=1&perPage=10&serviceKey=2FmiSQ4c4HNQcQ6eMrBVg4pRxsodEnXzbwQGOLOcb7Il%2BtTSwFCJMHGMuRvjlEiQeab4vnMkJJQbHT2qcqiStQ%3D%3D';
			loadPath();		
		} 
	function path3() {
			path='https://api.odcloud.kr/api/15095876/v1/uddi:170b2205-6644-4de7-84dc-80b34a492281?page=1&perPage=10&serviceKey=2FmiSQ4c4HNQcQ6eMrBVg4pRxsodEnXzbwQGOLOcb7Il%2BtTSwFCJMHGMuRvjlEiQeab4vnMkJJQbHT2qcqiStQ%3D%3D';
			loadPath();
		}
	
	function loadPath() {
		let loadData = [];
		fetch(path)
		.then(result => result.json())
		.then(json => {
			console.log(json.data);
			let jsonData = json.data
			jsonData.forEach (cafe => {
				let cafeObj = {};
				if (cafe['소재지(도로명)']) {
					cafeObj = {no:cafe.연번, name: cafe.업소명, doro: cafe['소재지(도로명)'], jibun: cafe['소재지(지번)'], tel: cafe.소재지전화};
				} else {
					cafeObj = {no:cafe['서비스아이디(ID)'], name: cafe.사업장명, doro: cafe.도로명주소, jibun: cafe.주소, tel: cafe.소재지전화, menu: cafe.대표메뉴, open: cafe.영업시간};
				}
				loadData.push(cafeObj);
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
				aTag.setAttribute('href', `cafeSebuInfo.jsp?juso=\${cafeinfo.doro}&name=\${cafeinfo.name}&tel=\${cafeinfo.tel}&menu=\${cafeinfo.menu}&open=\${cafeinfo.open}`);
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