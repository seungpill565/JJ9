<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/jj9/resources/css/Purchasecss.css">
</head>
<body>
<c:forEach items="${Purchase }" var="purchase">
	 
	<div id="main_img">
		<div id="cate">${purchase.cate_main } > ${purchase.cate_sub }</div>
		
		<div id="img">
			<img id="purchase_img" alt="" src="/jj9/resources/images/${purchase.talent_image }">
		</div>
		<br>
		<div id="gradeAvg">평균 평점:${RradeAvg } (${CountGrade }개의평가)</div>
	</div>

	
	

	
	

	<div id="explanation">
		<div id="alink">
			<a href="#exp">서비스 설명</a>
			<a href="#curriculum">서비스 커리큘럼</a>
			<a href="#reivew">평점</a>
		</div>
		
		<div>${purchase.member_id }</div>
		<h3 id="exp">서비스 설명</h3>
		<div>${purchase.talent_service_exp }</div>
		
		<h3 id="curriculum">서비스 커리큘럼</h3>
		<div>${purchase.talent_curriculum }</div>	
		
		<div id="Refund">
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
			<c:forEach items="${Reivew }" var="reivew">	
			<div>아이디 : ${reivew.member_id }</div>
			<div>평점 : ${reivew.review_grade } | 기록된날짜 : ${reivew.review_date }</div>
			<div>리뷰 : ${reivew.review_content }</div>
			</c:forEach>
		</div>
	</div>
	
	
	<div id="title">
		<div id="title-name">${purchase.talent_title }</div>
		<br>
		<div>${purchase.talent_price }원</div>
		<form action="<c:url value="/order/${purchase.talent_id }"/>" method="get">
			<input id="order-button" type="submit" value="구매하기">
		</form>
	</div>
	

</c:forEach>


</body>
</html>