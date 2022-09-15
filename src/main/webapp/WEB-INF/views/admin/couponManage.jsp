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

<hr />

<h4>- 새 쿠폰 생성 -</h4>

<button type="button" data-bs-toggle="modal" data-bs-target="#createCouponModal" 
	data-random-code = "${random_code }" >쿠폰 생성하기</button>
<hr />

<h4>- 쿠폰 목록 -</h4>

코드  === ${random_code} 

<hr />
<ul>
	<c:forEach items="${coupons }" var="coupon">	
	
		<li>
			${coupon.coupon_code} > ${coupon.coupon_name} 
			 
		</li>		
	</c:forEach>		
</ul>


<!-- modal 속성 구현-->
<div class="modal fade" id="createCouponModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">새 쿠폰 생성</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="./updateCategory" method="POST">
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">쿠폰 코드</label>
            <input type="text" class="form-control" id="new-coupon-code" name="coupon-code" readonly>
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">쿠폰 이름</label>
            <input type="text" class="form-control" id="new-cate-main" name="cate_main">
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">사용 기한</label>
            <input type="text" class="form-control" id="new-cate-sub" name="cate_sub">
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">할인율</label>
            <input type="text" class="form-control" id="new-cate-sub" name="cate_sub">
          </div>
          <div>            
            <input id="selectedCateId" type="text" hidden="true" name="pre_id" readonly >
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
<script src="/jj9/resources/js/couponManage.js?ver=1"></script>

</body>
</html>