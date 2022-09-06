<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="text-align: center">
	<a href="/jj9/main">Main</a>
	<a href="/jj9/list">리스트</a>
</div>

<c:choose>
	<c:when test="${sessionScope.member_id == null }">
		<a href="/jj9/register">회원가입</a>
		<a href="/jj9/login">로그인</a>
	</c:when>
	<c:otherwise>
		${sessionScope.member_name }님이 로그인 중입니다.
		<a href="/jj9/logout">로그아웃</a>
	</c:otherwise>
</c:choose>
<hr />