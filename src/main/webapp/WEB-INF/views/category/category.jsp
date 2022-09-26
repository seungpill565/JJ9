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
<%@ include file="../header.jsp" %>
	

<!-- body -->
<section class="category-section1">
	

<!-- category list -->
	<div class="category-div1">
	<div class="purchase-count-div">
		<span class="purchase-count-span">※ ${page.total }개의 재능이 있습니다.</span>
	
	</div>

		<div class="category-div2">
			<c:forEach items="${purchases}" var="purchase">

					<a href="purchase/${purchase.talent_id }" class="purchase-a">
									
										<img class="purchase-image" src=""></img>
										<div class="purchase-title2">${purchase.talent_title }</div>
										<div class="purchase-price">가격 : ${purchase.talent_price }</div>
										<div class="purchase-seller">판매자 :	${purchase.member_id }</div>
										</a>
				
			</c:forEach>
			
		</div>
<!-- category list -->
		
		<!-- paging -->
		<div class="paging-div"> 
		<div class="paging-wrap">
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

	<!-- paging -->
		
		</div>
</section>
<!-- body -->


	


	
		<!-- footer -->
<%@ include file="../footer.jsp" %>
	<script src="/jj9/resources/js/category.js"></script>

</body>
</html>






















<!-- 
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
	 -->