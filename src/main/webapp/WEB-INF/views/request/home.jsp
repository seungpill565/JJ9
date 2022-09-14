<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jj9</title>
</head>
<body>
	
	<a href="./insertRequest">재능 의뢰하기</a>
	
	<h4>카테고리</h4>
	
	<c:forEach items="${mainCates }" var="main" varStatus="status">
		<ul>
		<a href="./request/${main.cate_main }">${main.cate_main }</a>
		<c:set var="sub" value="sub${status.count}" />
		<c:forEach items="${requestScope[sub] }" var="sub">
			<li>${sub.cate_sub }</li>
		</c:forEach>
		</ul>
	</c:forEach>
	
	<h4>의뢰 목록</h4>
	<c:forEach items="${requests }" var="request">
		<button value="${request.trequest_id }">${request.trequest_title }</button> <br>
		
	</c:forEach>
	
	
	
</body>
</html>