<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재능 등록 요청 관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

	<h3>재능 등록 요청 관리 페이지입니다.</h3>
	관리자 ${currUser.member_id } 님 안녕하세요 <br />	
	
	<hr />
	<a href=" <c:url value="/admin"/>">관리자 메인 페이지</a> <br />
	<a href=" <c:url value="/categoryManage"/>">카테고리 관리</a> <br />
	<a href="<c:url value="/memberManage"/>">회원 관리</a> <br />
	<a href="<c:url value="/talentPermission"/>">재능등록 요청 관리</a><br />
	<a href="<c:url value="/talentManage"/>">재능 관리</a><br />
	<a href="<c:url value="/requestTalentManage"/>">요청 재능 관리</a><br />
	<a href="<c:url value="/payLog"/>">결제 기록 조회</a><br />
	<a href="<c:url value="/refundManage"/>">환불 요청 관리</a><br />
	<a href="<c:url value="/couponManage"/>">쿠폰 관리</a><br />
	<a href="<c:url value="/faqManage"/>">1:1 문의 관리</a><br />
	<a href="<c:url value="/noticeManage"/>">공지 사항 관리</a><br />
	
	<hr />

	<h4>- 등록 요청 목록 -</h4>
	<ul>
	<c:forEach items="${talents }" var="talent">
		<li>
		<button type="button" class="btn btn-link" data-bs-toggle="modal" data-bs-target="#talentDetailsModal"
		
			data-talent-id = "${talent.talent_id }"
			data-talent-title = "${talent.talent_title }"
			data-member-id = "${talent.member_id }"
			data-talent-price = "${talent.talent_price }"
			data-talent-date = "${talent.talent_date }"
			data-talent-service-exp = "${talent.talent_service_exp }"
			data-talent-curriculum = "${talent.talent_curriculum }"
			data-talent-workday = "${talent.talent_workday }"
			data-talent-summary = "${talent.talent_summary }"
			
		>
		${talent.talent_id}	/${talent.talent_title} / ${talent.member_id} / ${talent.talent_date}
		</button> 
			 <a href="permissionTalent?id=${talent.talent_id }"><button>등록</button></a>
			 <a href="deleteTalent?id=${talent.talent_id }"><button>삭제</button></a>
		</li>		
	</c:forEach>		
	</ul>
	
	<!-- 재능 수정 modal 속성 구현-->
	<div class="modal fade" id="talentDetailsModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">재능 상세정보</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form action="./updateTalent" method="POST">          
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">재능 이름</label>
	            <input type="text" class="form-control" id="new-talent-title" name="talent_title">
	          </div>
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">신청자 id</label>
	            <input type="text" class="form-control" id="new-member-id" name="member_id" readonly>
	          </div>
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">재능 가격</label>
	            <input type="text" class="form-control" id="new-talent-price" name="talent_price">
	          </div>
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">신청 날짜</label>
	            <input type="date" class="form-control" id="new-talent-date" name="talent_date">
	          </div> 
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">재능 설명</label>
	            <textarea class="form-control" id="new-talent-service-exp" name="talent_service_exp" style="height: 300px"> </textarea>
	          </div>  
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">커리큘럼 정보</label>
	            <textarea class="form-control" id="new-talent-curriculum" name="talent_curriculum" style="height: 300px"> </textarea>
	          </div>  
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">재능 소요일</label>
	            <input type="text" class="form-control" id="new-talent-workday" name="talent_workday">
	          </div>     
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">재능 요약</label>
	            <input type="text" class="form-control" id="new-talent-summary" name="talent_summary">
	          </div>    
	          
	          <div>            
	            <input id="new-talent-id" type="text" hidden="true" name="talent_id" readonly >
	          </div>  
	                        
		      <div class="modal-footer">
		        <button type="submit" id="modifyConfirmBtn" class="btn btn-primary" data-bs-dismiss="modal" >수정하기</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		      </div>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>

	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="/jj9/resources/js/talentPermission.js?ver=34"></script>

</body>
</html>