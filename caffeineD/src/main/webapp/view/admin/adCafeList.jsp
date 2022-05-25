<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adCafeList.jps</title>
<link href="${pageContext.servletContext.contextPath }/css/table.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath }/css/adminTable.css"
	rel="stylesheet">
<style>

#ad {
	background: #d9bba9;
	color: #2F170F;
	font-weight: 600;
}

textarea {
	border: solid 0.2px rgb(90, 90, 90);
	width: 100%;
	height: 200px;
	resize:none;
}

#table {
	width: 100%;
	font-size: 14px;
	margin-top: 20px;
}

#table tbody td {
	padding: 10px;
	background: #f6f6f6;
	background: white;
}

.table_left {
	width: 100px;
}

.table_right {
	width: 100%;
}

#cafe_name {
	width: 100%;
	height: 30px;
}

.wrap {
	font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui,
		Roboto, 'Helvetica Neue', 'Segoe UI', 'Apple SD Gothic Neo',
		'Noto Sans KR', 'Malgun Gothic', sans-serßif;
	font-size: 10pt;
	box-sizing: border-box;
}

.pop_wrap {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: rgba(0, 0, 0, .5);
	font-size: 0;
	text-align: center;
	display: none;
}

.pop_wrap:after {
	display: inline-block;
	height: 100%;
	vertical-align: middle;
	content: '';
}

.pop_wrap .pop_inner {
	display: inline-block;
	padding: 30px;
	background: #fff;
	width: 500px;
	vertical-align: middle;
	font-size: 15px;
	text-align: left;
	box-shadow: 0 0 10px 1px rgb(120, 120, 120);
}
</style>
</head>
<body>

	<div id="container">


		<section class="ftco-section">
			<div class="container">
				<div class="heading-section"><jsp:include
						page="/view/admin/adminMenu.jsp"></jsp:include></div>

				<div class="row">
					<div class="col-md-12">

						<div class="table-wrap" style="overflow-x: hidden">
							<table class="table">
								<thead class="thead-primary text_center">
									<tr>
										<th></th>
										<th>번호</th>
										<th>이름</th>
										<th class="text_left">내용</th>
									</tr>
								</thead>
								<tbody class="text_center">
									<c:forEach items="${adCafeList }" var="ad_cafe">
										<tr>
											<td class="radio"><input type="radio" name="cafe_no"
												value="${ad_cafe.no }"></td>
											<td class="width_short">${ad_cafe.no }</td>
											<td class="width_long">${ad_cafe.name }</td>
											<td id="info_${ad_cafe.no }" class="content text_left">
												${ad_cafe.info }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<button class="button_no_back mini_button" type="button"
							name="update_view_btn" onclick="checkChecked(this);">수정</button>
						<button class="button_no_back mini_button" type="button"
							onclick="checkChecked(this);">삭제</button>

						<a id="btn_open" class="button_no_back mini_button right_btn"
							type="button" href="#adInsert">광고 등록</a>


					</div>
				</div>
			</div>
		</section>

		<!-- 광고 등록 -->
		<section class="wrap">
			<div id="adInsert" class="pop_wrap">
				<div class="pop_inner">
					<!-- 팝업 닫기 -->
					<button type="button" id="btn_close" class="button_no_back">X</button>
					<form name="ad_insert"
						action="${pageContext.servletContext.contextPath }/adCafeInsert.do"
						method="get">
						<table id="table">
							<tbody class="text_left">
								<tr>
									<td class="table_td">
										<select id="cafe_name" name="cafe_no">
											<c:forEach items="${cafeList }" var="cafe">
												<option value="${cafe.no }">${cafe.name }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td style="line-height: 16pt;">광고를 등록할 카페를 선택해 주세요.<br>
										목록에 없는 카페는 이미 광고가 등록된 카페입니다.
									</td>
								</tr>
								<tr>
									<td class="table_td"><textarea name="cafe_info"></textarea></td>
								<tr>
									<td class="table_td text_right"><button
											class="mini_button button_no_back" type="submit" onclick="return textCheck();">등록</button></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</section>

	</div>
</body>
<script>


function textCheck() {
	
	const frm = document.ad_insert;
	
	if (!frm.value) {
		alert('내용을 입력하세요.');
		return false;
	} 
	
}

