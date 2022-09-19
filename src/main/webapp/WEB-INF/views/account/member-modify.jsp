<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jj9 - 회원정보수정</title>
<link rel="stylesheet" href="/jj9/resources/css/mypage-category.css">
<link rel="stylesheet" href="/jj9/resources/css/member-modify.css">
</head>
<body>
<%@ include file="../include/menu.jsp" %>
	<h1 class="mypage-name">${sessionScope.member_name }님 반갑습니다.</h1>
	<div class="mypage">
		<div class="category__container">
			<ul class="cate-container__ul">
				<li><h2>회원정보수정</h2></li>
				<li><a href="./sell-talent">판매재능관리</a></li>
				<li><a href="./purchase-history">구매재능내역</a></li>
				<li><a href="./note">쪽지관리</a></li>
				<li><a href="./add-coupon">쿠폰등록</a></li>
				<li><a href="./inquiry">1:1 문의</a></li>
				<li style="background-color: rgb(230, 70, 70);"><a style="color: white;" href="./member-modify">회원정보수정</a></li>
				<li><a href="./secession">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="thispage__main">
			<div class="main__container">
				<h2 class="main-container__title">회원정보수정</h2>
				<div class="container__card">
					<p>회원정보수정</p>
					
						
					<form action="account/dddd">
						<div class="form__container">
							<div>
								<label for="email">이메일</label><br>
								<input id="email" type="email">
							</div>
							
							<div>
								<label for="name">이름</label><br>
								<input id="name" type="text" readonly>
							</div>
							
							<div>
								<label for="nickName">별명</label><br>
								<input id="nickName" type="text">
							</div>
							
							<div>
								<label for="birthday">생일</label><br>
								<input id="birthday" type="date" readonly>
							</div>
							
							<div>
								<input id="submit-btn" type="submit" value="수정하기">
							</div>
							
							<button class="password-btn">패스워드 변경하기</button>
						</div>
					</form>
						
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>