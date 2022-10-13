<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재능 등록 요청 관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/jj9/resources/css/adminMain.css?ver=1">
</head>
<body>
	<div class="inline">
		<h1 id="logo">
			<a href="./admin" class="jj9-logo">JJ9</a>
		</h1>
		<h3 id="logo-sub" class="inline" style="margin-right: 5px">관리자 </h3>
		<div id="welcome" class="inline">
			${currUser.member_id } 님 안녕하세요
		</div>
	</div>
	<br />
	
	<div class="thispage__main">
		<div class="main__container">
			<h2 class="main-container__title">재능 등록 요청 관리</h2>
			<div class="adminMenu flex">
				<div class="adminMenu__container">
					<ul class="adminMenu-container__ul">
						<li><a href="./categoryManage">카테고리 관리</a></li>
						<li><a href="./memberManage">회원 관리</a></li>
						<li style="background-color: rgb(230, 70, 70);"><a href="./talentPermission">재능등록 요청 관리</a></li>
						<li><a href="./talentManage">재능 관리</a></li>
						<li><a href="./requestTalentManage">요청 재능 관리</a></li>
						<li><a href="./payLog">결제 기록 조회</a></li>
						<li><a href="./refundManage">환불 요청 관리</a></li>
						<li><a href="./couponManage">쿠폰 관리</a></li>
						<li><a href="./faqManage">1:1 문의 관리</a></li>
						<li><a href="./noticeManage">공지 사항 관리</a></li>
					</ul>
				</div>
				<div class="flex-column page-content">
					<div>
						<h1>등록 요청 목록</h1>
						<hr />
						
						<table border="1" class="content-table" style="margin: 20px">
							<th><h2 style="margin-top: 10px; width: 800px"> &nbsp; 등록 요청 내용</h2></th>
							<th><h2></h2></th>
							<th><h2></h2></th>
						
							<c:forEach items="${talents }" var="talent">
							
								<tr>
								    <td>
								    	<button type="button" class="btn btn-link" data-bs-toggle="modal" data-bs-target="#talentDetailsModal" style= "font-size : 22px";
							
										data-talent-id = "${talent.talent_id}"
										data-talent-title = "${talent.talent_title }"
										data-member-id = "${talent.member_id }"
										data-talent-price = "${talent.talent_price }"
										data-talent-date = "${talent.talent_date }"
										data-talent-service-exp = "${talent.talent_service_exp }"
										data-talent-curriculum = "${talent.talent_curriculum }"
										data-talent-workday = "${talent.talent_workday }"
										data-talent-summary = "${talent.talent_summary }"
								
										>
										${talent.talent_title} / ${talent.member_id} / ${talent.talent_date}
										</button>  
									</td>
									
								    <td><a href="permissionTalent?id=${talent.talent_id }"><button>등록</button></a></td>
								    <td style="padding: 10px; margin-right: 10px; margin-left:10px "><a href="deleteTalent?id=${talent.talent_id }"><button>요청 삭제</button></a></td>
									
								</tr>		
													
							</c:forEach>
														
					    </table>				
						
					</div>					
				</div>
			</div>
		</div>
	</div>	



	
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
	            <input type="number" class="form-control" id="new-talent-price" name="talent_price">
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
	            <input type="number" class="form-control" id="new-talent-workday" name="talent_workday">
	          </div>     
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">재능 요약</label>
	            <input type="text" class="form-control" id="new-talent-summary" name="talent_summary">
	          </div>    
	          
	          <div>            
	            <input id="new-talent-id" type="text"  name="talent_id" hidden="true" readonly >
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
<script src="/jj9/resources/js/talentPermission.js?ver=34"></script>

</body>
</html>