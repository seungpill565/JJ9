<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>재능 검색</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script> <!--  jquery -->
<link rel="stylesheet" href="/jj9/resources/css/category.css?ver=1" />
</head>
<body>
	<!-- header -->
<%@ include file="../header.jsp" %>

	<section class="category-section1">


		<!-- category list -->
		<div class="category-div1">
			<div class="purchase-count-div">
				<span class="purchase-count-span">※ ${page.total }개의 재능이
					있습니다.</span>

			</div>
			<c:choose>
				<c:when test="${page.total==0 }">
					<div class="purchase-total-zero">
						<div class="purchase-total-zero-div1">
							<span>찾으시는 결과가 없나요?</span> <span>필요한 재능을 알려주세요. 전문가를
								찾아드릴게요!</span>
						</div>
						<div class="purchase-total-zero-div2">
							<c:choose>
								<c:when test="${sessionScope.member_id==null }">
									<a href="/jj9/login">
										<div class="purchase-total-zero-req">
											<span class="purchase-total-zero-req-span">재능 의뢰하기</span>
										</div>
									</a>
								</c:when>
								<c:otherwise>
									<a href="/jj9/req/1">
										<div class="purchase-total-zero-req">재능 의뢰하기</div>
									</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="category-div2">
						<c:forEach items="${purchases}" var="purchase">

							<a href="/jj9/purchase/${purchase.talent_id }" class="purchase-a">

								<img class="purchase-image"src="/tomcatImg/${purchase.talent_image }"/>
								<div class="purchase-title2">${purchase.talent_title }</div>
								<div class="purchase-price">
									￦
									<fmt:formatNumber value="${purchase.talent_price }"
										groupingUsed="true" />
								</div>
								<div class="purchase-seller">판매자 : ${purchase.member_id }</div>
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
										<li class="pageInfo_btn previous"><a
											href="${page.startPage-1}">이전</a> <!-- 11~20 페이지를 보고있다면 이전 버튼 클릭 시 11-1 페이지로 이동 -->
										</li>
									</c:if>
									<!-- 각 번호 페이지 버튼 -->
									<c:forEach var="num" begin="${page.startPage}"
										end="${page.endPage}">
										<li class="pageInfo_btn ${page.cri.pageNum == num ? "active":"" }">
											<!-- 내가 클릭한 페이지 번호에 음영 넣기 --> <a href="${num }">${num}</a>
										</li>

									</c:forEach>

									<!-- 다음페이지 버튼 -->
									<c:if test="${page.next}">
										<li class="pageInfo_btn next"><a
											href="${page.endPage + 1 }">다음</a> <!--  11~20 페이지를 보고있다면 다음 버튼 클릭 시 20+1 페이지로 이동 -->
										</li>
									</c:if>

								</ul>
							</div>
						</div>
						<form id="moveForm" method="get">
							<input type="hidden" name="keyword" value="${page.cri.keyword }">
							<input type="hidden" name="pageNum" value="${page.cri.pageNum }">
							<input type="hidden" name="amount" value="${page.cri.amount }">
						</form>
					</div>
				</c:otherwise>
			</c:choose>
			<!-- paging -->

		</div>
	</section>
	<!-- body -->





	<script src="/jj9/resources/js/category.js"></script>
			<!-- footer -->
<%@ include file="../footer.jsp" %>
	
	

</body>
</html>