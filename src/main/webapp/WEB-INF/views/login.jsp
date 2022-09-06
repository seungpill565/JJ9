<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jj9 로그인 페이지</title>
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

	<h1> 로그인 페이지 </h1>
	
	<form name="form1" method="POST">
		<table border="1" width="400px">
			<tr>
				<td>아이디</td>
				<td><input type="text" id="member_id" name="member_id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="member_password" name="member_password"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" id="btnLogin">로그인</button>
					<c:if test="${message == 'error' }">
						<div style="color:red">
							아이디 또는 비밀번호가 일치하지 않습니다.
						</div>
					</c:if>
					<c:if test="${param.message == 'logout' }">
						<div style="color:red">
							로그아웃되었습니다.
						</div>
					</c:if>
				</td>
			</tr>
		</table>
		<a href="idsearch">아이디 찾기</a>
		<a href="pwsearch">비밀번호 찾기</a><br>
		<a href="register">아이디가 없으신가요? 회원가입</a>
	</form>
	
</body>
</html>