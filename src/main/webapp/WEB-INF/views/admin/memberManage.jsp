<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

	<h3>회원 관리 페이지입니다.</h3>
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

	<h4>- 회원 목록 -</h4>
	<ul>
	<c:forEach items="${members }" var="member">
		<li>
			${member.member_id} / ${member.member_name} / ${member.member_nickName}
			 <button type="button" data-bs-toggle="modal" data-bs-target="#modifyMemberModal" 
			 data-member-id = "${member.member_id }"
			 data-member-email = "${member.member_email }"
			 data-member-phoneNum = "${member.member_phoneNum }"
			 data-member-birthday = "${member.member_birthday }"
			 data-member-point = "${member.member_point }"
			 data-member-name = "${member.member_name }"
			 data-member-nickName = "${member.member_nickName }"
			 data-member-comments = "${member.member_comments}"
			  >수정</button>
			 <a href="deleteMember?id=${member.member_id }"><button>삭제</button></a>
		</li>		
	</c:forEach>		
	</ul>

	<!-- modal 속성 구현-->
	<div class="modal fade" id="modifyMemberModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form action="./updateMember" method="POST">
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">회원 id</label>
	            <input type="text" class="form-control" id="new-member-id" name="member_id" readonly>
	          </div>
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">이름</label>
	            <input type="text" class="form-control" id="new-member-name" name="member_name">
	          </div>
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">닉네임</label>
	            <input type="text" class="form-control" id="new-member-nickName" name="member_nickName">
	          </div>
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">보유포인트</label>
	            <input type="text" class="form-control" id="new-member-point" name="member_point">
	          </div>
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">생년월일</label>
	            <input type="date" class="form-control" id="new-member-birthday" name="member_birthday">
	          </div>
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">연락처</label>
	            <input type="text" class="form-control" id="new-member-phoneNum" name="member_phoneNum">
	          </div>	          
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">이메일</label>
	            <input type="text" class="form-control" id="new-member-email" name="member_email">
	          </div>
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">자기소개</label>
	            <textarea class="form-control" id="new-member-comments" name="member_comments"> </textarea>
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
	<script src="/jj9/resources/js/memberManage.js?ver=1"></script>
	
</body>
</html>