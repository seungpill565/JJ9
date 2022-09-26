<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jj9 - 쪽지관리</title>
<link rel="stylesheet" href="/jj9/resources/css/category.css?ver=1" />
<link rel="stylesheet" href="/jj9/resources/css/mypage-category.css">
<link rel="stylesheet" href="/jj9/resources/css/footer.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="../include/header.jsp" %>
	<div class="mypage">
		<div class="category__container">
			<ul class="cate-container__ul">
				<li><h2>쪽지관리</h2></li>
				<li><a href="/jj9/account/sell-talent">판매재능관리</a></li>
				<li><a href="/jj9/account/purchase-history">구매재능내역</a></li>
				<li><a href="/jj9/insert">재능등록하기</a></li>
				<li><a href="/jj9/insertRequest">재능의뢰등록</a></li>
				<li style="background-color: rgb(230, 70, 70);"><a style="color: white;" href="/jj9/account/note">쪽지관리</a></li>
				<li><a href="/jj9/account/add-coupon">쿠폰등록</a></li>
				<li><a href="/jj9/account/inquiry">1:1 문의</a></li>
				<li><a href="/jj9/account/member-modify">회원정보수정</a></li>
				<li><a href="/jj9/account/secession">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="thispage__main">
			<div class="main__container">
				<h2 class="main-container__title" >보낸 쪽지함</h2>
				<c:choose>
			  <c:when test="${resiver eq '1' }">
			  	<h2>보낸 쪽지가 없습니다.</h2>
			  	 </c:when> 
				  	  <c:otherwise>
				  	  		<table id="table" border="1">
				  	  			<thead>
				  	  				<th width="150" style="background-color: #E84646;color: white;"> 제목 </th>
				  	  				<th width="150" style="background-color: #E84646;color: white;"> 수신자 </th>
				  	  				<th width="150" style="background-color: #E84646;color: white;"> 보낸 날짜 </th>
				  	  				<th width="150" style="background-color: #E84646;color: white;"> 내용 확인하기 </th>				
				  	  			</thead>
				  	  			<tbody>
				  	  				<c:forEach items="${resiver }" var="resiver">
					  	  				<tr>
					  	  					<td>${resiver.message_name }</td>
					  	  					<td>${resiver.sender_id }</td>
					  	  					<td>${resiver.message_date }</td>					  	  									  	  		
					  	  					<td>					  	  					
					  	  					<button id="button">
					  	  					<a href="../note?conntent=${resiver.message_content }"
					  	  					onclick="window.open(this.href,'팝업창','width = 490, height = 500, top = 100, left = 450, location = no,tatus=no,toolbar=no,scrollbars=no');return false;">
					  	  					쪽지 내용보기</a>
					  	  					</button>					  	  					
					  	  					</td>					  	  		
									
					  	  				</tr>	
				  	  				</c:forEach>
				  	  			</tbody>
				  	  		</table>	
				  	  	</c:otherwise>			
			  	  </c:choose>
				<h2 class="main-container__title">받은 쪽지함</h2>
			<c:choose>
			  <c:when test="${sender eq '1' }">
			  	<h2>받은 쪽지가 없습니다.</h2>
			  	 </c:when> 
				  	  <c:otherwise>
				  	  		<table id="table" border="1">
				  	  			<thead>
				  	  				<th width="150" style="background-color: #E84646;color: white;"> 제목 </th>
				  	  				<th width="150" style="background-color: #E84646;color: white;"> 발신자 </th>
				  	  				<th width="150" style="background-color: #E84646;color: white;"> 받은 날짜 </th>
				  	  				<th width="150" style="background-color: #E84646;color: white;"> 내용 확인하기 </th>				
				  	  			</thead>
				  	  			<tbody>
				  	  				<c:forEach items="${sender }" var="sender">
					  	  				<tr>
					  	  					<td>${sender.message_name }</td>
					  	  					<td>${sender.resiver }</td>
					  	  					<td>${sender.message_date }</td>
					  	  					<td><button id="button">
					  	  					<a href="../note?conntent=${sender.message_content }"
					  	  					onclick="window.open(this.href,'팝업창','width = 490, height = 500, top = 100, left = 450, location = no,tatus=no,toolbar=no,scrollbars=no');return false;">
					  	  					쪽지 내용보기</a>
					  	  					</button></td>					  	  														  	  									  	  		
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
	<%@ include file="../include/footer.jsp" %>
</body>
</html>