<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
IMP.init('imp04028848');

IMP.request_pay({
	pg : 'html5_inicis',
	pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : `${talneTitle }`,
    amount : '100',//${money }, //판매 가격
    buyer_email : `${members.member_email }`,
    buyer_name : `${members.member_name }`,
    buyer_tel : `${members.member_phoneNum }`,
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
        var url = "./success?getOriginalMoney="+`${originalMoney }`+"&money="+`${money }`
        		+"&name="+`${name }`;
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        var url = "./"+`${talentId }`;
    }
    alert(msg);
    location.href = url;
});
</script>

</body>
</html>