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
</head>
<body>

	<div id="container">
		<jsp:include page="/view/admin/adminMenu.jsp"></jsp:include>
		
		<section class="ftco-section">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-6 text-center mb-5">
						<h2 class="heading-section">광고 리스트</h2>
					</div>
				</div>
				<button type="button"
					onclick="location.href='${pageContext.servletContext.contextPath }/adCafeInsertView.do'">등록</button>

				<div class="row">
					<div class="col-md-12">

						<div class="table-wrap" style="overflow-x: hidden">
							<table class="table">
								<thead class="thead-primary">
									<tr>
										<th></th>
										<th>카페 번호</th>
										<th>카페 이름</th>
										<th>카페 설명</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${adCafeList }" var="ad_cafe">
										<tr>
											<td><input type="radio" name="cafe_no"
												value="${ad_cafe.no }"></td>
											<td>${ad_cafe.no }</td>
											<td>${ad_cafe.name }</td>
											<td id="info_${ad_cafe.no }" class="cafe_info">
												${ad_cafe.info }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<button type="button" name="update_view_btn"
							onclick="adCafeUpdateView();">수정</button>
						<button type="button" onclick="adCafeDelete();">삭제</button>

					</div>
				</div>
			</div>
	</section>
	</div>
</body>
<script> 

document.addEventListener('DOMContentLoaded', function() {
	
 	let contents = document.getElementsByClassName('cafe_info');
 	
 	for (let i=0; i<contents.length; i++) {
 		let text = contents[i].innerHTML;
 		if (text.length >= 30) {
 			contents[i].innerHTML = text.substr(0, 30);
	 		let moreBtn = document.createElement('button');
	 		moreBtn.innerHTML = '더보기';
	 		moreBtn.setAttribute('class', 'more_btn')
	 		moreBtn.setAttribute('name', 'cut_state');		
	 		moreBtn.setAttribute('value', text);			
	 		contents[i].appendChild(moreBtn);				
 		}	// 30자 이상이면 자르기
 	
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
	 				this.innerHTML = '작게 보기';
	 			
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

// 광고 삭제
function adCafeDelete() {
	let result = confirm('정말로 삭제하시겠습니까?');
	let radios = document.getElementsByName('cafe_no');
	if (result) {
		for (let i=0; i<radios.length; i++) {
			
			if (radios[i].checked) {
				console.log(radios[i].value);
				fetch('adCafeDelete.do', {
					method:'post',
					headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
					body: `cafe_no=${'${radios[i].value }'}`
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
}



// 수정 textarea
function adCafeUpdateView() {

	console.log('update view');
	let radios = document.getElementsByName('cafe_no');
	let moreBtns = document.getElementsByClassName('more_btn');
	for (let i=0; i<radios.length; i++) {
		if (radios[i].checked) {
			console.log(radios[i].value);
			
			let cafeInfo = document.getElementById(`info_${'${radios[i].value }'}`);
			let textarea = document.createElement('textarea');
			let text = '';
			
			if (moreBtns[i].name === 'cut_state') {
				text = moreBtns[i].value;
				moreBtns[i].remove();
				
			} else if (moreBtns[i].name === 'more_state') {
				moreBtns[i].remove();
				text = cafeInfo.innerHTML;
			}
			textarea.value = text;
			cafeInfo.innerText = '';
			cafeInfo.appendChild(textarea);
			
			let updateBtn = document.createElement('button');
			updateBtn.setAttribute('type', 'button');
			updateBtn.setAttribute('name', 'update_btn');
			updateBtn.innerText = '저장';
			updateBtn.setAttribute('onclick', 'adCafeUpdate();')
			cafeInfo.appendChild(updateBtn);
			
			let cancelBtn = document.createElement('button');
			cancelBtn.setAttribute('type', 'button');
			cancelBtn.setAttribute('name', 'cancel_btn');
			cancelBtn.innerText = '취소';
			cancelBtn.setAttribute('onclick', 'location.reload();')
			cafeInfo.appendChild(cancelBtn);
					
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