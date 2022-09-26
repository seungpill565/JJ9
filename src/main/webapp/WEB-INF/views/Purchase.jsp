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
<link rel="stylesheet" href="/jj9/resources/css/Purchasecss.css">
<link rel="stylesheet" href="/jj9/resources/css/posi_footer.css">
</head>
<body>
<%@ include file="include/header.jsp" %>
<div class="total">
<div class="total2">
<c:forEach items="${purchase }" var="purchase">

	<div id="main_img">
		<div id="cate">${purchase.cate_main } > ${purchase.cate_sub }</div>
		
		<div id="img">
			<img id="purchase_img" alt="" src="/tomcatImg/${purchase.talent_image }">
		</div>
		<br>
		<div id="avg">
			<img id="avg-img" alt="" src="">
			<div id="avg-grid">
				  평점:<div id="avg-num">${RradeAvg }</div>
				<div>(${CountGrade }개의평가)</div>
			</div>
		</div>
	</div>

	

	<div id="explanation">
		<div id="alink">
			<button id="a-button"><a  href="#exp">서비스 설명</a></button> 
			<button id="a-button"><a  href="#curriculum">서비스 커리큘럼</a></button> 
			<button id="a-button"><a  href="#refund">취소 및 환불</a></button> 
			<button id="a-button"><a  href="#reivew">서비스 평점</a></button> 
		</div>
		
		<div id="main-content">
		<br>
		<br>
		<br>
			<h3 id="exp">서비스 설명</h3>
                <div style="white-space:pre-wrap;">${purchase.talent_service_exp }</div>

            <h3 id="curriculum">서비스 커리큘럼</h3>
                <div style="white-space:pre-wrap;">${purchase.talent_curriculum }</div>	
			
			<div id="refund">
				<h3>취소 및 환불 규정</h3>
				
				<div>
					가. 기본 환불 규정<br>
					1. 전문가와 의뢰인의 상호 협의하에 청약 철회 및 환불이 가능합니다.<br>
					2. 섭외, 대여 등 사전 준비 도중 청약 철회 시, 해당 비용을 공제한 금액을 환불 가능합니다.<br>
					3. 촬영 또는 편집 작업 착수 이후 청약 철회 시, 진행된 작업량 또는 작업 일수를 산정한 금액을 공제한 금액을 환불 가능합니다.<br>
					<br>
					[환불 가이드라인]<br>
					(1) 기획 단계에서 청약 철회: 총 결제 금액의 최대 80%까지 환불 가능<br>
					(2) 작업 착수 후 청약 철회: 총 결제 금액의 최대 20%까지 환불 가능<br>
					(3) 작업 50% 완료 후 청약 철회: 총 결제 금액의 최대 10%까지 환불 가능<br>
					(4) 작업 100% 완료 후 청약 철회 : 환불 불가<br>
					<br>
					나. 전문가 책임 사유<br>
					1. 소비자 피해 보상 규정에 의거하여 촬영 원본의 멸실 및 재해로 인한 피해 발생 시, 전액 환불합니다.<br>
					2. 작업 기간 미준수, 작업 태만 및 이에 상응하는 전문가 책임으로 인한 청약 철회 시, 환불 및 촬영 원본 제공이 가능합니다.<br>
					<br>
					의뢰인 책임 사유<br>
					작업이 시작되면 단순 변심 또는 의뢰인 책임 사유로 인한 전액 환불이 불가능합니다.<br>
				</div>
			</div>
		
			<hr>
		
			<div id="reivew">
				<h3>서비스 평가</h3>
				
				<div>실제 jj9을 통해 구매한 이용자들이 남긴 평가입니다.</div>
				<hr>
				<br>
				<c:forEach items="${Reivew }" var="reivew">	
				<div>아이디 : ${reivew.member_id }</div>
					<div id="star${reivew.review_grade }">
						<img id="review-star" alt="" src="/jj9/resources/images/star/star${reivew.review_grade }.PNG">
				<div>리뷰 : ${reivew.review_content }</div>
				<div>${reivew.review_date } 작성</div></div>
				<br>
				<br>
				<hr>
				</c:forEach>
			</div>
		</div>
	</div>
	
	
	<div id="title" style="max-width: 400px">
		<h3 id="title-name">${purchase.talent_title }</h3>
		<div id="description">정보</div>
		<div id="description">${purchase.talent_summary }</div>
		<br>
		<div id="description">가격 : <fmt:formatNumber value="${purchase.talent_price }" groupingUsed="true" />원</div>
		<div id="description">작업일수 : ${purchase.talent_workday }일</div>
		<form action="<c:url value="/order/${purchase.talent_id }"/>" method="GET">
			<input id="order-button" type="submit" value="구매하기">
			<br>
		</form>
	</div>
	<img id="pay-content" alt="" src="/jj9/resources/images/payContent.jpg">
	
	<div id ="seller-info" style="max-width: 400px">
		<h3 id="title-name">판매자 정보</h3>
		<div id="description">닉네임 : ${purchase.member_nickName }</div>
		<div id="description">아이디 : ${purchase.member_id }</div>
		<button id="window-button"  >1:1 문의하기</button>
			<div id="pop-url" style="display: none;"><c:url value="/message/${purchase.talent_id}"/></div>
		<h3>소개</h3>
		<div id="description">${purchase. member_comments }</div>
		<br>
	</div>
	

</c:forEach>
</div>
<script type="text/javascript" src="/jj9/resources/js/Purchasejs.js"></script>
</div>


</body>
</html>