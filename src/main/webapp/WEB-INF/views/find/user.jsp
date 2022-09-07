<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
	<h2>아이디/비밀번호 찾기</h2>
	<p>인증된 이메일만 정보 찾기가 가능합니다 :D</p>
	<div style="display:inline-block">
		<input type="radio" id="search_id" name="search_radio" onclick="search_chk(1)" checked="checked" />
		<label for="search_id">아이디 찾기</label>
	</div>
	<div style="display:inline-block">
		<input type="radio" id="search_pw" name="search_radio" onclick="search_chk(2)">
		<label for="search_pw">비밀번호 찾기</label>
	</div>
	<div id="searchId">
		<div class="form-group">
			<label for="inputName_1">이름</label>
			<div>
				<input type="text" id="inputName" name="inputName" placeholder="ex) 홍길동">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPhone_1">휴대폰번호</label>
			<div>
				<input type="text" id="inputPhone" name="inputPhone" placeholder="ex) 01012341234">
			</div>
		</div>
		<div class="form-group">
			<button id="searchBtn1" type="button" onclick="idSearch">확인</button>
			<a href="${pageContext.request.contextPath }/main">취소</a>
		</div>
	</div>
	<div id="searchPw" style="display: none">
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
			<button id="searchBtn2" type="button" onclick="pwSearch">확인</button>
		<a href="${pageContext.request.contextPath}">취소</a>
		</div>
	</div>
	<script type="text/javascript">
		function search_chk(num) {
			if (num == '1') {
				document.getElementById("searchPw").style.display = "none";
				document.getElementById("searchId").style.display = "";	
			} else {
				document.getElementById("searchId").style.display = "none";
				document.getElementById("searchPw").style.display = "";
			}
		}
	</script>
</body>
</html>