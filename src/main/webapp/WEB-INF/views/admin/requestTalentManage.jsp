<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 재능 관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<h3>요청 재능 관리 페이지입니다.</h3>
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

	
	<h4>- 등록된 재능 목록 -</h4>
	<ul>
	<c:forEach items="${requestTalents }" var="requestTalent">
		<li>		
		<button type="button" data-bs-toggle="modal" data-bs-target="#talentDetailsModal"
		
			data-talent-id = "${requestTalent.trequest_id }"
			data-member-id = "${requestTalent.member_id }"
			data-talent-title = "${requestTalent.trequest_title }"
			data-talent-content = "${requestTalent.trequest_content }"
			data-talent-date = "${requestTalent.trequest_date }"
			data-talent-budget = "${requestTalent.trequest_budget }"
			data-talent-deadline = "${requestTalent.trequest_deadline }"
			data-talent-cate-id = "${requestTalent.cate_id }"
			data-talent-cate-main = "${requestTalent.cate_main }"	
			data-talent-cate-sub = "${requestTalent.cate_sub }"			
			
		>${requestTalent.trequest_id}	/${requestTalent.member_id} / ${requestTalent.trequest_title} / ${requestTalent.trequest_content}  </button>
			 <a href="deleteRequestTalent?id=${requestTalent.trequest_id }"><button>삭제</button></a>
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
	        <form action="./" method="POST">
	                  
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">요청 제목</label>
	            <input type="text" class="form-control" id="new-talent-title" name="talent_title">
	          </div>
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">카테고리</label>
	            <input type="text" class="form-control" id="new-talent-cate" name="talent_workday">
	          </div>  
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">요청 재능 내용</label>	            
	            <textarea class="form-control" id="new-talent-content" name="talent_service_exp" style="height: 300px"> </textarea>
	          </div>
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">요청자 id</label>
	            <input type="text" class="form-control" id="new-member-id" name="talent_price">
	          </div>
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">요청 날짜</label>
	            <input type="date" class="form-control" id="new-talent-date" name="talent_date">
	          </div> 
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">요청 마감날짜</label>
	            <input type="date" class="form-control" id="new-talent-deadline" name="talent_date">
	          </div>  
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">예산</label>
	            <input type="text" class="form-control" id="new-talent-budget" name="talent_price">
	          </div>  	          
	          
	          <div>            
	            <input id="new-trequest-id" type="text" hidden="true" name="trequest_id" readonly >
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
	<script src="/jj9/resources/js/requestTalentManage.js?ver=3"></script>

</body>
</html>