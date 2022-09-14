<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환불 요청</title>
</head>
<body>

<h3>환불 요청 관리 페이지입니다.</h3>
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
<h4>- 환불 요청 목록 -</h4>

<ul>
	<li>요청번호 / 결제id / 요청상태 / 구매자 / 결제방법 / 결제금액 / 정가 / 재능이름 / 판매자</li>
	<c:forEach items="${refundRequests }" var="refundRequest">	
		<li>		 
			${refundRequest.refund_id} / ${refundRequest.pay_id} / ${refundRequest.request_status}	/ ${refundRequest.buyer_member_id} / ${refundRequest.pay_way} / ${refundRequest.pay_money}원 / ${refundRequest.pay_original_money}원 / ${refundRequest.talent_title} / ${refundRequest.seller_member_id} 
			<form action="./refund" method="post" style="display:inline-block">
				<input type="hidden" name="refund_id" value=${refundRequest.refund_id} />
				<input type="hidden" name="buyer_member_id" value=${refundRequest.buyer_member_id} />
				<input type="hidden" name="pay_money" value=${refundRequest.pay_money} />
				<input type="hidden" name="seller_member_id" value=${refundRequest.seller_member_id} />
				<input type="hidden" name="pay_original_money" value=${refundRequest.pay_original_money} />
				<input type="submit" value="환불 처리"/>
			</form>			
			<a href="deleteRefundRequest?refund_id=${refundRequest.refund_id }"><button>요청 삭제</button></a>
		</li>		
	</c:forEach>	
</ul>

<hr /><h4>- 환불 완료 목록 -</h4>		
<ul>
	<li>요청번호 / 결제id / 요청상태 / 구매자 / 결제방법 / 결제금액 / 정가 / 재능이름 / 판매자</li>
	<c:forEach items="${refundCompleted }" var="refundCompleted">	
		<li>		 
			${refundCompleted.refund_id} / ${refundCompleted.pay_id} / ${refundCompleted.request_status}	/ ${refundCompleted.buyer_member_id} / ${refundCompleted.pay_way} / ${refundCompleted.pay_money}원 / ${refundCompleted.pay_original_money}원 / ${refundCompleted.talent_title} / ${refundCompleted.seller_member_id}
	
		</li>		
	</c:forEach>
</ul>

</body>
</html>