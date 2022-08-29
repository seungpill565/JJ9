<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	카테고리 <select id="select-cate-main" name="cate-main">
			<option value="null">카테고리 선택</option>
			<c:forEach items="${mainCates }" var="cate">
				<option value="${cate.cate_main }">${cate.cate_main }</option>
			</c:forEach>
		</select> <br>

		<select id="select-cate-sub" name="cate-sub">
			<option value="null">세부 카테고리 선택</option>
		</select> <br>
		
		
	제목 <input type="text" /> <br>
	가격 <input type="text" /> <br>
	작업일 <input type="text" /> <br>
	옵션 <input type="text" /> <br>
	이미지 <input type="text" /> <br>
	상세내용 <input type="text" /> <br>
	구매자 지시사항 <input type="text" /> <br>
	
	<script src="/jj9/resources/js/insertTalent.js"></script>
</body>
</html>