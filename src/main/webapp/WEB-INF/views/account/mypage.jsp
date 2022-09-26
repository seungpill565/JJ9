<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jj9 - 재능구조대</title>
<link rel="stylesheet" href="/jj9/resources/css/category.css?ver=1" />
<link rel="stylesheet" href="/jj9/resources/css/mypage-category.css">
<link rel="stylesheet" href="/jj9/resources/css/footer.css"> 
<body>
<%@ include file="../include/header.jsp" %>
	<div class="mypage">
		<div class="mypage__category">
			<div class="category__container">
				<ul class="cate-container__ul">
					<li><h2>마이 페이지</h2></li>
					<li><a href="/jj9/account/sell-talent">판매재능관리</a></li>
					<li><a href="/jj9/account/purchase-history">구매재능내역</a></li>
					<li><a href="/jj9/insert">재능등록하기</a></li>
					<li><a href="/jj9/insertRequest">재능의뢰등록</a></li>
					<li><a href="/jj9/account/note">쪽지관리</a></li>
					<li><a href="/jj9/account/add-coupon">쿠폰등록</a></li>
					<li><a href="/jj9/account/inquiry">1:1 문의</a></li>
					<li><a href="/jj9/account/member-modify">회원정보수정</a></li>
					<li><a href="/jj9/account/secession">회원탈퇴</a></li>
				</ul>
			</div>
		</div>
		
		<div class="thispage__main">
			<div class="main__container">
				<h2 class="main-container__title">마이 페이지</h2>
				<div class="container__card">
					<p>프로필</p>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>