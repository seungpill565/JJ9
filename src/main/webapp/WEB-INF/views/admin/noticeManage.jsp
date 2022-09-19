<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리 </title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<h3>공지사항 관리 페이지입니다.</h3>
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
<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#newNoticeModal"><h4>- 새 공지 작성 -</h4></button>

<hr />

<h4>- 공지 사항 -</h4>

<ul>
	<c:forEach items="${notices }" var="notice">	
	
		<li>
			<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#modifyNoticeModal"
				data-notice-id = "${notice.notice_id }"
				data-notice-title = "${notice.notice_title }"
				data-notice-content = "${notice.notice_content }"
				data-notice-date = "${notice.notice_date }"
				data-notice-importance = "${notice.notice_importance }"				
			 >${notice.notice_id} / ${notice.notice_title}/ ${notice.notice_date}  / ${notice.notice_importance} </button> 
			 
		</li>		
	</c:forEach>		
</ul>
<hr />

<!-- 새 공지 작성 modal 속성 구현-->
<div class="modal fade" id="newNoticeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="./newNotice" method="POST">          
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">제목</label>
            <input type="text" class="form-control" id="new-notice-title" name="notice_title">
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">공지 내용</label>
            <textarea class="form-control" id="new-notice-content" name="notice_content" style="height: 300px"> </textarea>
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">수정 날짜</label>
            <input type="date" class="form-control" id="new-notice-date-now" name="notice_date">
          </div>    
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">중요도</label>
            <select class="form-select" aria-label="Default select example" id="new-notice-importance"  name="notice_importance">
				
				<option>1 특별공지</option>
				<option>2 중요공지</option>
				<option>3 일반공지</option>	
		  	</select>
          </div>
          <div>            
            <input id="notice-id" type="text" hidden="true" name="notice_id" readonly >
          </div>                
	      <div class="modal-footer">
	        <button type="submit" id="modifyConfirmBtn" class="btn btn-primary" data-bs-dismiss="modal" >작성하기</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	      </div>
        </form>
      </div>
    </div>
  </div>
</div>




<!-- 공지 수정 modal 속성 구현-->
<div class="modal fade" id="modifyNoticeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="./updateNotice" method="POST">          
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">제목</label>
            <input type="text" class="form-control" id="new-notice-title" name="notice_title">
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">공지 내용</label>
            <textarea class="form-control" id="new-notice-content" name="notice_content" style="height: 300px"> </textarea>
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">수정 날짜</label>
            <input type="date" class="form-control" id="new-notice-date" name="notice_date">
          </div>    
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">중요도</label>
            <select class="form-select" aria-label="Default select example" id="new-notice-importance"  name="notice_importance">
				
				<option>1 특별공지</option>
				<option>2 중요공지</option>
				<option>3 일반공지</option>	
		  	</select>
          </div>
          <div>            
            <input id="notice-id" type="text" hidden="true" name="notice_id" readonly >
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
<script src="/jj9/resources/js/noticeManage.js?ver=34"></script>

</body>
</html>