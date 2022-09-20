<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>category</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script> <!--  jquery -->
<link rel="stylesheet" href="/jj9/resources/css/category.css?ver=1" />

</head>
<body>
	
	<!-- header -->
	<header>
		<!-- section1 -->
		<section class="header-section1">
		
		<div class="logo-div">	
			<a href="/jj9/mainpage" class="jj9-mainpage">jj9</a>
		</div>

		<div class="login-register-div">
			<div class="login-register-div-login">
		 		<a href="login" class="member-login">로그인</a>
		 	</div>
		 	<div class="login-register-div-register">  
		 		<a href="register" class="member-register">회원가입</a>
		 	</div>
		</div>
		
		



	
		</section>
		<!-- section1 -->
		
		<!-- section2 -->
		<!-- 카테고리 -->
		<section class="header-section2">
		<div class="mainPage-mainCategory-div">
			<button class="category-button">
				<div class="category-menu-img"></div>
				<span>메인 카테고리</span>
			</button>
			<div class="category-div">
				<c:forEach items="${maincategorys }" var="category">
				<a href="/jj9/category/${category.cate_id }">${category.cate_main }</a>
			
				</c:forEach>
			</div>
		</div>
		<!-- 카테고리 -->
		
		<!-- 검색 기능 -->
		<div class="search_wrap">
			<div class="search_area">
				<form id="mainSearchForm" name="searchForm" method="get">
					<input type="text" id="searchKeyword" name="keyword" value="${page.cri.keyword }" placeholder="재능을 검색하세요.">
						<button class="searchButton">검색</button>
					<input type="hidden" name="pageNum" value="${page.cri.pageNum }">
					<input type="hidden" name="amount" value="${page.cri.amount }">
				</form>
			</div>
		</div>
		<!-- /검색 기능 -->
		<div class="insert-register-div">
			<div class="talent-insert">
				 <a href="insert">재능 등록하기 </a> <br />
			</div>

			<div class="talent-request">
				 <a href="req/1">재능 의뢰하기 </a> <br />
			</div>
		</div>

		</section>


	</header>
	<!-- header -->
	


	<h3>category </h3>
	<div>
		<span>메인 카테고리
			<ul>
				<c:forEach items="${maincategorys }" var="maincategory">
					<li><a href="${maincategory.cate_id }" id="${maincategory.cate_id }">${maincategory.cate_id }
							/ ${maincategory.cate_main } / ${maincategory.cate_sub } </a></li>
				</c:forEach>
			</ul>
		</span> <span>서브 카테고리
			<ul>
				<c:forEach items="${subcategorys }" var="subcategory">
					<li><a href="${subcategory.cate_id }" id="${subcategory.cate_id }">${subcategory.cate_id }
							/ ${subcategory.cate_main } / ${subcategory.cate_sub } </a></li>
				</c:forEach>
			</ul>
		</span>
	</div>
	
	<br />
	
	<br /><br />
	

	<div>
		<table>
			<tr>
				<th>번호</th>
				<th>재능번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
			</tr>

			<c:forEach items="${purchases}" var="list">
				<tr>
					<td><c:out value="${list.rn}" /></td>
					<td><c:out value="${list.talent_id}" /></td>
					<td><a href="../purchase/${list.talent_id}"><c:out
								value="${list.talent_title}" /></a></td>
					<td><c:out value="${list.member_id}" /></td>
					<td><fmt:formatDate value="${list.talent_date}"
							pattern="yy-MM-dd" /></td>
				</tr>
			</c:forEach>
		</table>
		
		<div class="pagInfo-wrap">
			<div class="pageInfo-area">
				<ul id="pageInfo" class="pageInfo">

					<!-- 이전페이지 버튼 -->
					<c:if test="${page.prev}">
						<li class="pageInfo_btn previous">
							<a href="${page.startPage-1}">이전</a> <!-- 11~20 페이지를 보고있다면 이전 버튼 클릭 시 11-1 페이지로 이동 -->
						</li>
					</c:if>
					<!-- 각 번호 페이지 버튼 -->
					<c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
                    <li class="pageInfo_btn ${page.cri.pageNum == num ? "active":"" }"> <!-- 내가 클릭한 페이지 번호에 음영 넣기 -->
                             		<a href="${num }">${num}</a></li>

                </c:forEach>

					<!-- 다음페이지 버튼 -->
					<c:if test="${page.next}">
						<li class="pageInfo_btn next">
							<a href="${page.endPage + 1 }">다음</a> <!--  11~20 페이지를 보고있다면 다음 버튼 클릭 시 20+1 페이지로 이동 -->
						</li>
					</c:if>

				</ul>
			</div>
		</div>
		<form id="moveForm" method="get">
			<input type="hidden" name="pageNum" value="${page.cri.pageNum }">
        	<input type="hidden" name="amount" value="${page.cri.amount }">
        </form> 
	</div>
	

	<script src="/jj9/resources/js/category.js"></script>

</body>
</html>