<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>totalReviewList.jsp</title>
<link href="${pageContext.servletContext.contextPath }/css/table.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath }/css/adminTable.css"
	rel="stylesheet">
<style>
#review {
	background: #d9bba9;
	color: #2F170F;
	font-weight: 600;
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
										<th>카페</th>
										<th>리뷰</th>
										<th>아이디</th>
										<th>작성 날짜</th>
										<th>좋아요</th>
										<th>평점</th>
										<th class="content text_left">내용</th>
									</tr>
								</thead>
								<tbody class="text_center">

									<c:forEach items="${totalReviewList }" var="review">
										<tr id="${review.no }">
											<td class="checkbox"><input type="checkbox"
												name="review_no" value="${review.no }"></td>
											<td class="width_short">${review.cafeNo }</td>
											<td class="width_short">${review.no }</td>
											<td class="width_longlong">${review.userId }</td>
											<td class="width_long">${review.date }</td>
											<td class="width_short">${review.like }</td>
											<td class="width_mideum star"><c:if
													test="${review.star eq '5' }">★★★★★</c:if> <c:if
													test="${review.star eq '4' }">★★★★☆</c:if> <c:if
													test="${review.star eq '3' }">★★★☆☆</c:if> <c:if
													test="${review.star eq '2' }">★★☆☆☆</c:if> <c:if
													test="${review.star eq '1' }">★☆☆☆☆</c:if></td>
											<td class="content text_left">${review.content }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div id="bottom_section">
							<jsp:include page="/view/admin/totalReviewPaging.jsp">
								<jsp:param value="${paging.pageNum}" name="pageNum" />
								<jsp:param value="${paging.startPage}" name="startPage" />
								<jsp:param value="${paging.endPage}" name="endPage" />
								<jsp:param value="${paging.prev}" name="prev" />
								<jsp:param value="${paging.next}" name="next" />
							</jsp:include>
							<button class="button_no_back mini_button text_right right_btn"
								type="button" onclick="checkChecked();" style="margin:0; padding:0;">리뷰 삭제</button>
						</div>
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
 		let text = contents[i].innerHTML;
 		if (text.length >= 37) { // 글자 자르기
 			contents[i].innerHTML = text.substr(0, 37);
	 		let moreBtn = document.createElement('button');
	 		moreBtn.innerHTML = '더보기';
	 		moreBtn.setAttribute('class', 'more_btn mini_button button_no_back');
	 		moreBtn.setAttribute('style', 'display: block;');
	 		moreBtn.setAttribute('name', 'cut_state');		// 더보기 전 상태
	 		moreBtn.setAttribute('value', text);			// 자르기 전 텍스트 value에 넣어두기
	 		contents[i].appendChild(moreBtn);				// 더보기 버튼 추가
 		}	
 	
 	}
 	
	 	// 내용 더보기
	 	let moreBtns = document.getElementsByClassName('more_btn');

	 	for (let i=0; i<moreBtns.length; i++) {
	 		moreBtns[i].addEventListener('click', function() {
	 			
	 			let td = this.parentNode;
	 			let oldText = td.firstChild;									// 현재 텍스트 노드 추출
	 			let newText = document.createTextNode(moreBtns[i].value);		// 새로운 텍스트 노드 생성
	 			
	 			// 더보기 전 상태에서 버튼 클릭
	 			if (this.name === 'cut_state') {
	 				this.name = 'more_state';	
	 				this.innerHTML = '닫기';
	 			
	 			// 더보기 후 상태에서 버튼 클릭
	 			} else if (this.name === 'more_state') {
	 				this.name = 'cut_state';
	 				this.innerHTML = '더보기';
	 			}
	 			
 				this.value = oldText.nodeValue;									// 현재 텍스트 노드에서 텍스트 추출하여 값에 저장
 				td.replaceChild(newText, oldText);								// 텍스트 노드 교체
	 				
	 		});
	 	}

})

// 선택 체크
function checkChecked() {
	
	let checkboxs = document.getElementsByName('review_no');
	let checkedArr = []
	for (let i=0; i<checkboxs.length; i++) {
		if (checkboxs[i].checked) {
			checkedArr.push(checkboxs[i].value);
		}
	}
	
	if (checkedArr.length === 0) {
		alert('선택된 리뷰가 없습니다.');
	} else {
		console.log(checkedArr);
		reviewDelete(checkedArr);
	}
	
}

//광고 삭제
function reviewDelete(ary) {
	let result = confirm('정말로 삭제하시겠습니까?');

	if (result) {
		for (let i=0; i<ary.length; i++) {
			
				fetch('reviewDelete.do', {
					method:'post',
					headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
					body: `review_no=${'${ary[i] }'}`
				})
					.then(result => result.json())
					.then(result => {
						alert('삭제가 완료되었습니다.');
						location.reload();
					})
					.catch(error => console.log(error));
			}
			
		}
	} 

	

</script>
</html>