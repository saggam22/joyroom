<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>totalReviewList.jsp</title>
</head>
<body>
	<div id="container">
	
		<div class="admin_menu">
		<a href="${pageContext.servletContext.contextPath }/user.do">회원 리스트</a>
		<a href="${pageContext.servletContext.contextPath }/totalReviewList.do">리뷰 리스트</a>
		<a href="${pageContext.servletContext.contextPath }/adList.do">광고 리스트</a>
		</div>
		
		<table border="1">
			<thead>
				<tr>
					<th></th>
					<th>카페 번호</th>
					<th>리뷰 번호</th>
					<th>아이디</th>
					<th>작성 날짜</th>
					<th>좋아요 수</th>
					<th>평점</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${totalReviewList }" var="review">
					<tr id="${review.no }">
						<td><input type="checkbox" name="review_no" value="${review.no }"></td>
						<td>${review.cafeNo }</td>
						<td>${review.no }</td>
						<td>${review.userId }</td>
						<td>${review.date }</td>
						<td>${review.like }</td>
						<td>${review.star }</td>
						<td class="review_content">${review.content }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<button type="button" onclick="reviewDelete();">삭제</button>

		<jsp:include page="/view/admin/totalReviewPaging.jsp">
			<jsp:param value="${paging.pageNum}" name="pageNum" />
			<jsp:param value="${paging.startPage}" name="startPage" />
			<jsp:param value="${paging.endPage}" name="endPage" />
			<jsp:param value="${paging.prev}" name="prev" />
			<jsp:param value="${paging.next}" name="next" />
		</jsp:include>
	
	
	</div>
</body>
<script>

document.addEventListener('DOMContentLoaded', function() {
	
 	let contents = document.getElementsByClassName('review_content');
 	
 	for (let i=0; i<contents.length; i++) {
 		let text = contents[i].innerHTML;
 		if (text.length >= 20) {
 			contents[i].innerHTML = text.substr(0, 20);
 		}	// 20자 이상이면 자르기
 		let moreBtn = document.createElement('button');
 		moreBtn.innerHTML = '더보기';
 		moreBtn.setAttribute('class', 'more_btn')
 		moreBtn.setAttribute('name', 'cut_state');		// 더보기 전 상태
 		moreBtn.setAttribute('value', text);			// 자르기 전 텍스트 value에 넣어두기
 		contents[i].appendChild(moreBtn);				// 더보기 버튼 추가
 	
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
	 				this.innerHTML = '작게 보기';
	 			
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


//광고 삭제
function reviewDelete() {
	let result = confirm('정말로 삭제하시겠습니까?');
	let checkboxs = document.getElementsByName('review_no');
	if (result) {
		for (let i=0; i<checkboxs.length; i++) {
			
			if (checkboxs[i].checked) {
				console.log(checkboxs[i].value);
				fetch('reviewDelete.do', {
					method:'post',
					headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
					body: `review_no=${'${checkboxs[i].value }'}`
				})
					.then(result => result.json())
					.then(result => {
						location.reload();
					})
					.catch(error => console.log(error));
			}
		}
	}
}
	

</script>
</html>