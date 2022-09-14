<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<h3>카테고리 관리 페이지입니다.</h3>
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


<h4>- 새 카테고리 등록 -</h4>
<form action="./addCategory" method="POST">
	id : <input type="text" name="cate_id" />
	메인 카테고리 : <input type="text" name="cate_main" />
	세부 카테고리 : <input type="text" name="cate_sub" />
	<input type="submit" value="등록하기 "/>
</form>

<hr />

<h4>- 카테고리 목록 -</h4>


<hr />
<ul>
	<c:forEach items="${categories }" var="category">	
	
		<li>
			${category.cate_main} > ${category.cate_sub}			 
			 <button type="button" data-bs-toggle="modal" data-bs-target="#modifyCateModal" 
			 data-cate-id = "${category.cate_id }"
			 data-cate-main = "${category.cate_main }"
			 data-cate-sub = "${category.cate_sub }" >수정</button>
			 <button class="deleteCateBtn" data-id=${category.cate_id }>삭제</button>			 
		</li>		
	</c:forEach>		
</ul>

<!-- 버튼 모양 종류  
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modifyCateModal" data-bs-whatever="@mdo">수정</button>
<button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#modifyCateModal" data-bs-whatever="@fat">Open modal for @fat</button>
<button type="button" data-bs-toggle="modal" data-bs-target="#modifyCateModal" data-bs-whatever="@getbootstrap">Open modal for @getbootstrap</button>
-->

<!-- modal 속성 구현-->
<div class="modal fade" id="modifyCateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="./updateCategory" method="POST">
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">카테고리 id</label>
            <input type="text" class="form-control" id="new-cate-id" name="cate_id">
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">메인 카테고리</label>
            <input type="text" class="form-control" id="new-cate-main" name="cate_main">
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">세부 카테고리</label>
            <input type="text" class="form-control" id="new-cate-sub" name="cate_sub">
          </div>
          <div>            
            <input id="selectedCateId" type="text" hidden="true" name="pre_id" readonly >
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
<script src="/jj9/resources/js/categoryManage.js?ver=1"></script>

</body>
</html>