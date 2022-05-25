<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adReviewInsert.jsp</title>
<link href="${pageContext.servletContext.contextPath }/css/table.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath }/css/adminTable.css"
	rel="stylesheet">
<style>
#ad {
	background: #d9bba9;
	color: #323232;
	font-weight: 600;
}

#table {
	width: 100%;
	text-align: left;
	font-size: 14px;
	margin:20px;
	
}

#table tbody td {
	padding: 10px;
	background: #f6f6f6;
	background: white;
}
.table-wrap {
	background: white;
}
.table_left {
	width: 1%;
}
.table_right {
	width: 50%;
}

select {
	height: 25px;
}

textarea {
	border: solid 0.2px rgb(90, 90, 90);
	width: 100%;
	height: 150px;
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
							
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>







</body>
</html>