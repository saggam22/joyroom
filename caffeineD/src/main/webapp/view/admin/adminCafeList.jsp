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
	<style>
		.ftco-section {
			padding: 80px 0;
		}
		#cafe {
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
			<div class="heading-section"><jsp:include page="/view/admin/adminMenu.jsp"></jsp:include></div>
			<c:if test="${!empty success }">
				<script>alert("${success }")</script>
				<% request.getSession().removeAttribute("success"); %>
			</c:if>
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap" style="overflow-x: hidden">
						<c:choose>
						<c:when test="${empty list }"><h6 style="text-align:center;">관리할 카페가 없습니다.</h6></c:when>
						<c:otherwise>
						<table class="table">
						  <thead class="thead-primary">
						    <tr>
						      <th>cafeNO</th>
						      <th>상호명</th>
						      <th></th>
						      <th>주소</th>
							  	<th>전화번호</th>
						    </tr>
						  </thead>
						  <tbody>
							<c:forEach items="${list }" var="cafe">
						    <tr>
									<td>${cafe.no }</td>
						      <td><a href="${pageContext.servletContext.contextPath }/cafeInfoSelect.do?no=${cafe.no}">${cafe.name }</a></td>
						      <td><a href="javascript:openPop(`${cafe.img}`, `${cafe.no}`);"><img width="50px" height="38px" alt="" src="<c:url value='/img/cafeimg/${cafe.img }'/>">&nbsp;&nbsp;&nbsp;수정</a></td>
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
      <div class="popup_cont">
          <h5>사진 변경</h5>
         <div id="cafeImg"><img id="saveImg" width="250px" height="187.5px"></div>
      </div>
      <div id="cafeImg_input">
         <form action="${pageContext.servletContext.contextPath }/cafeInfoUpdate.do" method="post" enctype="multipart/form-data">
         	<input type="file" name="newImg" id="newImg" onchange="preUrl(this)">
         	<input type="hidden" name="cafeNo" value="" />
         	<input id="update_btn" type="submit" value="수정" />
         </form>
       </div>
      <div class="popup_btn" style="float: bottom;">
          <a href="javascript:closePop();">닫기</a>
      </div>
  </div>
	</div>
</div>
	<script>	
	//팝업 열기
	function openPop(img, no) {
	    document.getElementById("popup_layer").style.display = "block";
	    document.getElementById("saveImg").src = "${pageContext.servletContext.contextPath }/img/cafeimg/"+img;
	    var cafeNo = document.getElementsByName("cafeNo");
	    cafeNo[0].value = no;
	}
	//팝업 닫기
	function closePop() {
	    document.getElementById("popup_layer").style.display = "none";
	}
	
	//변경된 이미지 미리보기
	function preUrl(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('saveImg').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('saveImg').src = "";
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