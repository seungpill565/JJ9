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

	<div>카테고리 테스트용 <br />
		<ul> 전체 카테고리  <br />
			<c:forEach items="${categorys }" var="category">
				<li><a href="category/${category.cate_id }">${category.cate_main }</a></li>
			</c:forEach>
		</ul>
	</div>

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