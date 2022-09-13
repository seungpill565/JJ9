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



	<h1>결제완료</h1>
	
	<h3>결제내역</h3>
	<div>주문하신 분 :${id }</div>
	<div>결제금액 : ${money } 원</div>
	<div>결제방식 :${way }</div>

</body>
</html>