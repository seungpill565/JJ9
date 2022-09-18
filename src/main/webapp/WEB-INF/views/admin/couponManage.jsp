<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<h3>쿠폰 관리 페이지입니다.</h3>
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
<a href="<c:url value="/couponManage"/>">쿠폰 관리</a><br />
<a href="<c:url value="/faqManage"/>">1:1 문의 관리</a><br />
<hr />


<h4>- 새 쿠폰 생성 -</h4>

<button type="button" data-bs-toggle="modal" data-bs-target="#createCouponModal" 
	data-random-code = "${random_code }" >쿠폰 생성하기</button>
<hr />

<h4>- 쿠폰 목록 -</h4>
<ul>
	<c:forEach items="${coupons }" var="coupon">	
	
		<li>
			${coupon.coupon_code} / ${coupon.coupon_name} / ${coupon.coupon_period} / ${coupon.discount_percent}  / ${coupon.coupon_unused}/ ${coupon.member_id}  
			 
		</li>		
	</c:forEach>		
</ul>
<hr />

<!-- modal 속성 구현-->
<div class="modal fade" id="createCouponModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">새 쿠폰 생성</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="./createNewCoupon" method="POST">
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">쿠폰 코드</label>
            <input type="text" class="form-control" id="new-coupon-code" name="coupon_code" readonly>
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">쿠폰 이름</label>
            <select class="form-select" aria-label="Default select example" id="selected-coupon-name"  name="coupon_name"          	
            	onchange="document.getElementById('discount_rate').value = this.options[this.selectedIndex].dataset.discountRate">
				<option selected value="0">쿠폰 종류선택</option>
				<option data-discount-rate="10">재능 10% 할인쿠폰</option>
				<option data-discount-rate="20">재능 20% 할인쿠폰</option>
				<option data-discount-rate="30">재능 30% 할인쿠폰</option>
				<option data-discount-rate="40">재능 40% 할인쿠폰</option>
				<option data-discount-rate="15">신년운세 할인쿠폰</option>
				<option data-discount-rate="15">신규회원 할인쿠폰</option>
				<option data-discount-rate="10">봄맞이 할인쿠폰</option>
				<option data-discount-rate="10">여름맞이 할인쿠폰</option>
				<option data-discount-rate="10">겨울맞이 할인쿠폰</option>
				<option data-discount-rate="15">재능데이 할인쿠폰</option>
				<option data-discount-rate="20">생일축하 할인쿠폰</option>
		  	</select>
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">사용 기한</label>
            <input type="date" class="form-control" name="coupon_period" id="input-date">
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label" id="selected-coupon-rate">할인율 (%)</label>
            <input type="text" class="form-control" name="discount_percent" value="0" id="discount_rate" readonly>
          </div>         
                       
	      <div class="modal-footer">
	        <button type="submit" id="modifyConfirmBtn" class="btn btn-primary" data-bs-dismiss="modal" >생성하기</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	      </div>
        </form>
      </div>
    </div>
  </div>
</div>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="/jj9/resources/js/couponManage.js?ver=34"></script>

</body>
</html>