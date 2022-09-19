<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jj9 - 쿠폰등록</title>
<link rel="stylesheet" href="/jj9/resources/css/mypage-category.css">
</head>
<body>
<%@ include file="../include/menu.jsp" %>
	<h1 class="mypage-name">${sessionScope.member_name }님 반갑습니다.</h1>
	<div class="mypage">
		<div class="category__container">
			<ul class="cate-container__ul">
				<li><h2>쿠폰 등록</h2></li>
				<li><a href="./sell-talent">판매재능관리</a></li>
				<li><a href="./purchase-history">구매재능내역</a></li>
				<li><a href="./note">쪽지관리</a></li>
				<li style="background-color: rgb(230, 70, 70);"><a style="color: white;" href="./add-coupon">쿠폰등록</a></li>
				<li><a href="./inquiry">1:1 문의</a></li>
				<li><a href="./member-modify">회원정보수정</a></li>
				<li><a href="./secession">회원탈퇴</a></li>
			</ul>
		</div>
		
		<div class="thispage__main">
			<div class="main__container">
				<h2 class="main-container__title">쿠폰 등록</h2>
				<div class="container__card">
					<p>쿠폰 등록</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>