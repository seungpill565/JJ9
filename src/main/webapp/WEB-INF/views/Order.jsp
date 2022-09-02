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
	<div>사용 가능한 쿠폰</div>
		<select id="select-cupon-name" name="name">
			<option value="null">사용가능한 쿠폰없음</option>
		
		<c:forEach items="${coupon }" var="cou">
			<option  value="${cou.coupon_id }">${cou.coupon_name }</option>
		</c:forEach>
		
	 </select>
	 할인 <input id="input-cupon-value" type = "text" placeholder="선택하신 쿠폰이 없습니다." readonly style="border: none;"> <br>
	
	<h3>결제방법</h3>
	<label><input type="radio" name="order" value="toss">toss</label> 
	<label><input type="radio" name="order" value="payco">payco</label>
	<label><input type="radio" name="order" value="무통장입금">무통장입금</label>
</c:forEach>
<script type="text/javascript" src="/jj9/resources/js/Orderjs.js"></script>
</body>
</html>