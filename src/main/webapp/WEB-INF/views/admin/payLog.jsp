<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 기록 조회</title>
</head>
<body>
<h3>결제 기록 조회 페이지입니다.</h3>
관리자 ${currUser.member_id } 님 안녕하세요 <br />
보유 포인트는 ${currUser.member_point } 점 입니다<br />

<hr />
	<a href=" <c:url value="/admin"/>">관리자 메인 페이지</a> <br />
	<a href=" <c:url value="/categoryManage"/>">카테고리 관리</a> <br />
	<a href="<c:url value="/memberManage"/>">회원 관리</a> <br />
	<a href="<c:url value="/talentPermission"/>">재능등록 요청 관리</a><br />
	<a href="<c:url value="/talentManage"/>">재능 관리</a><br />
	<a href="<c:url value="/payLog"/>">결제 기록 조회</a><br />
	<a href="<c:url value="/refundManage"/>">환불 요청 관리</a><br />

<hr />
<h4>- 결제 목록 -</h4>


<hr />
<ul>
	<li>로그번호 / 재능번호/ 재능이름 / 판매자 / 구매자 / 결제방법 / 결제금액 / 정가</li>
	<c:forEach items="${payLogs }" var="payLog">	
	
		<li>
		 
			${payLog.pay_id} / ${payLog.talent_id} / ${payLog.talent_title}	/ ${payLog.seller_member_id} / ${payLog.buyer_member_id} / ${payLog.pay_way} / ${payLog.pay_money}원 / ${payLog.pay_original_money}원 
			 			 
		</li>		
	</c:forEach>		
</ul>

</body>
</html>