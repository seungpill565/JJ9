<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jj9 - 판매재능관리</title>
<link rel="stylesheet" href="/jj9/resources/css/mypage-category.css">
</head>
<body>
<%@ include file="../include/menu.jsp" %>
	<h1 class="mypage-name">${sessionScope.member_name }님 반갑습니다.</h1>
	<div class="mypage">
		<div class="category__container">
			<ul class="cate-container__ul">
				<li><h2>판매재능관리</h2></li>
				<li style="background-color: rgb(230, 70, 70);"><a style="color: white;" href="../account/sell-talent">판매재능관리</a></li>
				<li><a href="../account/purchase-history">구매재능내역</a></li>
				<li><a href="../account/note">쪽지관리</a></li>
				<li><a href="../account/add-coupon">쿠폰등록</a></li>
				<li><a href="../account/inquiry.jsp">1:1 문의</a></li>
				<li><a href="../account/member-modify">회원정보수정</a></li>
				<li><a href="../account/secession">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="thispage__main">
			<h1 class="main-container__title">구매자 리스트</h1>
		<c:choose>
			  <c:when test="${member eq '1' }">
			  	<h2>구매자가 없습니다.</h2>
			  	 </c:when> 
				  	  <c:otherwise>
				  	  		<table id="table" border="1">
				  	  			<thead>
				  	  				<th width="150" style="background-color: #E84646;color: white;"> 결제번호 </th>
				  	  				<th width="150" style="background-color: #E84646;color: white;"> 재능이름 </th>
				  	  				<th width="150" style="background-color: #E84646;color: white;"> 가격(할인 미적용) </th>
				  	  				<th width="150" style="background-color: #E84646;color: white;"> 가격(할인 적용) </th>
				  	  				<th width="150" style="background-color: #E84646;color: white;"> 구매자 이름 </th>
				  	  				<th width="150" style="background-color: #E84646;color: white;"> 구매자 닉네임 </th>
				  	  				<th width="150" style="background-color: #E84646;color: white;"> 구매자 전화번호 </th>
				  	  				<th width="150" style="background-color: #E84646;color: white;"> 구매자 이메일 </th>
				  	  				<th width="150" style="background-color: #E84646;color: white;"> 쪽지 보내기</th>
				  	  			</thead>
				  	  			<tbody>
				  	  				<c:forEach items="${member }" var="member">
					  	  				<tr>
					  	  					<td>${member.pay_id }</td>
					  	  					<td>${member.talent_title }</td>
					  	  					<td>${member.pay_original_money }</td>
					  	  					<td>${member.pay_money }</td>
					  	  					<td>${member.member_name }</td>
					  	  					<td>${member.member_nickName }</td>
					  	  					<td>${member.member_phoneNum }</td>
					  	  					<td>${member.member_email }</td>
					  	  					<td>
					  	  						<button id="button">
					  	  							<a href="../message/${member.talent_id }"
					  	  					onclick="window.open(this.href,'팝업창','width = 490, height = 500, top = 100, left = 450, location = no,tatus=no,toolbar=no,scrollbars=no');return false;">
					  	  					쪽지 보내기</a>
					  	  						</button>
					  	  					</td>					  	  		
					  	  				</tr>	
				  	  				</c:forEach>
				  	  			</tbody>
				  	  		</table>	
				  	  	</c:otherwise>			
			  	  </c:choose>
				</div>
			</div>
		</div>
	</div>
</body>
</html>