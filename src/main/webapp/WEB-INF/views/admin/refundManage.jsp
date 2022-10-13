<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환불 요청</title>
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
			<h2 class="main-container__title">환불 요청 관리</h2>
			<div class="adminMenu flex">
				<div class="adminMenu__container">
					<ul class="adminMenu-container__ul">
						<li><a href="./categoryManage">카테고리 관리</a></li>
						<li><a href="./memberManage">회원 관리</a></li>
						<li><a href="./talentPermission">재능등록 요청 관리</a></li>
						<li><a href="./talentManage">재능 관리</a></li>
						<li><a href="./requestTalentManage">요청 재능 관리</a></li>
						<li><a href="./payLog">결제 기록 조회</a></li>
						<li style="background-color: rgb(230, 70, 70);"><a 
							href="./refundManage">환불 요청 관리</a></li>
						<li><a href="./couponManage">쿠폰 관리</a></li>
						<li><a href="./faqManage">1:1 문의 관리</a></li>
						<li><a href="./noticeManage">공지 사항 관리</a></li>
					</ul>
				</div>
				<div class="flex-column page-content">
					<div>
						<h1> 환불 요청 목록 </h1>
						<hr />						
						
						<table border="1" class="content-table" style="margin: 20px">
							<th><h2 style="margin-top: 10px">&nbsp; 요청id</h2></th>
							<th><h2 style="margin-top: 10px">결제id</h2></th>
							<th><h2 style="margin-top: 10px">요청상태</h2></th>
							<th><h2 style="margin-top: 10px">구매자</h2></th>
							<th><h2 style="margin-top: 10px">결제금액</h2></th>
							<th><h2 style="margin-top: 10px">정가</h2></th>
							<th><h2 style="margin-top: 10px">재능 이름</h2></th>
							<th><h2 style="margin-top: 10px">판매자</h2></th>							
						
							<c:forEach items="${refundRequests }" var="refundRequest">
							
								<tr>
								    <td style="width: 100px; padding: 10px;">&nbsp; ${refundRequest.refund_id} </td>
								    <td style="width: 100px">${refundRequest.pay_id}</td>
								    <td style="width: 150px">${refundRequest.request_status}</td>
								    <td style="width: 130px">${refundRequest.buyer_member_id}</td>
								    <td style="width: 130px">${refundRequest.pay_money}원</td>
								    <td style="width: 130px">${refundRequest.pay_original_money}원</td>
								    <td style="width: 250px">${refundRequest.talent_title}</td>
								    <td style="width: 150px">${refundRequest.seller_member_id}</td>
									<td>
										<form action="./refund" method="post" style="display:inline-block">
											<input type="hidden" name="refund_id" value=${refundRequest.refund_id} />
											<input type="hidden" name="buyer_member_id" value=${refundRequest.buyer_member_id} />
											<input type="hidden" name="pay_money" value=${refundRequest.pay_money} />
											<input type="hidden" name="seller_member_id" value=${refundRequest.seller_member_id} />
											<input type="hidden" name="pay_original_money" value=${refundRequest.pay_original_money} />
											<input type="hidden" name="pay_id" value=${refundRequest.pay_id} />
											<button type="submit">환불처리</button>
										</form>			
										<a href="confirmDeleteRefundRequest?refund_id=${refundRequest.refund_id }"><button style="margin: 0px 10px">요청 삭제</button></a>
									</td>
								</tr>		
													
							</c:forEach>
														
					    </table>	
					    <br />
					    <br />
						<h1> 환불 완료 목록 </h1>	
					    <hr />
						
						<table border="1" class="content-table" style="margin: 20px">
							<th><h2 style="margin-top: 10px">&nbsp; 요청id</h2></th>
							<th><h2 style="margin-top: 10px">결제id</h2></th>
							<th><h2 style="margin-top: 10px">요청상태</h2></th>
							<th><h2 style="margin-top: 10px">구매자</h2></th>
							<th><h2 style="margin-top: 10px">결제금액</h2></th>
							<th><h2 style="margin-top: 10px">정가</h2></th>
							<th><h2 style="margin-top: 10px">재능 이름</h2></th>
							<th><h2 style="margin-top: 10px">판매자</h2></th>							
						
							<c:forEach items="${refundCompleted }" var="refundCompleted">
							
								<tr>
								    <td style="width: 130px; padding: 10px;">&nbsp; ${refundCompleted.refund_id} </td>
								    <td style="width: 130px">${refundCompleted.pay_id}</td>
								    <td style="width: 150px">${refundCompleted.request_status}</td>
								    <td style="width: 160px">${refundCompleted.buyer_member_id}</td>
								    <td style="width: 160px">${refundCompleted.pay_money}원</td>
								    <td style="width: 200px">${refundCompleted.pay_original_money}원</td>
								    <td style="width: 350px">${refundCompleted.talent_title}</td>
								    <td style="width: 160px">${refundCompleted.seller_member_id}</td>									
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