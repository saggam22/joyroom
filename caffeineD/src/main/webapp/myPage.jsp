<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<a href="index.jsp">메인</a>
		<h1>My Page</h1>

		<table border="1" width="300" height="250">

			<div style="text-align: center;">
				<tr>
					<td>
						<center>
							<div>    
                            아이디 : ${user.id} <br>
									<br>                            	          
                            닉네임 : ${user.nickname }<br>
									<br>                            
                            연락처 : ${user.tel }<br>
									<br>                            
                            프로필 : ${user.img }<br>
									<br>
							</div>
						</center>
					</td>
				</tr>
			</div>			
		</table>
		<div style="margin-top: 10px;">
			<a href="infoModify"><input type="button" value="정보 수정"></a>
			<a href="myBoard"><input type="button" value="작성글 보기"></a> <a
				href="myComment"><input type="button" value="작성댓글 보기"></a>
	</center>

	</div>


	</div>
	<!-- <table border=1>
		<thead>			
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" readonly="readonly"
					value="${uVO.id }"></td>
			</tr>
			<tr>
				<td>암호</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="nickname"
					value="${uVO.nickname }"></td>
			</tr>						
			<tr>
				<td>프로필</td>
				<td><input type="image" name="img" 
					value="${uVO.img }"></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="tel" 
					value="${uVO.tel }"></td>
			</tr> -->

	<tbody>

	</tbody>
	</table>

</body>
</html>