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
				<li style="background-color: rgb(230, 70, 70);"><a style="color: white;" href="/jj9/account/sell-talent">판매재능관리</a></li>
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
		<div class="thispage__main">
		 <h2 class="main-container__title">판매 재능관리</h2>
		<c:choose>
			  <c:when test="${talent eq '1' }">
			  	<h2>판매중인 재능이 없습니다.</h2>
			  	 </c:when> 
				  	  <c:otherwise>
				  	  		<table id="table" border="1" >
				  	  			<thead >
				  	  				<th width="150" style="background-color: #E84646;color: white;"> 판매번호 </th>
				  	  				<th width="200" style="background-color: #E84646;color: white;"> 재능 이름 </th>
				  	  				<th width="150" style="background-color: #E84646;color: white;"> 이미지 </th>
				  	  				<th width="100" style="background-color: #E84646;color: white;"> 재능 등록 날짜 </th>
				  	  				<th width="130" style="background-color: #E84646;color: white;"> 구매자 확인하기 </th>				  	  				
				  	  				<th width="130" style="background-color: #E84646;color: white;"> 삭제 하기 </th>
				  	  			</thead>
				  	  			<tbody>
				  	  				<c:forEach items="${talent }" var="talent">
					  	  				<tr>
					  	  					<td>${talent.talent_id }</td>
					  	  					<td><a href="../purchase/${talent.talent_id }">${talent.talent_title }</a></td>
					  	  					<td><img id="purchase_img" alt="" src="/jj9/resources/images/${talent.talent_image }"></td>					  	  				
					  	  					<td>${talent.talent_date }</td>
					  	  					<td><button id="button"><a href="../sell-talent/${talent.talent_id }">구매자 확인 하기</a></button></td>
					  	  					<td><button id="del-button" value="${talent.talent_id }">삭제 요청하기</button></td>
					  	  				</tr>	
				  	  				</c:forEach>
				  	  			</tbody>
				  	  		</table>	
				  	  	</c:otherwise>			
			  	  </c:choose>			  	 
				</div>
			</div>
			<div>*판매 재능의 수정은 1:1 문의를 의용해 주시기 바랍니다.*</div>
				  <div>*판매 재능을 삭제 할시 데이터 복구가 어렵습니다.*</div>
		</div>
	</div>
	
	 <script>
	 const delbutton = document.getElementById('del-button');
	 delbutton.addEventListener('click',(e)=>{
		 var result = confirm("판매중인 재능을 삭제 하시겠습니까?(복구 불가능 합니다.)");
	        
	        if(result)
	        {
	            location.href = "../del-talent/"+delbutton.value;
	        }
	        

	 });
       
    </script>
</body>
</html>