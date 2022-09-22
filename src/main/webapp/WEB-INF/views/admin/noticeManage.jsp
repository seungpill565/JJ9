<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리 </title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/jj9/resources/css/adminMain.css?ver=12">
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
			<h2 class="main-container__title">공지사항 관리</h2>
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
						<li><a href="./faqManage">1:1 문의 관리</a></li>
						<li style="background-color: rgb(230, 70, 70);"><a 
							href="./noticeManage">공지 사항 관리</a></li>
					</ul>
				</div>
				<div class="flex-column page-content">
					<div>
					<hr />	
					<div class="flex">
						<h1> 공지 사항 </h1>					
						<button type="button" class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#newNoticeModal" style="margin-left: 20px; height: 45px;"><h4> 새 공지 작성 </h4></button>
					</div>
					
						<table border="1" class="content-table" style="margin: 20px">
							<th><h2 style="margin-top: 10px">&nbsp; 공지id</h2></th>
							<th><h2 style="margin-top: 10px">제목</h2></th>
							<th><h2 style="margin-top: 10px">작성일</h2></th>							
						
							<c:forEach items="${notices1 }" var="notice">
							
								<tr class="notice1-part">
								    <td style="width: 100px; padding: 10px;">&nbsp; ${notice.notice_id} </td>
								    <td style="width: 200px">${notice.notice_title}</td>
								    <td style="width: 300px">${notice.notice_date}</td>
								    <td style="width: 300px">${notice.notice_importance}</td>
									<td>
										<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#modifyNoticeModal"
											data-notice-id = "${notice.notice_id }"
											data-notice-title = "${notice.notice_title }"
											data-notice-content = "${notice.notice_content }"
											data-notice-date = "${notice.notice_date }"
											data-notice-importance = "${notice.notice_importance }"				
										 style="margin-right: 10px; margin-left:10px " >상세보기/수정</button>										
									</td>
								</tr>													
							</c:forEach>				
							
							
							<c:forEach items="${notices2 }" var="notice">
							
								<tr class="notice2-part">
								    <td style="width: 100px; padding: 10px;">&nbsp; ${notice.notice_id} </td>
								    <td style="width: 200px">${notice.notice_title}</td>
								    <td style="width: 300px">${notice.notice_date}</td>
								    <td style="width: 300px">${notice.notice_importance}</td>
									<td>
										<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#modifyNoticeModal"
											data-notice-id = "${notice.notice_id }"
											data-notice-title = "${notice.notice_title }"
											data-notice-content = "${notice.notice_content }"
											data-notice-date = "${notice.notice_date }"
											data-notice-importance = "${notice.notice_importance }"				
										 style="margin-right: 10px; margin-left:10px " >상세보기/수정</button>										
									</td>
								</tr>													
							</c:forEach>
							
							<c:forEach items="${notices3 }" var="notice">
							
								<tr class="notice3-part">
								    <td style="width: 100px; padding: 10px;">&nbsp; ${notice.notice_id} </td>
								    <td style="width: 200px">${notice.notice_title}</td>
								    <td style="width: 300px">${notice.notice_date}</td>
								    <td style="width: 300px">${notice.notice_importance}</td>
									<td>
										<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#modifyNoticeModal"
											data-notice-id = "${notice.notice_id }"
											data-notice-title = "${notice.notice_title }"
											data-notice-content = "${notice.notice_content }"
											data-notice-date = "${notice.notice_date }"
											data-notice-importance = "${notice.notice_importance }"				
										 style="margin-right: 10px; margin-left:10px " >상세보기/수정</button>										
									</td>
								</tr>													
							</c:forEach>							
														
					    </table>					
					
					
									
					<ul>
						<c:forEach items="${notices1 }" var="notice">						
							<li>
							${notice.notice_id} / ${notice.notice_title}/ ${notice.notice_date}  / ${notice.notice_importance} 
								<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#modifyNoticeModal"
									data-notice-id = "${notice.notice_id }"
									data-notice-title = "${notice.notice_title }"
									data-notice-content = "${notice.notice_content }"
									data-notice-date = "${notice.notice_date }"
									data-notice-importance = "${notice.notice_importance }"				
								 >상세보기/수정</button>								 
							</li>		
						</c:forEach>		
					</ul>
					<hr />	
					<ul>
						<c:forEach items="${notices2 }" var="notice">						
							<li>
								${notice.notice_id} / ${notice.notice_title}/ ${notice.notice_date}  / ${notice.notice_importance} 
								<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#modifyNoticeModal"
									data-notice-id = "${notice.notice_id }"
									data-notice-title = "${notice.notice_title }"
									data-notice-content = "${notice.notice_content }"
									data-notice-date = "${notice.notice_date }"
									data-notice-importance = "${notice.notice_importance }"				
								 >상세보기/수정</button>								 
							</li>		
						</c:forEach>		
					</ul>
					
					<hr />	
					<ul>
						<c:forEach items="${notices3 }" var="notice">						
							<li>
								${notice.notice_id} / ${notice.notice_title}/ ${notice.notice_date}  / ${notice.notice_importance} 
								<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#modifyNoticeModal"
									data-notice-id = "${notice.notice_id }"
									data-notice-title = "${notice.notice_title }"
									data-notice-content = "${notice.notice_content }"
									data-notice-date = "${notice.notice_date }"
									data-notice-importance = "${notice.notice_importance }"				
								 >상세보기/수정</button>								 
							</li>		
						</c:forEach>		
					</ul>										
					</div>					
				</div>
			</div>
		</div>
	</div>
	
						<table border="1" class="content-table" style="margin: 20px">
							<th><h2 style="margin-top: 10px">&nbsp; id</h2></th>
							<th><h2 style="margin-top: 10px">메인 카테고리</h2></th>
							<th><h2 style="margin-top: 10px">세부 카테고리</h2></th>
						
							
							
								<tr class="asd1">
								    <td style="width: 100px; padding: 10px;">&nbsp; asdf </td>
								    <td style="width: 200px">adsf</td>
								    <td style="width: 300px">afdf</td>									
								</tr>		
								<tr class="asd1">
								    <td style="width: 100px; padding: 10px;">&nbsp; asdf </td>
								    <td style="width: 200px">adsf</td>
								    <td style="width: 300px">afdf</td>									
								</tr>
								<tr class="asd1">
								    <td style="width: 100px; padding: 10px;">&nbsp; asdf </td>
								    <td style="width: 200px">adsf</td>
								    <td style="width: 300px">afdf</td>									
								</tr>					
							
														
					    </table>
	

<!-- 
<h3>공지사항 관리 페이지입니다.</h3>
관리자 ${currUser.member_id } 님 안녕하세요 <br />
보유 포인트는 ${currUser.member_point } 점 입니다<br />

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
 -->

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

<br /><br /><br />



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="/jj9/resources/js/noticeManage.js?ver=34"></script>

</body>
</html>