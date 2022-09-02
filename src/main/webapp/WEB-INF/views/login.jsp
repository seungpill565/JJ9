<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jj9 로그인 페이지</title>
</head>
<body>
<%@ include file="./include/menu.jsp" %>

	<h1> 로그인 페이지 </h1>
	
	<form action="login" method="POST">
		<label for="ID">아이디</label><br>
		<input id="ID" name="id" type="text" placeholder="아이디를 입력하세요" /> </br>
		<label for="ID">비밀번호</label><br>
		<input id="PW" name="password" type="password" placeholder="비밀번호를 입력하세요" /> </br>
		<input type="submit" value="로그인"> <br>
		<a href="idsearch">아이디 찾기</a>
		<a href="pwsearch">비밀번호 찾기</a><br>
		<a href="register">아이디가 없으신가요? 회원가입</a>
	</form>
	
</body>
</html>