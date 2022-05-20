<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div style="width:90%;">
		<h4>글을 작성하는 공간입니다.</h4>	
		<form action="boardWrite.do" method="post" enctype="Multipart/form-data">
			<textarea name="title"placeholder="제목"  rows="1" cols="150"  required></textarea><br>
			<textarea name="content" rows="15" cols="150" placeholder="내용" required></textarea><br>
			<div style ="margin-top:10px">
			<input type="file" name="img" value=img><br>
			<input type="hidden" name="user_id" value=user_id>
			</div>	
			<div style ="margin-top:15px;margin-left:900px;">
        	<input type="submit" value="등록">  
        	<button onclick="location.href='board.do'" type="button">돌아가기</button>    
        	</div>  	
    	</form>
    	
	</div>
</body>
</html>