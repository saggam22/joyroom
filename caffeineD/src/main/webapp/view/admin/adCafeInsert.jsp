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
		}
	</style>
</head>
<style>

	#table {
		width: 800px;
		margin: 0 auto;
		text-align: left;
		font-size: 14px;
		margin-top: 20px;
	}

	#table tbody td {
		padding: 10px;
		background: #f6f6f6;
		
	}

	.table_left {
		width: 50px;
	}
	
	
	textarea {
			border: solid 0.2px rgb(90, 90, 90);
			width: 100%;
			height: 200px;
	}

</style>
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
				<div class="row">
					<div class="col-md-12">

						<div class="table-wrap" style="overflow-x: hidden">
							<form
								action="${pageContext.servletContext.contextPath }/adCafeInsert.do"
								method="get">
								<table id="table">
									<tbody class="text_left">
										<tr>
											<td class="table_left">선택</td>
											<td><select name="cafe_no">
													<c:forEach items="${cafeList }" var="cafe">
														<option value="${cafe.no }">${cafe.name }</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<td class="table_left">내용</td>
											<td><textarea name="cafe_info"></textarea></td>
										<tr>
											<td></td>
											<td class="text_right"><button class="mini_button button_no_back" type="submit">등록</button></td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>







</body>
</html>