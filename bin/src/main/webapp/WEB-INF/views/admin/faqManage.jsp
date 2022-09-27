<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
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
			<h2 class="main-container__title">1:1 문의 관리</h2>
			<div class="adminMenu flex">
				<div class="adminMenu__container">
					<ul class="adminMenu-container__ul">
						<li><a href="./categoryManage">카테고리 관리</a></li>
						<li><a href="./memberManage">회원 관리</a></li>
						<li><a href="./talentPermission">재능등록 요청 관리</a></li>
						<li><a href="./talentManage">재능 관리</a></li>
						<li><a href="./requestTalentManage">요청 재능 관리</a></li>
						<li><a href="./payLog">결제 기록 조회</a></li>
						<li><a href="./refundManage">환불 요청 관리</a></li>
						<li><a href="./couponManage">쿠폰 관리</a></li>
						<li style="background-color: rgb(230, 70, 70);"><a 
							href="./faqManage">1:1 문의 관리</a></li>
						<li><a href="./noticeManage">공지 사항 관리</a></li>
					</ul>
				</div>
				<div class="flex-column page-content">
					<div>
						<h1>1:1 문의 요청</h1>		
						
						<table border="1" class="content-table" style="margin: 20px">
							<th><h2 style="margin-top: 10px">&nbsp; 문의id</h2></th>
							<th><h2 style="margin-top: 10px">분류</h2></th>
							<th><h2 style="margin-top: 10px">제목</h2></th>
							<th><h2 style="margin-top: 10px">작성일</h2></th>
							<th><h2 style="margin-top: 10px">회원id</h2></th>
						
							<c:forEach items="${faqs }" var="faq">	
							
								<tr>
								    <td style="width: 130px; padding: 10px;">&nbsp; ${faq.faq_id} </td>
								    <td style="width: 200px">${faq.faq_cate}</td>
								    <td style="width: 500px">${faq.faq_title}</td>
								    <td style="width: 200px">${faq.faq_date}</td>
								    <td style="width: 200px">${faq.member_id}</td>						
								    
									<td>
										<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#answerFaqModal"
											data-faq-id = "${faq.faq_id }"
											data-faq-cate = "${faq.faq_cate }"
											data-faq-title = "${faq.faq_title }"
											data-faq-content = "${faq.faq_content }"
											data-faq-date = "${faq.faq_date }"
											data-member-id = "${faq.member_id }"				
										 style="margin-right: 10px"> 답변 작성</button>											
									</td>
								</tr>
													
							</c:forEach>
														
					    </table>						
						<hr />						
					</div>
					<div>
						<h1>1:1 답변 완료</h1>	
						
						<table border="1" class="content-table" style="margin: 20px">
							<th><h2 style="margin-top: 10px">&nbsp; 문의id</h2></th>
							<th><h2 style="margin-top: 10px">분류</h2></th>
							<th><h2 style="margin-top: 10px">제목</h2></th>
							<th><h2 style="margin-top: 10px">작성일</h2></th>
							<th><h2 style="margin-top: 10px">회원id</h2></th>
						
							<c:forEach items="${answeredFaqs }" var="faq">	
							
								<tr>
								    <td style="width: 130px; padding: 10px;">&nbsp; ${faq.faq_id} </td>
								    <td style="width: 200px">${faq.faq_cate}</td>
								    <td style="width: 500px">${faq.faq_title}</td>
								    <td style="width: 200px">${faq.faq_date}</td>
								    <td style="width: 200px">${faq.member_id}</td>						
								    
									<td>
									<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#answerFaqModal"
										data-faq-id = "${faq.faq_id }"
										data-faq-title = "${faq.faq_title }"
										data-faq-content = "${faq.faq_content }"
										data-faq-date = "${faq.faq_date }"
										data-member-id = "${faq.member_id }"
										data-faq-answer = "${faq.faq_answer }"				
									style="margin-right: 10px" >  답변 수정</button>										
									</td>
								</tr>
													
							</c:forEach>
														
					    </table>					
									
						

					</div>
				</div>
			</div>
		</div>
	</div>
	
<!-- 답변작성 modal -->	 
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
<br /><br /><br />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="/jj9/resources/js/faqManage.js?ver=34"></script>

</body>
</html>