<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/jj9/resources/css/category.css?ver=1" />
</head>
<body>

	<!-- header -->
	<div class="main-header">
		<!-- section1 -->
		<section class="header-section1">
			<div class="logo-div">
				<a href="/jj9/mainpage" class="jj9-mainpage">jj9</a>
			</div>
			<div class="login-register-div">
				<c:choose>
					<c:when test="${sessionScope.member_id==null }">
						<div class="login-register-div-login">
							<a href="/jj9/login" class="member-login">로그인</a>
						</div>
						<a href="/jj9/register" class="member-register"> <span
							class="member-register-span">회원가입</span>
						</a>
					</c:when>
					<c:otherwise>
						<div class="login-register-div-name">
							<span>${sessionScope.member_name }님,</span> <span>반갑습니다!</span>
						</div>
						<div class="login-register-div-mypage">
							<a href="/jj9/account/mypage"
								class="member-mypage member-mypage-logout">마이페이지</a>
						</div>
						<div class="login-register-div-logout">
							<a href="/jj9/logout" class="member-logout member-mypage-logout">
								<span>로그아웃</span>
							</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</section>
		<!-- section1 -->

		<!-- section2 -->
		<section class="header-section2">
			<!-- 카테고리 -->

			<div class="mainPage-mainCategory-div">
				<button class="category-button">
					<div class="category-menu-img"></div>
					<span style="font-size: 20px;">메인 카테고리</span>
				</button>
				<div class="mainCategory-div">
					<c:forEach items="${mainCates }" var="maincategory"
						varStatus="status">
						<div id="mainCategory-div${status.count }"
							class="mainCategory-div2">
							<a href="/jj9/category/${maincategory.cate_id }"
								id="mainCategory-a"> ${maincategory.cate_main } ▼</a>
							<div class="subCategory-div">
								<c:set var="sub" value="sub${status.count}" />
								<c:forEach items="${requestScope[sub] }" var="sub"
									varStatus="status2">
									<a href="/jj9/category/${sub.cate_id }"
										id="subCategory-a${status2.count }" class="subCategory-a">${sub.cate_sub }</a>
								</c:forEach>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<!-- 카테고리 -->

			<!-- 검색 기능 -->
			<div class="search_wrap">
				<div class="search_area">
					<form id="mainSearchForm" name="searchForm" method="get">
						<input type="text" id="searchKeyword" name="keyword"
							value="${page.cri.keyword }" placeholder="재능을 검색하세요.">
						<button class="searchButton">검색</button>
						<input type="hidden" name="pageNum" value="${page.cri.pageNum }">
						<input type="hidden" name="amount" value="${page.cri.amount }">
					</form>
				</div>
			</div>
			<!-- /검색 기능 -->
			<div class="insert-register-div">
				<a href="/jj9/notice">
					<div class="talent-insert insert-register-a">
						<span>공지사항</span>
					</div>
				</a>
				<a href="/jj9/insert">
					<div class="talent-insert insert-register-a">
						<span>재능 등록하기</span>
					</div>
				</a> 
				<a href="/jj9/req/1">
					<div class="talent-request insert-register-a">
						<span>재능 의뢰하기</span>
					</div>
				</a>
			</div>
		</section>
	</div>
	<hr />
	<!-- header -->
</body>
</html>