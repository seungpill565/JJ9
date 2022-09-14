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
	
	<form action="./insertRequest" method="POST">
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
		<br>
		
		제목 <input type="text" name="trequest_title"/> <br>
		예산 <input type="number" name="trequest_budget"/> <br>
		마감일 <input type="date" name="trequest_deadline" id="request-deadline"> <br>	
		상세내용 <br> 
		<br> <textarea name="" id="" cols="30" rows="10"></textarea>
		<!-- <input type="text" name="trequest_content"/>  --><br>
		<input type="hidden" value="1" name="member_id"/>
		<input type="submit" value="올리기"/>
	
	</form>
	
	<script src="/jj9/resources/js/insertRequest.js"></script>
	
	<script>
	document.getElementById('request-deadline').value = new Date().toISOString().substring(0, 10);
	</script>
</body>
</html>