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
	
	<button>재능 의뢰하기</button>
	
	<h4>카테고리</h4>
	
	<c:forEach items="${mainCates }" var="main" varStatus="status">
		<ul>
		${main.cate_main }
		<c:set var="sub" value="sub${status.count}" />
		<c:forEach items="${requestScope[sub] }" var="sub">
			<li>${sub.cate_sub }</li>
		</c:forEach>
		</ul>
	</c:forEach>
	
</body>
</html>