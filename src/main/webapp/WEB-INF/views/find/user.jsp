<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
	<h2>아이디/비밀번호 찾기</h2>
	<p>인증된 이메일만 정보 찾기가 가능합니다 :D</p>
	<div style="display:inline-block">
		<input type="radio" id="searchId_tab" name="search_radio" onclick="search_chk(1)" checked="checked" />
		<label for="search_id">아이디 찾기</label>
	</div>
	<div style="display:inline-block">
		<input type="radio" id="searchPw_tab" name="search_radio" onclick="search_chk(2)">
		<label for="search_pw">비밀번호 찾기</label>
	</div>
	<div id="searchId_form">
		<div class="form-group">
			<label for="inputName">이름</label>
			<div>
				<input type="text" id="inputName" name="inputName" placeholder="ex) 홍길동">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPhone">휴대폰번호</label>
			<div>
				<input type="text" id="inputPhone" name="inputPhone" placeholder="ex) 010-1234-1234">
			</div>
		</div>
		<div class="form-group">
			<button id="submitBtn1" type="button">확인</button>
			<a href="${pageContext.request.contextPath }/main">취소</a>
		</div>
	</div>
	<div id="searchPw_form" style="display: none">
		<div class="form-group">
			<label for="inputId">아이디</label>
			<div>
				<input type="text" id="inputId" name="inputId" placeholder="ex) godmisu">
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail">이메일</label>
			<div>
				<input type="email" id="inputEmail" name="inputEmail" placeholder="ex) E-mail@gmail.com">
			</div>
		</div>
		<div class="form-group">
			<button id="submitBtn2" type="button">확인</button>
		<a href="${pageContext.request.contextPath}">취소</a>
		</div>
	</div>
	<script type="text/javascript">
		function search_chk(num) {
			if (num == '1') {
				document.getElementById("searchPw_form").style.display = "none";
				document.getElementById("searchId_form").style.display = "";	
			} else {
				document.getElementById("searchId_form").style.display = "none";
				document.getElementById("searchPw_form").style.display = "";
			}
		}
		
		// 제출 버튼, submitBtn1: id를 제출, submitBtn2: pw를 제출
		const submitBtn1 = document.getElementById("submitBtn1");
		const submitBtn2 = document.getElementById("submitBtn2");
		
		// input 태그들
			// 아이디 찾기 시 필요한 input 태그들 (이름, 휴대전화 번호를 작성하는 칸)
		const inputName = document.getElementById("inputName");
		const inputPhone = document.getElementById("inputPhone");
		
			// 비밀번호 찾기 시 필요한 input 태그들 (아이디, 이메일을 작서하는 칸)
		const inputId = document.getElementById("inputId");
		const inputEmail = document.getElementById("inputEmail");
		
		// 이벤트
		submitBtn1.addEventListener('click', (e) => {
			name = inputName.value;
			phone = inputPhone.value;
			param={"name" : name, "phone" : phone};
			// 미완...
			$.ajax({
				type: "post",
				url: "findId",
				data: param,
				success: function(result) {
					let resultText = name + '님의 아이디는 [' + result + '] 로 조회되었습니다.';
					if (name == null || name == "" || phone == null || phone == "") {
						resultText = '이름, 전화번호 중 공백이 있습니다. 다시 시도해주세요';
					} else if (result == null || result == "") {
						resultText = '조회되는 아이디가 없습니다. 아이디/전화번호를 다시 입력하거나 \n회원가입을 시도해주세요'
					}
					alert(resultText); 
				}
			});	
		})
		
		submitBtn2.addEventListener('click', (e) => {
			id = inputId.value;
			email = inputEmail.value
			param={"id" : id, "email" : email};
			// 미완...
			$.ajax({
				type: "post",
				url: "updatePw",
				data: param,
				success: function(result) {
					console.log(result);
					let resultText = null;
					if (result == 0) {
						resultText = "본인 인증에 성공하였습니다.";
					} else if (result == -1) {
						resultText = "올바른 이메일 형식이 아닙니다. 다시 시도해주세요"
					}
					alert(resultText); 
				}
			});	
		})
		
		
	</script>
</body>
</html>