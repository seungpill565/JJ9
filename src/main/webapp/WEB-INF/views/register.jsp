<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jj9 회원가입 페이지</title>
<style>
 /* 사용자의 textarea 사이즈 수정을 막습니다. */
.noresize {
	resize: none;
}
</style>
</head>
<body>

	<h1> 회원가입 페이지 </h1>
	<!-- 이름, 별명, 아이디, 비번, 재입력, 이메일, 전화번호, 생년월일, 자기소개 -->
	<form id="register-form" action="register" method="POST">
		<label for="name">이름</label> <br>
		<input id="name" name="member_name" type="text" placeholder="고객님의 성함을 입력하세요" /><br>
		
		<label for="nickName">별명</label><br>
		<input id="nickName" name="member_nickName" type="text" placeholder="사이트 내에서 사용할 별명을 입력하세요" /><br>
	
		<label for="ID">아이디</label><br>
		<input id="ID" name="member_id" type="text" placeholder="사용할 아이디를 입력하세요" /> 
		<button id="overlappedID" type="button">중복확인</button> </br>
		<!-- type을 button으로, submit이 아래 회원가입 submit 버튼과 혼재되지 않게 함, ajax 처리 -->
		
		<label for="pw">비밀번호</label><br>
		<input id="pw" name="member_password" type="password" placeholder="비밀번호를 입력하세요" /> </br>
		
		<label for="rpw">비밀번호 재입력</label><br>
		<input id="rpw" name="member_rePassword" type="password" placeholder="비밀번호 재확인"> </br>
		
		<label for="email">이메일</label><br>
		<input id="email" name="member_email" type="email" placeholder="이메일을 입력하세요"/><br>
		
		<label for="phoneNum">전화번호</label><br>
		<input id="phoneNum" type='tel' name='phone1' />-
        <input id="phoneNum" type='tel' name='phone2' />-
        <input id="phoneNum" type='tel' name='phone3' /> <br>
        
        <label for="birthday">생년월일</label><br>
		<input id="birthday" type="date" name="member_birthday" value="2022-01-01"/><br>
		        
		<label for="comments">자기소개</label><br>
		<textarea 	id="comments" 
					class="noresize"
					rows="10" cols="60"
					form="register-form" 
					name="member_comments"
					placeholder="판매자 글에 올라가는 자기소개란 입니다. (선택)">
		</textarea><br>
		
		<input id="submit_btn" type="submit" value="회원가입">
	</form>
	
	<script src="/jj9/resources/js/overlapChk.js"></script>
	
</body>
</html>