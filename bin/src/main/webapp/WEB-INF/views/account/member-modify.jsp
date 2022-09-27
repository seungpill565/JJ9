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
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
	<h1 class="mypage-name">${sessionScope.member_name }님 반갑습니다.</h1>
	<div class="mypage">
		<div class="category__container">
			<ul class="cate-container__ul">
				<li><h2>회원정보수정</h2></li>
				<li><a href="/jj9/account/sell-talent">판매재능관리</a></li>
				<li><a href="/jj9/account/purchase-history">구매재능내역</a></li>
				<li><a href="/jj9/insert">재능등록하기</a></li>
				<li><a href="/jj9/insertRequest">재능의뢰등록</a></li>
				<li><a href="/jj9/account/note">쪽지관리</a></li>
				<li><a href="/jj9/account/add-coupon">쿠폰등록</a></li>
				<li><a href="/jj9/account/inquiry">1:1 문의</a></li>
				<li style="background-color: rgb(230, 70, 70);"><a style="color: white;" href="/jj9/account/member-modify">회원정보수정</a></li>
				<li><a href="/jj9/account/secession">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="thispage__main">
			<div class="main__container">
				<h2 class="main-container__title">회원정보수정</h2>
				<div class="container__card">
						
					<div class="tab__container">
						<div>
							<input type="radio" id="modify_mem_tab" class="tab mem-tab" name="modify_radio" onclick="modify_chk(1)" checked="checked" />
							<label for="modify_mem_tab" class="mem-label">회원정보 수정</label>
						</div>
						<div>
							<input type="radio" id="modify_pw_tab" class="tab pw-tab" name="modify_radio" onclick="modify_chk(2)">
							<label for="modify_pw_tab" class="pw-label">비밀번호 변경</label>
						</div>
					</div>
					
					<div id="member-form" class="form__container form__container--member">
						<div>
							<label for="name">이름</label><br>
							<input id="name" type="text" value="${member.member_name }">
						</div>
						
						<div>
							<label for="nickName">별명</label><br>
							<input id="nickName" type="text" value="${member.member_nickName }">
						</div>
						
						<div>
							<label for="email">이메일</label><br>
							<input id="email" class="readonly" type="email" value="${member.member_email }" readonly>
						</div>
						
						<div>
							<label for="phoneNum">전화번호</label><br>
							<input id="phoneNum" type="phone" value="${member.member_phoneNum }">
						</div>
						
						<div>
							<label for="point">포인트</label><br>
							<input id="point" class="readonly" type="text" value="${member.member_point }" readonly>
						</div>
						
						<div>
							<label for="birthday">생일</label><br>
							<input id="birthday" type="date" value="${member.member_birthday }">
						</div>
						
						
						<div>
							<button id="submitBtn1" class="submit-btn">수정하기</button>
						</div>
						
					</div>
					
					<div id="password-form" class="form__container form__container--password" style="display: none">
						<div>
							<label for="pw">현재 비밀번호</label><br>
							<input id="pw" type="password">
						</div>
						<div>
							<label for="change-pw">비밀번호 변경</label><br>
							<input id="change-pw" type="password">
						</div>
						<div>
							<label for="change-rpw">비밀번호 재입력</label><br>
							<input id="change-rpw" type="password">
						</div>
						
						<button id="submitBtn2" class="submit-btn">비밀번호 변경</button>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		function modify_chk(num) {
			if (num == '1') {
				document.getElementById("password-form").style.display = "none";
				document.getElementById("member-form").style.display = "";	
			} else {
				document.getElementById("member-form").style.display = "none";
				document.getElementById("password-form").style.display = "";
			}
		}
		
		// 제출 버튼, submitBtn1: member 수정을 제출, submitBtn2: pw 변경을 제출
		const submitBtn1 = document.getElementById("submitBtn1");
		const submitBtn2 = document.getElementById("submitBtn2");
		
		// 회원정보 수정 input 값들
		const m_name = document.getElementById("name");
		const m_nickName = document.getElementById("nickName");
		const m_email = document.getElementById("email");
		const m_phone = document.getElementById("phoneNum");
		const m_point = document.getElementById("point");
		const m_birthday = document.getElementById("birthday");
		
		// 이벤트 - member name, nickName, email, phone, point, birthday
		submitBtn1.addEventListener('click', (e) => {
			
			name = m_name.value;
			nickName = m_nickName.value;
			email = m_email.value;
			phone = m_phone.value;
			point = m_point.value;
			birthday = m_birthday.value;
			
			console.log(name);
			
			param={
					"name" : name, 
					"nickName" : nickName, 
					"email" : email,
					"phone" : phone,
					"point" : point,
					"birthday" : birthday
			};
			
			$.ajax({
				type: "post",
				url: "member-update",
				data: param,
				success: function(result) {
					let resultText = null;
					if (result == 1) {
						resultText = '수정 되었습니다.';
						alert(resultText); 
						location.href = "mypage";
					} else {
						resultText = '예기치 않은 오류가 발생하였습니다. 개발자 실수';
						alert(resultText);
					}
				}
			});	
		})
		
		const password = document.getElementById("pw");
		const change_pw = document.getElementById("change-pw");
		const change_rpw = document.getElementById("change-rpw");
		
		submitBtn2.addEventListener('click', (e) => {
			
			pw = password.value;
			cpw = change_pw.value;
			crpw = change_rpw.value;
			
			param={"password_original" : pw, "change_password" : cpw, "change_repassword" : crpw};
			
			$.ajax({
				type: "post",
				url: "password-update",
				data: param,
				success: function(result) {
					console.log(result);
					let resultText = null;
					if (result == 1) {
						resultText = "비밀번호가 변경되었습니다.";
						alert(resultText); 
						location.href = "mypage";
					} else if (result == 0) {
						resultText = "controller 로부터 돌아왔으나 뭔가 잘 안됨";
						alert(resultText); 
					} else if (result == -1) {
						resultText = "입력한 비밀번호가 현재 계정의 비밀번호와 일치하지 않습니다.\n다시 시도해주세요"
						alert(resultText); 
					} else if (result == -2) {
						resultText = "변경할 비밀번호와 재입력 비밀번호가 일치하지 않습니다.\n다시 시도해주세요"
						alert(resultText); 
					}
				}
			});	
		})
	</script>
	<script src="/jj9/resources/js/autoHypen.js"></script>
</body>
</html>