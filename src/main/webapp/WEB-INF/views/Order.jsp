<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/jj9/resources/css/posi_header.css" />
<link rel="stylesheet" href="/jj9/resources/css/Ordercss.css">
<link rel="stylesheet" href="/jj9/resources/css/posi_footer.css">
</head>
<body>
<%@ include file="include/header.jsp" %>

<c:forEach items="${order }" var="order">
	
	
	<div id="order-details">
		<h1>결제하기</h3>
		
		<h3>주문내역</h5>
		
		<img id="purchase_img"src="/tomcatImg/${order.talent_image }"/>
		<br>
		<br>
		
		<div id="title-nickName-id">
			<h3>재능 이름 : ${order.talent_title }</h3>
			<hr>
			<div>판매자 닉네임: ${order.member_nickName }</div>
			<div>판매자 아이디: ${order.member_id }</div>
			<hr>
		</div>
		<table border="1">
			<thead  >
				<th id="nomal">기본항목</th>
				<th id="select">수량선택</th>
				<th id="day">작업일</th>
				<th id="th-price">가격</th>
			</thead>
			<tbody>
			<td><div>${order.talent_summary }</div></td>
			<td>
				<div id="select-grid">
					<input id="minus-button" type='button'onclick='count("minus")' value='-' disabled/>
					<div id='result'>1</div>
					<input id = "plus-button" type='button' onclick='count("plus")'value='+'/>
				</div>
			</td>
			<td>${order.talent_workday }일</td>
			<td><div id="price"><fmt:formatNumber value="${order.talent_price }" groupingUsed="true" /></div></td>
			
			</tbody>
		</table>
		
		
		
		<div id="price2" style="display: none;">${order.talent_price }</div>
	</div>
	
	
	<div id="coupon-order-all">
			<h3>할인</h3>
			<form action="<c:url value="/order/completed"/>" method="POST">
				<div>사용 가능한 쿠폰</div>
				<select id="select-cupon-name" name="name" style="font-size:18px;">
					<option value="0">쿠폰 목록</option>
				
				<c:forEach items="${coupon }" var="cou">
					<option  value="${cou.coupon_id }">${cou.coupon_name }</option>
				</c:forEach>
			
		 </select>
		 <hr>
		 
		
		<h3>결제 </h3>
			
				<div>총서비스 금액 <input id="total-service" name="original-money" value = "<fmt:formatNumber value="${order.talent_price }" groupingUsed="true" />" type="text" readonly style="border: none;font-size:20px; text-align: right">원</div> 
				<div >쿠폰 할인<input id="input-cupon-value" type = "text" placeholder="선택하신 쿠폰이 없습니다." readonly style="border: none;font-size:20px;"></div>
				<div id="dis-pay" style="font-size:25px;">0원</div>
			
			<hr>
			<div>
				총결제 금액 <input id="total-pay" name="money" value="<fmt:formatNumber value="${order.talent_price }" groupingUsed="true" />" type="text" readonly style="border: none; font-size:20px; text-align: right">원
			</div>
			<br>
			<input id="order-button" type="submit" value="결제하기">
		</form>
		<br>
	</div>
</c:forEach>
<div class="footer__position--order">
	<%@ include file="include/footer.jsp" %>
</div>

<script type="text/javascript" src="/jj9/resources/js/Orderjs.js"></script>
</body>
</html>