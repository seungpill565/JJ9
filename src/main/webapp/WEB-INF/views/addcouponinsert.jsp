<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/jj9/resources/css/Messagecss.css">
</head>
<body>
	
	<h1 id="logo">jj9</h1>
	
	<hr style="background-color: #E84646;">
	
 	<form action="../coupon/insert" method="POST">
	 	<div>쿠폰을 입력 해주세요</div>
	 	 <input type="text" name="coupon_value" value="" >
	 	 <input id="message-button2" type="submit" value="쿠폰입력" style="background-color: #E84646;">
 	</form>
	
	 
	
	

</body>
</html>