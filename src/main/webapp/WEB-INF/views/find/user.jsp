<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<link rel="stylesheet" href="/jj9/resources/css/find-user.css">
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
	<div class="container">
		<h2 class="title">ID/PW 찾기</h2>
		<p class="description">
			회원가입에서 본인인증된 이메일만 비밀번호 찾기가 가능합니다. <br>
			해당 계정에서 문제가 발생한 경우 고객센터로 상담해주세요 :D
		</p>
	
		<div class="tab__container">
			<div>
				<input type="radio" id="searchId_tab" class="tab id-tab" name="search_radio" onclick="search_chk(1)" checked="checked" />
				<label for="searchId_tab" class="id-label">아이디 찾기</label>
			</div>
			<div>
				<input type="radio" id="searchPw_tab" class="tab pw-tab" name="search_radio" onclick="search_chk(2)">
				<label for="searchPw_tab" class="pw-label">비밀번호 찾기</label>
			</div>	
		</div>
		
		<div id="searchId_form" class="form__container">
			<div class="form-group">
				<label for="inputName">이름</label><br>
				<input 
					type="text" 
					id="inputName" 
					class="container__input container__input--name"
					name="inputName" 
					placeholder="ex) 홍길동"
				/>
			</div>
			<div class="form-group">
				<label for="inputPhone">휴대폰번호</label><br>
				<input 
					type="text" 
					id="inputPhone"
					class="container__input container__input--phone" 
					name="inputPhone" 
					placeholder="ex) 010-1234-1234"
				/>
			</div>
			<div class="form-group form-etc">
				<a href="${pageContext.request.contextPath }/main">취소</a>
				<button id="submitBtn1" type="button">확인</button>
			</div>
		</div>
		
		<div id="searchPw_form" class="form__container" style="display: none">
			<div class="form-group">
				<label for="inputId">아이디</label><br>
				<input 
					type="text" 
					id="inputId"
					class="container__input container__input--id" 
					name="inputId" 
					placeholder="ex) godmisu"
				/>
			</div>
			<div class="form-group">
				<label for="inputEmail">이메일</label><br>
				<input 
					type="email" 
					id="inputEmail" 
					class="container__input container__input--email"
					name="inputEmail" 
					placeholder="ex) E-mail@gmail.com"
				/>
			</div>
			<div class="form-group form-etc">
				<a href="${pageContext.request.contextPath}">취소</a>
				<button id="submitBtn2" type="button">확인</button>
			</div>
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
					if (result == -1) {
						resultText = "공백이 들어갈 수 없습니다. 다시 시도해주세요"
					} else if (result == 0) {
						resultText = "조회되는 아이디가 없습니다. 다시 시도해주세요";
					} else if (result == 1) {
						resultText = "본인인증이 확인된 이메일로 임시 비밀번호를 전송했습니다.\n임시 비밀번호를 통해 로그인 해주세요."
					}
					alert(resultText); 
				}
			});	
		})
		
		
	</script>
</body>
</html>