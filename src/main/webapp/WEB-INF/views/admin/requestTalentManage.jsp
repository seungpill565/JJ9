<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 재능 관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/jj9/resources/css/adminMain.css?ver=1">
</head>
<body>
	<div class="inline">
		<h1 id="logo">
			<a href="./admin" class="jj9-logo">JJ9</a>
		</h1>
		<h3 id="logo-sub">관리자용</h3>
	</div>
	${currUser.member_id } 님 안녕하세요
	<br />


	<div class="thispage__main">
		<div class="main__container">
			<h2 class="main-container__title"> 요청 재능 관리</h2>
			<div class="adminMenu flex">
				<div class="adminMenu__container">
					<ul class="adminMenu-container__ul">
						<li><a href="./categoryManage">카테고리 관리</a></li>
						<li><a href="./memberManage">회원 관리</a></li>
						<li><a href="./talentPermission">재능등록 요청 관리</a></li>
						<li><a href="./talentManage">재능 관리</a></li>
						<li style="background-color: rgb(230, 70, 70);"><a
							href="./requestTalentManage">요청 재능 관리</a></li>
						<li><a href="./payLog">결제 기록 조회</a></li>
						<li><a href="./refundManage">환불 요청 관리</a></li>
						<li><a href="./couponManage">쿠폰 관리</a></li>
						<li><a href="./faqManage">1:1 문의 관리</a></li>
						<li><a href="./noticeManage">공지 사항 관리</a></li>
					</ul>
				</div>
				<div class="flex-column page-content">
					<div>
						<h1>요청중 목록</h1>
						<hr />
						
						
						<table border="1" class="content-table" style="margin: 20px">
							<th><h2 style="margin-top: 10px">&nbsp; id</h2></th>
							<th><h2 style="margin-top: 10px">요청 회원</h2></th>
							<th><h2 style="margin-top: 10px">요청 제목</h2></th>							
						
							<c:forEach items="${requestTalents }" var="requestTalent">
							
								<tr>
								    <td style="width: 100px; padding: 10px;">&nbsp; ${requestTalent.trequest_id} </td>
								    <td style="width: 200px">${requestTalent.member_id}</td>
								    <td style="width: 600px">${requestTalent.trequest_title}</td>								    
									<td>
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
											
										>상세보기/수정</button>
										<a href="deleteRequestTalent?id=${requestTalent.trequest_id }"><button style="margin-right: 10px; margin-left:10px ">삭제</button></a>
										
									</td>
								</tr>		
													
							</c:forEach>
														
					    </table>						
					</div>					
				</div>
			</div>
		</div>
	</div>


	<!-- 요청 재능 수정 modal 속성 구현-->
	<div class="modal fade" id="talentDetailsModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">재능 상세정보</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form action="./updateRequestTalent" method="POST">
	                  
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">요청자 id</label>
	            <input type="text" class="form-control" id="new-member-id" name="member_id" readonly>
	          </div>
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">카테고리</label>
	            	            
	            <select class="form-select" aria-label="Default select example"  id="new-talent-cate"  name="cate_id">				
		            <c:forEach items="${categories }" var="category">
						<option value="${category.cate_id }">${category.cate_main } > ${category.cate_sub }</option>
			  		</c:forEach>						
		  		</select>
		  		
	          </div>  
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">요청 제목</label>
	            <input type="text" class="form-control" id="new-talent-title" name="trequest_title">
	          </div>
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">요청 재능 내용</label>	            
	            <textarea class="form-control" id="new-talent-content" name="trequest_content" style="height: 300px"> </textarea>
	          </div>
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">요청 날짜</label>
	            <input type="date" class="form-control" id="new-talent-date" name="trequest_date">
	          </div> 
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">요청 마감 기한</label>
	            <input type="date" class="form-control" id="new-talent-deadline" name="trequest_deadline">
	          </div>  
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">예산</label>
	            <input type="number" class="form-control" id="new-talent-budget" name="trequest_budget">
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
	<br /><br /><br />
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="/jj9/resources/js/requestTalentManage.js?ver=3"></script>

</body>
</html>