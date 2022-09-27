<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jj9 - 재능의뢰등록</title>
<link rel="stylesheet" href="/jj9/resources/css/mypage-category.css">
<link rel="stylesheet" href="/jj9/resources/css/insertRequest.css">
</head>
<body>
<%@ include file="../include/menu.jsp" %>
	<h1 class="mypage-name">${sessionScope.member_name }님의 마이페이지</h1>
	
	<div class="mypage">
		<div class="mypage__category">
			<div class="category__container">
				<ul class="cate-container__ul">
					<li><h2>재능의뢰등록</h2></li>
					<li><a href="/jj9/account/sell-talent">판매재능관리</a></li>
					<li><a href="/jj9/account/purchase-history">구매재능내역</a></li>
					<li><a href="/jj9/insert">재능등록하기</a></li>
					<li style="background-color: rgb(230, 70, 70);"><a style="color: white;" href="/jj9/insertRequest">재능의뢰등록</a></li>
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
				<h2 class="main-container__title">재능의뢰등록</h2>
				<div class="container__card">
		
					<form action="./insertRequest" method="POST">
						<div class="form__container">
							<div>
								<label for="select-cate-main">카테고리</label><br>
								<select 
									id="select-cate-main" 
									class="select-cate-main"
									name="cate-main"
								>
									<option value="null">카테고리 선택</option>
									<c:forEach items="${mainCates }" var="cate">
										<option value="${cate.cate_main }">${cate.cate_main }</option>
									</c:forEach>
								</select>
								<select 
									id="select-cate-sub" 
									class="select-cate-sub"
									name="cate-sub"
								>
									<option value="null">세부 카테고리 선택</option>
								</select>
							</div>
							
							<div>
								<label for="trequest_title">제목</label><br>
								<input id="trequest_title" type="text" name="trequest_title"/>
							</div>
							
							<div>
								<label for="trequest_budget">예산</label><br>
								<input type="number" name="trequest_budget"/>
							</div>
							
							<div>
								<label for="request-deadline">마감일</label> <br>
								<input type="date" name="trequest_deadline" id="request-deadline">
							</div>
							
							<div>
								<label for="detail-contents">상세내용</label><br> 
								<textarea name="" id="detail-contents" cols="30" rows="10"></textarea>
								<!-- <input type="text" name="trequest_content"/>  --><br>
								<input type="hidden" value="1" name="member_id"/>
							</div>
							<button id="submit" class="submit-btn" type="submit">올리기</button>
						</div>
					</form>
					
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="../footer.jsp" %>
	<script src="/jj9/resources/js/insertRequest.js"></script>
	
	<script>
		// 날짜 default 값을 오늘 날짜로 설정
		document.getElementById('request-deadline').value = new Date().toISOString().substring(0, 10);
	</script>
</body>
</html>