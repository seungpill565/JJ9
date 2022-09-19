<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jj9 - 회원탈퇴</title>
<link rel="stylesheet" href="/jj9/resources/css/mypage-category.css">
<link rel="stylesheet" href="/jj9/resources/css/secession.css">
</head>
<body>
<%@ include file="../include/menu.jsp" %>
	<h1 class="mypage-name">${sessionScope.member_name }님 반갑습니다.</h1>
	<div class="mypage">
		<div class="category__container">
			<ul class="cate-container__ul">
				<li><h2>회원탈퇴</h2></li>
				<li><a href="./sell-talent">판매재능관리</a></li>
				<li><a href="./purchase-history">구매재능내역</a></li>
				<li><a href="./note">쪽지관리</a></li>
				<li><a href="./add-coupon">쿠폰등록</a></li>
				<li><a href="./inquiry">1:1 문의</a></li>
				<li><a href="./member-modify">회원정보수정</a></li>
				<li style="background-color: rgb(230, 70, 70);"><a style="color: white;" href="./secession">회원탈퇴</a></li>
			</ul>
		</div>
		
		<div class="thispage__main">
			<div class="main__container">
			
				<h2 class="main-container__title">회원탈퇴</h2>
				<div class="container__card">
				
					<p>회원 탈퇴 시 내 모든 정보가 삭제되며, 이후 복구가 불가능합니다.</p>
					<div class="notify__container">
						<div class="card__notify--secession">
							<h4>회원 탈퇴 시 유의사항</h4>
							<p>
								* 회원탈퇴를 위해선 아래 2가지 조건 확인이 필요합니다.<br><br>
								-판매 또는 구매가 진행중인 상품이 없어야 합니다. <br>
								-회원 탈퇴 시 보유하고 계신 쿠폰과 포인트는 즉시 소멸되며, <br>
								동일한 아이디로 재가입 하더라도 복원되지 않습니다.
							</p>
						</div>
						<div class="card__notify--duration">
							<h4>탈퇴회원 회원정보 보존기간</h4>
							<p>
								* 회원탈퇴가 완료되더라도 판/구매자의 권익을 보호하기 위해 다음과<br>
								같이 일정기간 회원정보가 보존됨을 알려드립니다. <br><br>
								* 탈퇴회원의 개인정보 보관여부는 거래내역의 유무에 따라 달라집니다. <br><br>
								- 거래내역 없음 : 임의해지를 방지하기 위해 이용계약 종료 후 6개월 간 보관 후 삭제<br>
								- 거래내역 있음 : 상법에 따라 경매 낙찰내역 보존 필요에 따라 <br> 
								아이디와 함께 기본정보는 5~10년간 보관
							</p>
						</div>
					</div>
					
				</div>
				
				<div class="secession__container">
					<p>현재 비밀번호를 입력하고 탈퇴하기를 누르시면 위 내용에 동의하는 것으로 간주되고 탈퇴 처리가 진행됩니다.</p>
					<input id="pw" class="secession__password" type="password" placeholder="현재 비밀번호">
					<button id="secession-btn" class="secession-btn">탈퇴하기</button>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		const secession-btn = document.getElementById('secession-btn');
		
		secession-btn.addEventListener('click', (e) => {
			
		})
	</script>
</body>
</html>