document.addEventListener('DOMContentLoaded', function() {
	
	// 내용이 길 경우 텍스트 자른 후 더보기 버튼 생성
 	let contents = document.getElementsByClassName('content');
 	for (let i=0; i<contents.length; i++) {
 		let text = contents[i].innerHTML.substr(13);
 		if (text.length >= 170) {
 			contents[i].innerHTML = text.substr(0, 170);
	 		let moreBtn = document.createElement('button');
	 		moreBtn.innerHTML = '더보기';
	 		moreBtn.setAttribute('class', 'more_btn mini_button button_no_back ')
	 		moreBtn.setAttribute('style', 'display: block;');
	 		moreBtn.setAttribute('name', 'cut_state');		
	 		moreBtn.setAttribute('value', text);			
	 		contents[i].appendChild(moreBtn);				
 		}
 	
 	}
	 	// 내용 더보기
	 	let moreBtns = document.getElementsByClassName('more_btn');

	 	for (let i=0; i<moreBtns.length; i++) {
	 		moreBtns[i].addEventListener('click', function() {
	 			
	 			let td = this.parentNode;
	 			let oldText = td.firstChild;									
	 			let newText = document.createTextNode(moreBtns[i].value);		
	 			
	 			// 더보기 전 상태에서 버튼 클릭하면
	 			if (this.name === 'cut_state') {
	 				this.name = 'more_state';	
	 				this.innerHTML = '닫기';
	 			
	 			// 더보기 후 상태에서 버튼 클릭하면
	 			} else if (this.name === 'more_state') {
	 				this.name = 'cut_state';
	 				this.innerHTML = '더보기';
	 			}
	 			
 				this.value = oldText.nodeValue;	
 				td.replaceChild(newText, oldText);
	 				
	 		});
	 	}

})

// 등록 팝업
let target = document.querySelector('#btn_open');
let btnPopClose = document.querySelector('#btn_close');
let targetID;

// 팝업 열기

target.addEventListener('click', function() {
	targetID = this.getAttribute('href');
	document.querySelector(targetID).style.display = 'block';
});

// 팝업 닫기

btnPopClose.addEventListener('click', function() {

	this.parentNode.parentNode.style.display = 'none';

});

// 선택 체크
function checkChecked(e) {
	
	let radios = document.getElementsByName('cafe_no');
	let checkedNo;
	for (let i=0; i<radios.length; i++) {
		if (radios[i].checked) {
			checkedNo = radios[i].value;
		}
	}
	
	if (!checkedNo) {
		alert('선택된 광고가 없습니다.');
	} else {
		if (e.innerHTML === '수정') {
			adCafeUpdateView();
		} else if (e.innerHTML === '삭제') {
			adCafeDelete(checkedNo);
		}
	}
	
}

// 광고 삭제
function adCafeDelete(cafeNo) {
	let result = confirm('정말로 삭제하시겠습니까?');

	if (result) {
			fetch('adCafeDelete.do', {
				method:'post',
				headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
				body: `cafe_no=${'${cafeNo }'}`
			})
				.then(result => result.json())
				.then(result => {
					alert(`${'${result.messege}'}`)
					location.reload();
				})
				.catch(error => console.log(error));
	}
}

// 수정 textarea 생성
function adCafeUpdateView() {
	
	let radios = document.getElementsByName('cafe_no');
	let contents = document.getElementsByClassName('content');
	let moreBtns = document.getElementsByClassName('more_btn');
	for (let i=0; i<radios.length; i++) {
		if (radios[i].checked) {
			console.log(radios[i].value);
			
			let content = contents[i];
			let text = content.innerHTML.substr(14);
			
			if (moreBtns[i-1]) {
				if (moreBtns[i-1].name === 'cut_state') {
					text = moreBtns[i-1].value;
				} else {
					text = content.childNodes[0].nodeValue;
				}
				moreBtns[i-1].remove();
			} 
			
			let textarea = document.createElement('textarea');
			console.log(text);
			textarea.value = text;
			content.innerText = '';
			content.appendChild(textarea);
			
			let updateBtn = document.createElement('button');
			updateBtn.setAttribute('type', 'button');
			updateBtn.setAttribute('name', 'update_btn');
			updateBtn.setAttribute('class', 'button_no_back mini_button');
			updateBtn.innerText = '저장';
			updateBtn.setAttribute('onclick', 'adCafeUpdate();');
			content.appendChild(updateBtn);
			
			let cancelBtn = document.createElement('button');
			cancelBtn.setAttribute('type', 'button');
			cancelBtn.setAttribute('name', 'cancel_btn');
			cancelBtn.setAttribute('class', 'button_no_back mini_button');
			cancelBtn.innerText = '취소';
			cancelBtn.setAttribute('onclick', 'location.reload();')
			content.appendChild(cancelBtn); 
					
		}
	}
}

// 수정된 광고 저장
function adCafeUpdate() {
	
	let radios = document.getElementsByName('cafe_no');
	for (let i=0; i<radios.length; i++) {
		if (radios[i].checked) {
			let updInfo = document.getElementsByTagName('textarea')[0];
			fetch('adCafeUpdate.do', {
				method:'post',
				headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
				body: `cafe_no=${'${radios[i].value }'}&cafe_info=${'${updInfo.value }'}`
			})
				.then(result => result.json())
				.then(result => {
					alert(`${'${result.messege}'}`)
					location.reload();
				})
				.catch(error => console.log(error));
		}

	}

}
</script>

</html>