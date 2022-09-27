<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="text-align: center">
	<a href="/jj9/main">Main</a>
	<a href="/jj9/list">리스트</a>
	<a href="/jj9/account/mypage">마이페이지</a>
</div>

<c:choose>
		<c:when test="${sessionScope.member_id == null }">
			<div style="text-align: right">
				<a href="/jj9/register">회원가입</a>
				<a href="/jj9/login">로그인</a>
			</div>
		</c:when>
		<c:otherwise>
			<div style="text-align: right">
				${sessionScope.member_name }님이 로그인 중입니다.
				<a href="/jj9/logout">로그아웃</a>
			</div>
		</c:otherwise>
</c:choose>
<hr />