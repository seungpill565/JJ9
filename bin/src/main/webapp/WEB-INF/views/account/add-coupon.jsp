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
				<li><a href="/jj9/account/sell-talent">판매재능관리</a></li>
				<li><a href="/jj9/account/purchase-history">구매재능내역</a></li>
				<li><a href="/jj9/insert">재능등록하기</a></li>
				<li><a href="/jj9/insertRequest">재능의뢰등록</a></li>
				<li><a href="/jj9/account/note">쪽지관리</a></li>
				<li style="background-color: rgb(230, 70, 70);"><a style="color: white;" href="/jj9/account/add-coupon">쿠폰등록</a></li>
				<li><a href="/jj9/account/inquiry">1:1 문의</a></li>
				<li><a href="/jj9/account/member-modify">회원정보수정</a></li>
				<li><a href="/jj9/account/secession">회원탈퇴</a></li>
			</ul>
		</div>
		
		<div class="thispage__main">
			<div class="main__container">
				
				<h2 class="main-container__title">내쿠폰 리스트</h2>
				<c:choose>
			  <c:when test="${coupon eq '1' }">
			  	<h2>보유하신 쿠폰이 없습니다.</h2>
			  	 </c:when> 
				  	  <c:otherwise>
				  	  		<table id="table" border="1">
				  	  			<thead>
				  	  				<th width="200" style="background-color: #E84646;color: white;"> 쿠폰 이름 </th>
				  	  				<th width="150" style="background-color: #E84646;color: white;"> 만료일 </th>
				  	  				<th width="150" style="background-color: #E84646;color: white;"> 할인율 </th>
				  	  			</thead>
				  	  			<tbody>
				  	  				<c:forEach items="${coupon }" var="coupon">
					  	  				<tr>
					  	  					<td>${coupon.coupon_name }</td>
					  	  					<td>${coupon.coupon_period }</td>
					  	  					<td>${coupon.discount_percent }%</td>					  	  							  	  														  	  									  	  		
					  	  				</tr>	
				  	  				</c:forEach>
				  	  			</tbody>
				  	  		</table>	
				  	  	</c:otherwise>			
			  	  </c:choose>	
			  	  <button id="window-button">
				  	<a href="../coupon/registration"
					 onclick="window.open(this.href,'팝업창','width = 490, height = 500, top = 100, left = 450, location = no,tatus=no,toolbar=no,scrollbars=no');return false;">쿠폰 등록하기</a>
			      </button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>