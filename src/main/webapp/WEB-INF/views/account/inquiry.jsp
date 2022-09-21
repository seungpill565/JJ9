<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jj9 - 1:1 문의</title>
<link rel="stylesheet" href="/jj9/resources/css/mypage-category.css">
<link rel="stylesheet" href="/jj9/resources/css/inquiry.css">
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
	<h1 class="mypage-name">${sessionScope.member_name }님 반갑습니다.</h1>
	<div class="mypage">
		<div class="category__container">
			<ul class="cate-container__ul">
				<li><h2>1:1 문의</h2></li>
				<li><a href="./sell-talent">판매재능관리</a></li>
				<li><a href="./purchase-history">구매재능내역</a></li>
				<li><a href="./note">쪽지관리</a></li>
				<li><a href="./add-coupon">쿠폰등록</a></li>
				<li style="background-color: rgb(230, 70, 70);"><a style="color: white;" href="./inquiry">1:1 문의</a></li>
				<li><a href="./member-modify">회원정보수정</a></li>
				<li><a href="./secession">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="thispage__main">
			<div class="main__container">
				<h2 class="main-container__title">1:1 문의</h2>
				<div class="container__card">
				
					<div class="tab__container">
						<div>
							<input type="radio" id="inquiry_tab" class="tab inquiry-tab" name="inquiry_radio" onclick="inquiry_chk(1)" checked="checked" />
							<label for="inquiry_tab" class="inquiry-label">1:1 문의하기</label>
						</div>
						<div>
							<input type="radio" id="faq_tab" class="tab faq-tab" name="inquiry_radio" onclick="inquiry_chk(2)">
							<label for="faq_tab" class="faq-label">문의 내역</label>
						</div>
					</div>
	
					<div id="inquiry-form" class="inquiry__container">
						<div class="container__select">
							<label for="inquiry" class="container__select--label">분류 기준</label>
							<select id="inquiry" class="container__select--select" name="inquiry">
								<option value="">========== 선택 ==========</option>
								<option value="주문 관련 문제">주문 관련 문제</option>
								<option value="스팸이나 악용 또는 불법 신고하기">스팸이나 악용 또는 불법 신고하기</option>
								<option value="나의 계정 문제">나의 계정 문제</option>
								<option value="판매자가 연락이 안됨">판매자가 연락이 안됨</option>
								<option value="구매자가 연락이 안됨">구매자가 연락이 안됨</option>
								<option value="제휴 문의">제휴 문의</option>
								<option value="직거래 신고">직거래 신고</option>
								<option value="버그 신고">버그 신고</option>
								<option value="기타 문의">기타 문의</option>
							</select>
						</div>
						
						<div class="container__title">
							<label for="title">제목</label><br>
							<input 
								id="title" 
								class="container__title--input"
								type="text"
							/>
						</div>
						
						<div class="container__content">
							<label for="content">내용</label><br>
							<textarea 
								id="content" 
								class="container__content--textarea"
								rows="10" 
								cols="60"></textarea>
							<p id="text-cnt" class="text-count">(0 / 500)</p>
						</div>
						<div class="container__submit--btn">
							<button id="inquiry-btn" class="inquiry-btn">문의하기</button>
						</div>
					</div>
					
					<div id="faq-form" style="display: none;">
						<div>
							<h1>문의</h1>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<script>
		// 탭 버튼
		function inquiry_chk(num) {
			if (num == '1') {
				document.getElementById("faq-form").style.display = "none";
				document.getElementById("inquiry-form").style.display = "";	
			} else {
				document.getElementById("inquiry-form").style.display = "none";
				document.getElementById("faq-form").style.display = "";
			}
		}
	
		// 글자 수 제한
		$(document).ready(function() {         
			$('#content').on('keyup', function() {             
				$('#text-cnt').html("("+$(this).val().length+" / 500)");               
				if($(this).val().length > 500) {                 
					$(this).val($(this).val().substring(0, 500));                 
					$('#text-cnt').html("(500 / 500)");             
				}         
			});     
		});    
		
		// ajax 전송
		const inquiryBtn = document.getElementById('inquiry-btn');
		
		inquiryBtn.addEventListener('click', (e) => {
			
			const inquiry = document.getElementById('inquiry');
			const title = document.getElementById('title');
			const content = document.getElementById('content');
			
			m_inquiry = inquiry.value;
			m_title = title.value;
			m_content = content.value;
			
			param={"inquiry" : m_inquiry, "title" : m_title, "content" : m_content};
			$.ajax({
				type: "post",
				url: "inquiry",
				data: param,
				success: function(result) {
					let resultText = null;
					if (result == 0) {
						resultText = 'FaqController 에서 돌아왔습니다.';
					} else if (result == -1) {
						resultText = '분류기준이 존재하지 않습니다.\n분류 기준을 선택 후 다시 시도해주세요';
					}
					alert(resultText);
				}
			});
			
		})
	</script>
	
</body>
</html>