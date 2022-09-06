<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>재능 의뢰 등록</h3>
	
	<form action="" method="POST" enctype="multipart/form-data">
		카테고리
		<select id="select-cate-main" name="cate-main">
			<option value="null">카테고리 선택</option>
			<c:forEach items="${mainCates }" var="cate">
				<option value="${cate.cate_main }">${cate.cate_main }</option>
			</c:forEach>
		</select>
		
		<select name="cate-sub" id="select-cate-sub">
			<option value="null">세부 카테고리 선택</option>
		</select>
	
	
	</form>
	
	
	


	<script src="/jj9/resources/js/insertRequest.js"></script>
</body>
</html>