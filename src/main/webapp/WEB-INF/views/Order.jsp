<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${order }" var="order">

	<div>구매페이지</div>
	
	<h3>결제하기</h3>
	
	<h5>주문내역</h5>
	<div>
		<div>
			<img id="purchase_img" alt="" src="/jj9/resources/images/${order.talent_image }">
		</div>
		<div>${order.talent_title }</div>
		<div>${order.member_nickName }</div>
		
		<input type='button' onclick='count("plus")'value='+'/>
		<input id="minus-button" type='button'onclick='count("minus")' value='-' disabled/>
		<div id='result'>1</div>
		<div id="price">${order.talent_price }</div>
		<div id="price2" style="display: none;">${order.talent_price }</div>
	</div>
	
	
	
	<h3>할인</h3>
	<form action="<c:url value="/order/completed"/>" method="POST">
	<div>사용 가능한 쿠폰</div>
		<select id="select-cupon-name" name="name">
			<option value="0">쿠폰 목록</option>
		
		<c:forEach items="${coupon }" var="cou">
			<option  value="${cou.coupon_id }">${cou.coupon_name }</option>
		</c:forEach>
		
		
	 </select>
	 
	
	
	<h3>결제 </h3>
		<div id="">
			<div>총서비스 금액 <input id="total-service" name="original-money" value = "${order.talent_price }" type="text" readonly style="border: none; text-align: right">원</div> 
			<div >쿠폰 할인 할인 <input id="input-cupon-value" type = "text" placeholder="선택하신 쿠폰이 없습니다." readonly style="border: none;"> <br></div>
			<div id="dis-pay">0원</div>
		</div>
		<hr>
		<div>
			총결제 금액 <input id="total-pay" name="money" value="${order.talent_price }" type="text" readonly style="border: none; text-align: right">원
		</div>
		<input id="order-button" type="submit" value="결제하기">
	</form>
	
</c:forEach>
<script type="text/javascript" src="/jj9/resources/js/Orderjs.js"></script>
</body>
</html>