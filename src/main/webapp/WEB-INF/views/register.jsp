<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jj9 회원가입 페이지</title>
</head>
<body>

	<h1> 회원가입 페이지 </h1>
	
	<form action="register" method="POST">
		<label for="ID">아이디</label><br>
		<input id="ID" type="text" placeholder="아이디를 입력하세요" /> </br>
		<label for="ID">비밀번호</label><br>
		<input id="PW" type="password" placeholder="비밀번호를 입력하세요" /> </br>
		<label for="ID">비밀번호 재입력</label><br>
		<input id="rPW" type="password" placeholder="비밀번호 재확인"> </br>
		<input type="submit" value="회원가입">
	</form>
	
</body>
</html>