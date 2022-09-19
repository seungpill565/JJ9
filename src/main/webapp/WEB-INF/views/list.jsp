<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member-List</title>
</head>
<body>
<%@ include file="./include/menu.jsp" %>	
<c:if test="${sessionScope.member_name != null }">
	<h2>${sessionScope.member_name }(${sessionScope.member_id })님 환영합니다.</h2>
</c:if>
	<h1>member-list</h1>
	
	<ul>
		<c:forEach items="${members}" var="member">
			<li>${member.member_id} | ${member.member_password} | ${member.member_email} |
			${member.member_phoneNum} | ${member.member_birthday} | ${member.member_point}</li>
		</c:forEach>
	</ul>
	
</body>
</html>