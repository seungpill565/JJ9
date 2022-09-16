<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="">
<meta charset="UTF-8">
<title>jj9 - 재능 등록하기</title>
</head>
<body>

	<h3 class="local-font"><a href="#">jj9</a></h3>

	<h3>재능 등록</h3>
	
	<form action="./insert" method="POST" enctype="multipart/form-data">
		카테고리 
		<select id="select-cate-main" name="cate-main">
			<option value="null">카테고리 선택</option>
			<c:forEach items="${mainCates }" var="cate">
				<option value="${cate.cate_main }">${cate.cate_main }</option>
			</c:forEach>
		</select>

		<select id="select-cate-sub" name="cate-sub">
			<option value="null">세부 카테고리 선택</option>
		</select> <br>
		

		제목 <input type="text" name="talent_title"/> <br>
		가격 <input type="number" name="talent_price"/> <br>
		작업기간 <input type="text"/> <br>	
		이미지 <input type="file" name="image_file"/> 최대 15MB<br>
		상세내용 <br> <textarea name="" id="" cols="30" rows="10"></textarea> <br>
		커리큘럼 <br> <textarea name="" id="" cols="30" rows="10"></textarea> <br>
		<input type="hidden" value="1" name="member_id"/>
		<input type="submit" value="올리기"/>
	</form>
	
	<!--  <input type="textarea" name="talent_service_exp"/> 
	<input type="textarea" name="talent_curriculum"/>
	--> 
	
	
	<script src="/jj9/resources/js/insertTalent.js"></script>
</body>
</html>