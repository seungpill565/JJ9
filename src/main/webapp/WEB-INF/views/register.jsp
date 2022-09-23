<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jj9 회원가입 페이지</title>
<link rel="stylesheet" href="/jj9/resources/css/register.css">
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

// 아이디 중복 확인
const RegExp = /^[a-zA-z0-9]{4,12}$/;

$(function() {
	$("#overlappedID").click(function() {
		id = $("#ID").val(); // 태그에 입력한 value
		param={"ID" : id};
		if (id == "") {
			alert("공백인 아이디로 중복확인을 할 수 없습니다.")
		} else {
			$.ajax({
				type: "post",
				url: "idCheck",
				data: param,
				success: function(result) { //login_result.jsp 에 출력된 내용 (responseText)
					console.log(result);
					let resultText = null;
					if (!RegExp.test(id)) {
						resultText = "ID는 4~12자의 영문 대소문자와 숫자로만 입력하여 주세요.";
					} else if (result == -1) {
						resultText = "아이디가 중복되었습니다. 다시 시도해주세요"
					} else if (result == 0) {
						resultText = "사용 가능한 아이디입니다";
					} 
					alert(resultText); 
				}
			});		
		}
	})
});
</script>
</head>
<body>
<%@ include file="./include/menu.jsp" %>
	<!-- 이름, 별명, 아이디, 비번, 재입력, 이메일, 전화번호, 생년월일, 자기소개 -->
	<form id="register-form" class="sign-up__form" action="register" method="POST">
			<h1 class="sign-up__title"> sign up </h1>
		<div class="form__container">
				<div class="container__left">
					<div class="container__input--name sign-up__container">
						<label for="name">이름</label><br>
						<input 
							id="name" 
							class="container__input--tags"
							name="member_name" 
							type="text" 
							placeholder="고객님의 성함을 입력하세요"
						/>				
					</div>
					
					<div class="container__input--nickName sign-up__container">
						<label for="nickName">별명</label><br>
						<input 
							id="nickName" 
							class="container__input--tags"
							name="member_nickName" 
							type="text" 
							placeholder="사이트 내에서 사용할 별명을 입력하세요" 
						/>
					</div>
					
					<div class="container__input--id sign-up__container">
						<label for="ID">아이디</label><br>
						<input 
							id="ID"
							class="container__input--tags input--with-btn"
							name="member_id" 
							type="text" 
							onfocus="idModifying(this)" 
							onblur="isIdValid(this)" 
							placeholder="사용할 아이디를 입력하세요"
						/>
						<button id="overlappedID" type="button">중복확인</button>				
					</div>
					
					<div class="container__input--password sign-up__container">
						<label for="pw">비밀번호</label><br>
						<input 
							id="pw" 
							class="container__input--tags"
							name="member_password" 
							type="password" 
							placeholder="비밀번호를 입력하세요"
						/>				
					</div>
					
					<div class="container__input--rePassword sign-up__container">
						<label for="rpw">비밀번호 재입력</label><br>
						<input 
							id="rpw"
							class="container__input--tags" 
							name="member_rePassword" 
							type="password" 
							placeholder="비밀번호 재확인"
						/>
					</div>
				</div>
			
				<div class="container__right">
					<div class="container__input--email sign-up__container">
						<label for="email">이메일</label><span class="required-s">*</span><span class="required-t">필수</span><br>
						<input 
							id="email" 
							class="container__input--tags input--with-btn"
							name="member_email" 
							type="email" 
							placeholder="이메일을 입력하세요, ex) Email@gmail.com"
						/>
						<button id="email_check" type="button">본인 인증</button>				
					</div>
					
					<div class="container__input--authNum sign-up__container">
						<label for="authNum">인증 번호</label><br>
						<input 
							id="authNum" 
							class="container__input--tags input--with-btn"
							name="authNum" 
							type="text" 
						/>
						<button id="authNum_check" type="button">확인</button>
					</div>
				
					<div class="container__input--phoneNUm sign-up__container">
						<label for="phoneNum">전화번호</label><span class="required-s">*</span><span class="required-t">필수</span><br>
						<input 
							id="phoneNum" 
							class="container__input--tags"
							type='tel' 
							name='member_phoneNum' 
							placeholder="숫자만 입력하세요"
						/>		
					</div>
		        	
		        	<div class="container__input--birthday sign-up__container">
				        <label for="birthday">생년월일</label><br>
						<input 
							id="birthday"
							class="container__input--tags"
							type="date" 
							name="member_birthday" 
							value="2022-01-01"
						/>    	        	
		        	</div>
		        	
		        	<div class="container__input--comments sign-up__container">
				        <label for="comments">소개말</label><br>
						<textarea
							id="comments"
							name="member_comments"
							class="container__input--tags comments"
							placeholder="내용을 입력해주세요"></textarea>
							
		        	</div>
		       		
				</div>
			</div>
       		<div class="container__submit sign-up__container">
				<input id="submit_btn" class="submit_btn" type="submit" value="회원가입" />		
       		</div>
		
	</form>
	<script type="text/javascript">
	 //아이디, 패스워드 유효성 검사
	
	/* 
		const name_RegExp = /^[가-힣]{2,15}$/; //이름 유효성검사 정규식
		
		const idChkMsg = document.querySelector('#idChkMsg');
		
		function idModifying(id) {
			idChkMsg.style.visibility = 'hidden';
		}
		
		// 아이디 유효성 검사 함수	
		function isIdValid(id) {
			if (!RegExp.test(id.value)) {
				idChkMsg.style.visibility = 'visible';
				idChkMsg.innerText = 'ID는 4~12자의 영문 대소문자와 숫자로만 입력하여 주세요.';
			}
		}
	*/
		
		
		// 이메일 유효성 검사
		const emailBtn = document.getElementById('email_check');
		emailBtn.addEventListener('click', (e) => {
			email = $("#email").val(); // 태그에 입력한 value
			param={"email" : email};
			$.ajax({
				type: "post",
				url: "emailCheck",
				data: param,
				success: function(result) { //login_result.jsp 에 출력된 내용 (responseText)
					console.log(result);
					let resultText = null;
					if (result == 0) {
						resultText = "인증 번호를 전송했습니다. 입력한 이메일에서 확인해주세요";
					} else if (result == -1) {
						resultText = "올바른 이메일 형식이 아닙니다. 다시 시도해주세요";
						$("#email").val('');
					}
					alert(resultText); 
				}
			});	
		});
		
		// 인증번호 확인 버튼
		const authNumBtn = document.getElementById('authNum_check');
		authNumBtn.addEventListener('click', (e) => {
			authNum = $("#authNum").val();
			param={"authNum" : authNum};
			$.ajax({
				type: "post",
				url: "authNumCheck",
				data: param,
				success: function(result) { //login_result.jsp 에 출력된 내용 (responseText)
					console.log(result);
					let resultText = null;
					if (result == 0) {
						resultText = '인증에 성공하였습니다.';
					} else if (result == -1) {
						resultText = '인증에 실패했습니다. 다시 시도해주세요'
						$("#authNum").val('');
					}
					alert(resultText); 
				}
			});	
		})

	</script>
	<script src="/jj9/resources/js/autoHypen.js"></script>
	
</body>
</html>