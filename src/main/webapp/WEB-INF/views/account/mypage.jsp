<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jj9 - 재능구조대</title>
<link rel="stylesheet" href="/jj9/resources/css/mypage-category.css">
<body>
<%@ include file="../include/menu.jsp" %>
	<h1 class="mypage-name">${sessionScope.member_name }님의 마이페이지</h1>
	<div class="mypage">
		<div class="mypage__category">
			<div class="category__container">
				<ul class="cate-container__ul">
					<li><h2>마이 페이지</h2></li>
					<li><a href="./shopping-cart">장바구니</a></li>
					<li><a href="./purchase-history">구매내역</a></li>
					<li><a href="./note">쪽지관리</a></li>
					<li><a href="./add-coupon">쿠폰등록</a></li>
					<li><a href="./member-modify">회원정보수정</a></li>
					<li><a href="./secession">회원탈퇴</a></li>
				</ul>
			</div>
		</div>
		
		<div class="thispage__main">
			<div class="main__container">
				<h2 class="main-container__title">마이 페이지</h2>
				<div class="container__card--profile">
					<p>프로필</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>