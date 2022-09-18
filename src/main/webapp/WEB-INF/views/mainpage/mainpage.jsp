<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jj9</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script> <!--  jquery -->
<style>
.bestNew {
    display: flex;
    padding-left: 5px;
    padding-right: 5px;
}

.bestNew > * {
    
    padding: 30px;
}

</style>
</head>
<body>

	<h1><a href="mainpage">jj9</a> 메인 페이지</h1>

	<div>
		헤더 부분 <br />
		<div>
			로그인 테스트 용<br /> <a href="">로그인</a> <br /> <a href="">회원가입</a>
		</div>
		
		<br />

<!-- 검색 기능 -->
		<div class="search_wrap">
			<div class="search_area">
				<form id="mainSearchForm" name="searchForm" method="get">
					<input type="text" id="searchKeyword" name="keyword" value="${page.cri.keyword }" placeholder="재능이나 전문가를 검색하세요.">
						<button>Search</button>
					
					<input type="hidden" name="pageNum" value="${page.cri.pageNum }">
					<input type="hidden" name="amount" value="${page.cri.amount }">
				</form>
			</div>
		</div>
<!-- /검색 기능 -->
	
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
	
	<div class="bestNew">
	
	
	<div><h3>BEST 재능</h3>
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
	
	
	<div><h3>NEW 재능</h3>
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
	
	</div>
	
	<br />
	
	<hr />
	<!-- footer -->
	<div>
	
		footer 부분
		
	</div>
	
<script src="/jj9/resources/js/category.js?ver=1"></script>

</body>
</html>