<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jj9 - 구매내역</title>
<link rel="stylesheet" href="/jj9/resources/css/category.css?ver=1" />
<link rel="stylesheet" href="/jj9/resources/css/mypage-category.css">
<link rel="stylesheet" href="/jj9/resources/css/footer.css">
</head>
<body>
<%@ include file="../include/header.jsp" %>
	<div class="mypage">
		<div class="category__container">
			<ul class="cate-container__ul">
				<li><h2>구매재능내역</h2></li>
				<li><a href="/jj9/account/sell-talent">판매재능관리</a></li>
				<li style="background-color: rgb(230, 70, 70);"><a style="color: white;" href="/jj9/account/purchase-history">구매재능내역</a></li>
				<li><a href="/jj9/insert">재능등록하기</a></li>
				<li><a href="/jj9/insertRequest">재능의뢰등록</a></li>
				<li><a href="/jj9/account/note">쪽지관리</a></li>
				<li><a href="/jj9/account/add-coupon">쿠폰등록</a></li>
				<li><a href="/jj9/account/inquiry">1:1 문의</a></li>
				<li><a href="/jj9/account/member-modify">회원정보수정</a></li>
				<li><a href="/jj9/account/secession">회원탈퇴</a></li>
			</ul>
		</div>
		
		<div class="thispage__main">
			<div class="main__container">
				<h2 class="main-container__title">구매재능내역</h2>
				<div class="container__card">
					<c:choose>
						<c:when test="${payTalNull eq '1' }">
							<h2>구매한 재능이 없습니다.</h2>
						</c:when>
						<c:otherwise>
							<table border=1>
								<thead>
									<th>결제번호</th>
									<th>제목</th>
									<th>결제금액</th>
									<th>판매자</th>
									<th>환불</th>
								</thead>
								<tbody>
									<c:forEach items="${payTalNull }" var="payTal">
										<tr>
											<td>${payTal.pay_id }</td>
											<td><a href="buyInfo/${payTal.pay_id }">${payTal.talent_title }</a></td>
											<td><fmt:formatNumber value="${payTal.pay_money }" groupingUsed="true" /></td>
											<td>${payTal.seller_member_id }</td>
											<c:choose>
												<c:when test="${payTal.refund_request eq '구매확정' }">
													<td style="color : green">구매확정</td>
												</c:when>
												<c:otherwise>
													<td><button id="refundBtn" value="${payTal.pay_id }">환불하기</button> / <button id="confirmBtn" value=${payTal.pay_id }>구매확정</a></td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
					<hr>
					<c:choose>
						<c:when test="${payTalRequest eq '1' }">
						</c:when>
						<c:otherwise>
							<h2 class="main-container__title">환불요청 중인 상품</h2>
							<table border=1>
								<thead>
									<th>결제번호</th>
									<th>제목</th>
									<th>결제금액</th>
									<th>판매자</th>
									<th>환불</th>
								</thead>
								<tbody>
									<c:forEach items="${payTalRequest }" var="payTal">
										<tr>
											<td>${payTal.pay_id }</td>
											<td>${payTal.talent_title }</td>
											<td><fmt:formatNumber value="${payTal.pay_money }" groupingUsed="true" /></td>
											<td>${payTal.seller_member_id }</td>
											<td><button id="cancelBtn" value="${payTal.pay_id }">취소하기</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
					<hr>
					<c:choose>
						<c:when test="${payTalRefund eq '1' }">
						</c:when>
						<c:otherwise>
							<h2 class="main-container__title">환불이 완료 된 상품</h2>
							<table border=1>
								<thead>
									<th>결제번호</th>
									<th>제목</th>
									<th>결제금액</th>
									<th>판매자</th>
									<th>환불</th>
								</thead>
								<tbody>
									<c:forEach items="${payTalRefund }" var="payTal">
										<tr>
											<td>${payTal.pay_id }</td>
											<td>${payTal.talent_title }</td>
											<td><fmt:formatNumber value="${payTal.pay_money }" groupingUsed="true" /></td>
											<td>${payTal.seller_member_id }</td>
											<td>환불완료</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
	<script>
	if(document.getElementById('refundBtn')){
		const refundBtn = document.getElementById('refundBtn');
		
		refundBtn.addEventListener('click', (e) => {
			var result = confirm("환불신청 하시겠습니까?");
		        
		        if(result) {
		            location.href='refund/' + refundBtn.value;
		        }
		});
	}
	
	if(document.getElementById('confirmBtn')){
		const confirmBtn = document.getElementById('confirmBtn');
		
		confirmBtn.addEventListener('click', (e) => {
			var result = confirm("구매확정 하시겠습니까?");
			
		        if(result) {
		            location.href='fix/' + refundBtn.value;
		        }
		});
	}
	
	if(document.getElementById('cancelBtn')){
		const cancelBtn = document.getElementById('cancelBtn');
		
		cancelBtn.addEventListener('click', (e) => {
			var result = confirm("환불요청을 취소하시겠습니까?");
			
		        if(result) {
		            location.href='cancel/' + cancelBtn.value;
		        }
		});
	}
	
	</script>
</body>
</html>