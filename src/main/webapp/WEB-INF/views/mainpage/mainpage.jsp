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

	<h1><a href="mainpage">jj9</a> 메인 페이지</h1>

	<div>
		헤더 부분 <br />
		<div>
			로그인 테스트 용<br /> <a href="">로그인</a> <br /> <a href="">회원가입</a>
		</div>
		
		<br />

		<div>
			<form action="">
				<input type="text" name="search" placeholder="재능이나 전문가를 검색하세요." />
				<input type="submit" value="검색" />
			</form>
		</div>

	</div>
	
	<br />

	<h3>카테고리 테스트용</h3>
	<div>
		<ul> 전체 카테고리  <br />
			<c:forEach items="${categorys }" var="category">
				<li><a href="category/${category.cate_id }">${category.cate_main }</a></li>
			</c:forEach>
		</ul>
	</div>


	
	<br />
	
	<div>
		재능 등록 테스트 용<br />
		<a href="">재능 등록 </a> <br />
	</div>
	
	<div>
		재능 의뢰 테스트 용<br />
		<a href="">재능 의뢰 </a> <br />
	</div>
	
	<br />
	
	<h3>BEST 재능</h3>
	<div>
		<c:forEach items="${bestpurchases }" var="bestpurchase">
			<span>
					<a href="purchase/${bestpurchase.talent_id }">
					 	${bestpurchase.talent_title } <br />
					 	
					 	가격 : ${bestpurchase.talent_price }
					 	판매자 : ${bestpurchase.member_id } 
					 	판매 횟수 : ${bestpurchase.talent_paycount } <br />
					 	cate_id : ${bestpurchase.cate_id } <br />
					 	재능 번호 : ${bestpurchase.talent_id } <br />
					 </a>
				</span> 
				<br />
				<br />
		</c:forEach>
		
	</div>
	
	<br />
	
	<h3>NEW 재능</h3>
	<div>
		<c:forEach items="${newpurchases }" var="newpurchase">
			<span>
					<a href="purchase/${newpurchase.talent_id }">
					 	${newpurchase.talent_title } <br />
					 	
					 	가격 : ${newpurchase.talent_price }
					 	판매자 : ${newpurchase.member_id } 
 						판매 횟수 : ${newpurchase.talent_paycount } <br />
					 	cate_id : ${newpurchase.cate_id } <br />
					 	재능 번호 : ${newpurchase.talent_id } <br />
					 </a>
				</span> 
				<br />
				<br />
		</c:forEach>
		
	</div>
	
	<br />
	
	<div>
	
		footer 부분
		
	</div>
	
<script>

</script>
</body>
</html>