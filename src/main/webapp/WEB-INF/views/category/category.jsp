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
	<h1><a href="../mainpage">jj9</a></h1>

	<h3>category </h3>
	
	<div>
		<ul>
			<c:forEach items="${categorys }" var="category">
				<li><a href="${category.cate_id }" id="${category.cate_id }">${category.cate_id } / ${category.cate_main } / ${category.cate_sub } </a></li>
			</c:forEach>
		</ul>
	</div>
	

	<div>
		<ul>
			<c:forEach items="${categorys }" var="category">
				<li><a href="${category.cate_id }" id="${category.cate_id }">${category.cate_id } / ${category.cate_main } / ${category.cate_sub } </a></li>
			</c:forEach>
		</ul>
	</div>
	
	


	<div>
		<c:forEach items="${purchases }" var="purchase">
			<div>
				<span>
					<a href="../purchase/${purchase.talent_id }">
					 	${purchase.talent_title } <br />
					 	가격 : ${purchase.talent_price }
					 	판매자 : ${purchase.member_id } <br />
					 	cate_id : ${purchase.cate_id }
					 </a>
				</span> 
			</div><br />
		</c:forEach>
		
	</div>
	
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
	

	<script src="/jj9/resources/js/category.js"></script>
</body>
</html>