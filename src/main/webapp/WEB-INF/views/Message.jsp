<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>1:1 쪽지 전송하기</h1>
	
 	<form action="info" method="POST">
	 	<div>제목</div>
	 	 <input type="text" name="message_name" value="" >
	 	 <div>받는 사람</div>
	 	 <input type="text" name="sender_id" value="${id.member_id }"readonly="readonly">
	 	 <div>내용</div>
	 	 <textarea rows="5" cols="40" name="message_content"></textarea>
	 	 <input id="message-button" type="submit" value="전송">
 	</form>
	
	
	

</body>
</html>