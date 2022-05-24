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
textarea {
	border: solid 0.2px rgb(90, 90, 90);
	width: 100%;
	height: 80px;
}
#ad {
			background: #d9bba9;
			color: #323232;
		}
</style>
</head>
<body>

	<div id="container">


		<section class="ftco-section">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-6 text-center mb-5">
						<div class="heading-section"><jsp:include
								page="/view/admin/adminMenu.jsp"></jsp:include></div>
					</div>
				</div>
				<button class="button_no_back mini_button" type="button"
					onclick="location.href='${pageContext.servletContext.contextPath }/adCafeInsertView.do'"
					style="margin-bottom: 10px;">광고 등록</button>

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

					</div>
				</div>
			</div>
		</section>
	</div>
</body>
<script> 

document.addEventListener('DOMContentLoaded', function() {
	
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
	 			
	 			// 더보기 전 상태에서 버튼 클릭
	 			if (this.name === 'cut_state') {
	 				this.name = 'more_state';	
	 				this.innerHTML = '닫기';
	 			
	 			// 더보기 후 상태에서 버튼 클릭
	 			} else if (this.name === 'more_state') {
	 				this.name = 'cut_state';
	 				this.innerHTML = '더보기';
	 			}
	 			
 				this.value = oldText.nodeValue;	
 				td.replaceChild(newText, oldText);
	 				
	 		});
	 	}

})

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



// 수정 textarea
function adCafeUpdateView() {

	console.log('update view');
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
	console.log('update');

	let radios = document.getElementsByName('cafe_no');
	for (let i=0; i<radios.length; i++) {
		if (radios[i].checked) {
			console.log(radios[i].value); // 카페 넘버
			let updInfo = document.getElementsByTagName('textarea')[0];
			console.log(updInfo.value); // 카페 인포
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