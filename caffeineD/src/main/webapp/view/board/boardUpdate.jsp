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
	
		<h4>글을 수정하는 공간입니다.</h4>	
		<form action="${pageContext.servletContext.contextPath }/boardUpdate.do" method="post">
			<textarea name="title"placeholder="제목"  rows="1" cols="150"  required>${board.title} </textarea><br>
			<textarea name="content" rows="15" cols="150" placeholder="내용" required>${board.content}</textarea><br>
			<div style ="margin-top:10px">
				<input type="file" name="img" value=img><br>				
				<input type="hidden" name="board_no" value="${board.no}">
			</div>	
			<div style ="margin-top:15px;margin-left:900px;">
        		<input type="submit" value="수정">  
        		<a href = "${pageContext.servletContext.contextPath }/board.do"><button type="button">돌아가기</button></a>    
        	</div>  	
    	</form>  
	
</body>
</html>