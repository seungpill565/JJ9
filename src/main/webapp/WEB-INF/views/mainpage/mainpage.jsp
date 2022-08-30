<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jj9</title>
</head>
<body>

	<h3>jj9 메인 페이지</h3>

	<div>
		카테고리 링크 테스트 용 <br />
		<a href="category/category">카테고리 1</a> <br /><!-- 1차카테고리 클릭시 세부 카테고리 페이지 로딩 가정 -->
		<a href="category/category">카테고리 2</a> <br />
		<a href="category/category">카테고리 3</a> <br />
		<a href="category/category">카테고리 4</a> <br />
		<a href="category/category">카테고리 5</a> <br />
		<a href="category/category">카테고리 6</a> <br />
		<a href="category/category">카테고리 7</a> <br />
	</div>
	
	<ul>
	<c:forEach items="${categorys }" var="category">
		<li>
			<a href="category/category">${category.cate_main }</a>
		</li>
	</c:forEach>
	</ul>
	
	<br />
	
	<div>
		로그인 테스트 용<br />
		<a href="">로그인</a> <br />
		<a href="">회원가입</a>
	</div>
	
	<br />
	
	<div>
		재능 의뢰 등록 테스트 용<br />
		<a href="">재능 의뢰 </a> <br />
	</div>
	
	<br />
	
	<div>
		best 재능 4개<br />
		<a href="">best1</a>
		<a href="">best2</a> <br />
		<a href="">best3</a>
		<a href="">best4</a> <br />
	</div>
	
	<br />
	
	<div>
		new 재능 4개<br />
		<a href="">new1</a>
		<a href="">new2</a> <br />
		<a href="">new3</a>
		<a href="">new4</a> <br />
	</div>
	
	<br />
	
	<div>
	
		footer 부분
		
	</div>
	
<script>

</script>
</body>
</html>