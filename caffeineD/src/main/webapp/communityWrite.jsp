<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>글 작성화면</h4>
	<div id="write_area">
		<form action="community.jsp" method="post">
			<div id="in_title">			
				<textarea name="title" id="utitle" rows="1" cols="50"
					placeholder="제목" required></textarea>
			</div>
			
			<div class="wi_line"></div>			
			<div id="in_content">
				<textarea name="content" id="ucontent" rows="20" cols="50"
					placeholder="내용" required></textarea>
			</div>
			
			<input type="file" name="SelectFile" />
			
			<div class="bt_se">
				<button type="submit">글 작성</button>
				
			</div>
		</form>
		<a href="community.jsp"><button type="submit">돌아가기</button></a>
	</div>
	</div>
</body>
</body>
</html>