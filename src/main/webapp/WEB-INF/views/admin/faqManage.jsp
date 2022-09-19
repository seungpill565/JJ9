<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<h3>1:1 문의 관리 페이지입니다.</h3>
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
<a href="<c:url value="/noticeManage"/>">공지 사항 관리</a><br />
<hr />


<h4>- 1:1 문의 요청-</h4>

<ul>
	<c:forEach items="${faqs }" var="faq">	
	
		<li>
			<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#answerFaqModal"
				data-faq-id = "${faq.faq_id }"
				data-faq-cate = "${faq.faq_cate }"
				data-faq-title = "${faq.faq_title }"
				data-faq-content = "${faq.faq_content }"
				data-faq-date = "${faq.faq_date }"
				data-member-id = "${faq.member_id }"				
			 >${faq.faq_id} / ${faq.faq_cate} / ${faq.faq_title}/ ${faq.faq_date}  / ${faq.member_id} </button> 
			 
		</li>		
	</c:forEach>		
</ul>
<hr />

<div class="modal fade" id="answerFaqModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>  
      </div>
      		 
     
      <div class="modal-body">
        <form action="./answerFaq" method="POST">
          <div class="mb-3">
	          <span class="modal-title2" id="exampleModalLabel2">New message</span>   
	          <label for="recipient-name" class="col-form-label">  작성일 : <span id="new-faq-date" ></span></label>
	          <label for="recipient-name" class="col-form-label">  문의 번호 : <span id="new-faq-id"></span></label>
	          <label for="recipient-name" class="col-form-label">  문의 분류 : <span id="new-faq-cate"></span></label>
          </div>          
               
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">내용</label>
            <textarea class="form-control" id="new-faq-content" name="faq_content" style="height: 150px" readonly ></textarea>
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">답변 작성하기</label>
            <textarea class="form-control" id="new-faq-answer" name="faq_answer" style="height: 150px"> </textarea>
          </div>   
           <div>            
            <input id="faq-id" type="text" hidden="true" name="faq_id" readonly >
          </div>             
	      <div class="modal-footer">
	        <button type="submit" id="modifyConfirmBtn" class="btn btn-primary" data-bs-dismiss="modal" >답변전송</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	      </div>
        </form>
      </div>
    </div>
  </div>
</div>


<h4>- 1:1 답변 완료 -</h4>

<ul>
	<c:forEach items="${answeredFaqs }" var="faq">	
	
		<li>
			<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#answerFaqModal"
				data-faq-id = "${faq.faq_id }"
				data-faq-title = "${faq.faq_title }"
				data-faq-content = "${faq.faq_content }"
				data-faq-date = "${faq.faq_date }"
				data-member-id = "${faq.member_id }"
				data-faq-answer = "${faq.faq_answer }"				
			 > ${faq.faq_id} / ${faq.faq_cate} / ${faq.faq_title}/ ${faq.faq_date}  / ${faq.member_id} </button> 
			 
		</li>		
	</c:forEach>		
</ul>
<hr />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="/jj9/resources/js/faqManage.js?ver=34"></script>

</body>
</html>