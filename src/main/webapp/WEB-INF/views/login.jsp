<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jj9 로그인 페이지</title>
<link rel="stylesheet" href="/jj9/resources/css/login.css">
<!-- mongwoon font-awesome free-kit -->
<script src="https://kit.fontawesome.com/d7134871a2.js" crossorigin="anonymous"></script>
<!-- jquery -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function() {
	$("#btnLogin").click(function() {
		var member_id =$("#member_id").val(); // 태그에 입력한 값
		var member_password = $("#member_password").val();
		
		if(member_id == "") {
			alert("아이디를 입력하세요");
			$("#member_id").focus(); // focus : 입력 커서 이동시키고 함수를 정렬시킴
			return;
		}
		if(member_password == ""){
			alert("비밀번호를 입력하세요");
			$("#member_password").focus();
			return;
		}
		document.form1.action = "/jj9/login_check";
		document.form1.submit();
	})
})
</script>
</head>
<body>
<%@ include file="./include/menu.jsp" %>

	<div class="form__container">
		<div class="container__image">
			<h1 class="container__image--title">Welcome!</h1>
			<p class="container__image--description">
				jj9 - 재능구조대 <br><br>
				사이트에 오신 것을 환영합니다! <br><br>
				당신의 재능을 기다리고 있습니다.
			</p>
		</div>
		<div class="container__login">
		<h1 class="description"> Sign In </h1>
			<form name="form1" method="POST">
				<table class="auth-form">
					<tr>
						<td class="auth-form__label--id">
							<i class="fa-sharp fa-solid fa-user"></i>
						</td>
						<td>
							<input 
								type="text" 
								id="member_id" 
								class="auth-form__input auth-form__id" 
								name="member_id"
								placeholder="아이디를 입력하세요"
							/>
						</td>
					</tr>
					<tr>
						<td class="auth-form__label--pw">
							<i class="fa-sharp fa-solid fa-key"></i>
						</td>
						<td>
							<input 
								type="password" 
								id="member_password" 
								class="auth-form__input auth-form__password" 
								name="member_password"
								placeholder="비밀번호를 입력하세요"
							/>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button 
								type="button" 
								id="btnLogin" 
								class="auth-form__button--login"> 로그인
							</button>
							<c:if test="${message == 'error' }">
								<div class="auth-form__label">
									<span class="auth-form__label--error">아이디 또는 비밀번호가 일치하지 않습니다.</span>
								</div>
							</c:if>
							<c:if test="${param.message == 'logout' }">
								<div class="auth-form__label">
									<span class="auth-form__label--logout">로그아웃되었습니다.</span>
								</div>
							</c:if>
						</td>
					</tr>
				</table>
				<div class="auth-form__link--etc">
					<a href="find/user">
						<span class="auth-form__find--user">아이디/비밀번호 찾기</span>
					</a> 
					<span class="auth-form__line--division"> | </span> 
					<a href="register">
						<span class="auth-form__register">회원가입</span>
					</a>
				</div>
			</form>
		</div>
	</div>
	
</body>
</html>