<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <link rel="stylesheet" href="/jj9/resources/css/OrderComplecss.css">
<body>


	<div id="complete-all">
		<center id="order">결제가 완료되었습니다</center>
		
		<center id="logo">jj9</center>
		<div id="coment-comment">
			<h2>저희 jj9을 이용해 주셔서 감사합니다</h2>
			<h2>주문 정보는 마이페이지에서 조회 가능합니다</h2>
		
			
			<h3>결제내역</h3>
			<div>주문하신 분 :${id }</div>
			<div>결제금액 : ${money } 원</div>
			<div>구매하신 재능 :${talentTitle }</div>
			<button id="a-button"><a  href="../mypage">마이페이지</a></button>
		</div>
	</div>

</body>
</html>