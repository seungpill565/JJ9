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
	<h3>재능 등록</h3>
	<form action="./insert" method="POST" enctype="multipart/form-data">
	카테고리 <select id="select-cate-main" name="cate-main">
			<option value="null">카테고리 선택</option>
			<c:forEach items="${mainCates }" var="cate">
				<option value="${cate.cate_main }">${cate.cate_main }</option>
			</c:forEach>
		</select>

		<select id="select-cate-sub" name="cate-sub">
			<option value="null">세부 카테고리 선택</option>
		</select> <br>
		

	제목 <input type="text" name="talent_title"/> <br>
	가격 <input type="text" name="talent_price"/> <br>
	작업기간 <input type="text"/> <br>	
	이미지 <input type="file" name="image_file"/> 최대 15MB<br>
	상세내용 <input type="text" name="talent_service_exp"/> <br>
	커리큘럼 <input type="text" name="talent_curriculum"/> <br>
	<input type="hidden" value="1" name="member_id"/>
	<input type="submit" value="올리기"/>
	</form>
	
	
	<script src="/jj9/resources/js/insertTalent.js"></script>
</body>
</html>