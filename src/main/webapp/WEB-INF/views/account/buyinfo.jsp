<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/jj9/resources/css/mypage-category.css">
<link rel="stylesheet" href="/jj9/resources/css/buyinfo.css">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
	<h1 class="mypage-name">${sessionScope.member_name }님 반갑습니다.</h1>
	<div class="mypage">
		<div class="category__container">
			<ul class="cate-container__ul">
				<li><h2>구매재능내역</h2></li>
				<li><a href="../sell-talent">판매재능관리</a></li>
				<li style="background-color: rgb(230, 70, 70);"><a
					style="color: white;" href="../purchase-history">구매재능내역</a></li>
				<li><a href="../note">쪽지관리</a></li>
				<li><a href="../add-coupon">쿠폰등록</a></li>
				<li><a href="../inquiry.jsp">1:1 문의</a></li>
				<li><a href="../member-modify">회원정보수정</a></li>
				<li><a href="../secession">회원탈퇴</a></li>
			</ul>
		</div>

		<div class="thispage__main">
			<div class="main__container">
				<h2 class="main-container__title">구매재능내역</h2>
				<div class="container__card">
					<table border="1">
						<thead>
							<th>결제번호</th>
							<th>재능이름</th>
							<th>가격(할인 미적용)</th>
							<th>가격(할인 적용)</th>
							<th>판매자 이름</th>
							<th>판매자 닉네임</th>
							<th>판매자 전화번호</th>
							<th>판매자 이메일</th>
							<th>쪽지 보내기</th>
						</thead>
						<tbody>
							<tr>
								<td>${payTal.pay_id }</td>
								<td>${payTal.talent_title }</td>
								<td><fmt:formatNumber value="${payTal.pay_original_money }" groupingUsed="true" /></td>
								<td><fmt:formatNumber value="${payTal.pay_money }" groupingUsed="true" /></td>
								<td>${member.member_name }</td>
								<td>${member.member_nickName }</td>
								<td>${member.member_phoneNum }</td>
								<td>${member.member_email }</td>
								<td><button id="window-button">쪽지 보내기</button></td>
								<div id="pop-url" style="display: none;">
									<c:url value="/message/" />
								</div>
							</tr>
						</tbody>
					</table>
					<hr>
					<div>
						<form action="../review" class="mb-3" name="myform" id="myform" method="POST">
							<fieldset>
								<span class="text-bold">별점을 선택해주세요</span> 
								<input type="radio" name="review_grade" value="5" id="rate1">
								<label for="rate1">★</label> 
								<input type="radio" name="review_grade" value="4" id="rate2">
								<label for="rate2">★</label> 
								<input type="radio" name="review_grade" value="3" id="rate3">
								<label for="rate3">★</label>
								<input type="radio" name="review_grade" value="2" id="rate4">
								<label for="rate4">★</label> 
								<input type="radio" name="review_grade" value="1" id="rate5">
								<label for="rate5">★</label>
							</fieldset>
							<div>
								<textarea class="col-auto form-control" type="text"
									id="reviewContents"
									name="review_content"
									placeholder="리뷰를 남겨주세요!!"></textarea>
							</div>
							<input type="hidden" name="talent_id" value="${payTal.talent_id }"/>
							<input id="submit" type="submit" value="입력"/>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	


</body>
</html>