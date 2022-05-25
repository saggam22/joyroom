<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
  	<title>adminCafeList.jsp</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="css/table.css">
	<link rel="stylesheet" href="css/adminCafe.css">
</head>
<body>
<div id="container">
		<jsp:include page="/view/admin/adminMenu.jsp"></jsp:include>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">ADMIN CAFES</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap" style="overflow-x: hidden">
						<c:choose>
						<c:when test="${empty list }"><h6 style="text-align:center;">관리할 카페가 없습니다.</h6></c:when>
						<c:otherwise>
						<table class="table">
						  <thead class="thead-primary">
						    <tr>
						      <th></th>
						      <th>상호명</th>
						      <th></th>
						      <th>주소</th>
							  	<th>전화번호</th>
						    </tr>
						  </thead>
						  <tbody>
							<c:forEach items="${list }" var="cafe">
						    <tr>
									<td><input type="radio" name="cafeNo" value="${cafe.no }"></td>
						      <td><a href="${pageContext.servletContext.contextPath }/cafeInfoSelect.do?no=${cafe.no}">${cafe.name }</a></td>
						      <td><img width="50px" alt="" src="${pageContext.servletContext.contextPath }/img/cafeimg/${cafe.img }"></td>
						      <td>${cafe.address }</td>
						      <td>${cafe.tel }</td>
						    </tr>
						   </c:forEach>
						  </tbody>
						</table>
					<form name="findF" action="cafeSearchList.do" class="form-inline">
						<input type="hidden" name="path" value="admin">
						<input type="text" name="findKeyword" placeholder="검색어를 입력하세요" 
						class="form-control mr-2">
						<button class="btn btn-success">검 색</button>
					</form>
					<button id="cafe_update_btn" type="button" onclick="openPop();">수정</button>
					</c:otherwise>
					</c:choose>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="popup_layer" id="popup_layer" style="display: none;">
  <div class="popup_box">
      <div style="height: 10px; width: 375px; float: top;">
        <a href="javascript:closePop();"><img src="${pageContext.servletContext.contextPath }/img/ic_close.svg" class="m_header-banner-close" width="30px" height="30px"></a>
      </div>
      <!--팝업 컨텐츠 영역-->
      <div class="popup_cont">
          <h5> </h5>
         <div id="cafeImg"><img id="saveImg"></div>
      </div>
      <!--팝업 버튼 영역-->
      <div class="popup_btn" style="float: bottom; margin-top: 200px;">
          <a href="javascript:closePop();">닫기</a>
      </div>
  </div>
	</div>
</div>
	<script>
	//팝업 열기
	function openPop() {
	    document.getElementById("popup_layer").style.display = "block";
	    selecCafePop();
	}
	//팝업 닫기
	function closePop() {
	    document.getElementById("popup_layer").style.display = "none";
	}
	//팝업창에 내용 전달
	function selecCafePop() {
		let cafeSelect = document.getElementsByName('cafeNo');
		for (let i=0; i<cafeSelect.length; i++) {
			if (cafeSelect[i].checked) {
				console.log(cafeSelect[i].value)
		    fetch('${pageContext.servletContext.contextPath }/cafeInfoSelect.do', {
		    	method: 'post',
		    	headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
		    	body: 'no='+cafeSelect[i].value
		    })
		    	.then(result => result.json())
		    	.then(review => {
		    			if (review.img != null) {
		    			
		    			var cafeImgDiv = document.querySelector('#cafeImg');	// 이미지가 보여지는 섹션 div	
		    			var saveImg = document.querySelector('#saveImg');
        
		    			firstImg.setAttribute('id', 'saveImg');
		    			firstImg.setAttribute('src', `${pageContext.servletContext.contextPath }/img/cafeimg/${cafe.img }`);
		    			}
		    	})
		    	.catch(error => console.log(error));	
			}
		}
	}

	</script>
	<div id="page">
<jsp:include page="/view/admin/adminCafePaging.jsp">
    <jsp:param value="${paging.pageNum}" name="pageNum"/>
    <jsp:param value="${paging.startPage}" name="startPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
</jsp:include>	
	</div>
</body>
</html>
</html>