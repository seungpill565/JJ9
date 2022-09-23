<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 기록 조회</title>
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
			<h2 class="main-container__title">결제 기록 관리</h2>
			<div class="adminMenu flex">
				<div class="adminMenu__container">
					<ul class="adminMenu-container__ul">
						<li><a href="./categoryManage">카테고리 관리</a></li>
						<li><a href="./memberManage">회원 관리</a></li>
						<li><a href="./talentPermission">재능등록 요청 관리</a></li>
						<li><a href="./talentManage">재능 관리</a></li>
						<li><a href="./requestTalentManage">요청 재능 관리</a></li>
						<li style="background-color: rgb(230, 70, 70);"><a 
							href="./payLog">결제 기록 조회</a></li>
						<li><a href="./refundManage">환불 요청 관리</a></li>
						<li><a href="./couponManage">쿠폰 관리</a></li>
						<li><a href="./faqManage">1:1 문의 관리</a></li>
						<li><a href="./noticeManage">공지 사항 관리</a></li>
					</ul>
				</div>
				<div class="flex-column page-content">
					<div>
						<h1>결제 목록 </h1>					
						
						<hr />
						
						<table border="1" class="content-table" style="margin: 20px">
							<th><h2 style="margin-top: 10px">&nbsp; 로그번호</h2></th>
							<th><h2 style="margin-top: 10px">재능번호</h2></th>
							<th><h2 style="margin-top: 10px">재능이름</h2></th>
							<th><h2 style="margin-top: 10px">판매자</h2></th>
							<th><h2 style="margin-top: 10px">구매자</h2></th>
							<th><h2 style="margin-top: 10px">결제금액</h2></th>
							<th><h2 style="margin-top: 10px">정가</h2></th>
							<th><h2 style="margin-top: 10px">환불요청기록</h2></th>
						
							<c:forEach items="${payLogs }" var="payLog">
							
								<tr>
								    <td style="width: 160px; padding: 10px;">&nbsp; ${payLog.pay_id} </td>
								    <td style="width: 130px">${payLog.talent_id}</td>
								    <td style="width: 300px">${payLog.talent_title}</td>
								    <td style="width: 200px">${payLog.seller_member_id}</td>
								    <td style="width: 200px">${payLog.buyer_member_id}</td>
								    <td style="width: 200px">${payLog.pay_money}원</td>
								    <td style="width: 200px">${payLog.pay_original_money}원</td>
								    <td style="width: 200px">${payLog.refund_request}</td>								
								</tr>		
													
							</c:forEach>														
					    </table>						
					</div>					
				</div>
			</div>
		</div>
	</div>	
	
	<br /><br /><br />

</body>
</html>