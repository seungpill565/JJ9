<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>category</title>
</head>
<body>

	<h3>category </h3>

	<div>
		<ul>
			<c:forEach items="${categorys }" var="category">
				<li><a href="${category.cate_id }">${category.cate_id } / ${category.cate_main } / ${category.cate_sub } </a></li>
			</c:forEach>
		</ul>
	</div>

<!-- 
	<div>
		<c:forEach items="">
			<a href="./purchase/1"> 재능 1</a>
		</c:forEach>
		
	</div>
 -->
	<script src="/jj9/resources/js/category.js"></script>
</body>
</html>