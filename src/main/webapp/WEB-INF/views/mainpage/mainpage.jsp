<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jj9</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script> <!--  jquery -->
<link rel="stylesheet" href="/jj9/resources/css/category.css?ver=1" />
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

	<!-- header -->
	<div class="main-header">
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
		<section class="header-section2">
		<!-- 카테고리 -->
		<div class="mainPage-mainCategory-div">
			<button class="category-button">
				<div class="category-menu-img"></div>
				<span style="font-size:20px;">메인 카테고리</span>
			</button>
			<div class="mainCategory-div">
				<c:forEach items="${maincategorys }" var="maincategory" varStatus="status" >
					<a href="/jj9/category/${maincategory.cate_id }" id="mainCategory-a" value="${maincategory.cate_main }">${maincategory.cate_main }
						<li class="test1">1234</li>
						<li class="test1">1234</li>
						<li class="test1">1234</li>
						<li class="test1">1234</li>
						<li class="test1">1234</li>
						<li class="test1">1234</li>
				
					</a>
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


	</div>
	<!-- header -->
	
	<!-- body -->
	
	<section class="body-section">
		
		<div class="howToUsejj9-div">
			
		</div>
		
		<div class="best-new-div">
			<div class="new-div">
			</div>
			
			<div class="best-div">
			</div>
		</div>
	
	</section>
	
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
	
	<!-- footer1 -->
	
	<footer>
		<hr /> 
		<div class="footer1-wrap">
			<nav class="footer1-menu">
				<div class="footer1-menus">
					<p class="footer1-menus-cs">고객센터</p>
					<p class="footer1-menus-workTime">09:00~18:00 (점심시간 13:00~14:00)</p>
					<p class="footer1-menus-holiday">주말, 공휴일 휴무</p>
					<a role="link" color="default" href="" class="footer1-menus-requestLink">
						<span class="footer1-menus-request">1:1 문의</span>
					</a>
				</div>
				
				<div class="footer1-menus">
					<p class="footer1-menus-title">jj9</p>
					<ul class="footer1-menus-ul">
						<li class="footer1-menus-li">jj9 메인</li>
						<li class="footer1-menus-li">Prime</li>
						<li class="footer1-menus-li">엔터프라이즈</li>
						<li class="footer1-menus-li">프리랜서클럽</li>
					</ul>
				</div>
				
				<div class="footer1-menus">
					<p class="footer1-menus-title">jj9 정보</p>
					<ul class="footer1-menus-ul">
						<li class="footer1-menus-li">서비스 소개</li>
						<li class="footer1-menus-li">인재영업</li>
					</ul>
				</div>

				<div class="footer1-menus">
					<p class="footer1-menus-title">관련 사이트</p>
					<ul class="footer1-menus-ul">
						<li class="footer1-menus-li">jj9 블로그</li>
						<li class="footer1-menus-li">jj9 인스타그램</li>
						<li class="footer1-menus-li">jj9 유튜브</li>
					</ul>
				</div>
				
				<div class="footer1-menus">
					<p class="footer1-menus-title">지원</p>
					<ul class="footer1-menus-ul">
						<li class="footer1-menus-li">공지사항</li>
						<li class="footer1-menus-li">자주 묻는 질문</li>
						<li class="footer1-menus-li">이용약관</li>
						<li class="footer1-menus-li">개인정보처리방침</li>
						<li class="footer1-menus-li">전문가 센터</li>
					</ul>
				</div>
	
			
			</nav>
		</div>
	<!-- footer2 -->
	
		<hr /> 
		<div class="footer2-area1">
			<p class="footer2-area1-content">
				(주)jj9 | 
				
				팀장 : 안승필 | 
				
				사이트 관리자 : 장몽운, 김도현, 홍준혁, 박성훈 |
				
				고객센터 : 1234-5678 | 
				
				help@jj9
			</p>
		</div>
		
		<div class="footer2-area2">
			<p class="footer2-area2-content1">(주)jj9는 스프링 프로젝트를 위해 만들어진 사이트입니다. 실제 서비스가 아님을 유의해 주시기 바랍니다.</p>
			<div class="footer2-area2-content2">
				<p class="footer2-area2-content2-p">Copyright @ 2022 jj9 Inc. All rights reserved.</p>
			</div>
		</div>
	</footer>
	
<script src="/jj9/resources/js/category.js?ver=1"></script>
<script>

	var main = new Array();
	<c:forEach items="${maincategorys }" var="maincategory">
		main.push({cate_id:"${maincategory.cate_id}"
					,cate_main:"${maincategory.cate_main}"});
	</c:forEach>
	
	var subAll = new Array();
	<c:forEach items="${subcategorys }" var="subcategory">
		subAll.push({cate_id:"${subcategory.cate_id}"
					,cate_main:"${subcategory.cate_main}"
					,cate_sub:"${subcategory.cate_sub}"});
	</c:forEach>
	
	
	var box=document.getElementById('mainCategory-a');
	
	//box.addEventListener('mouseover')
	
	console.log(main[0].cate_main)
	console.log(main[0])
	
	
	var sub = new Array();
	
	for(var i=0;i<main.length;i++){
		for(var j=0;j<subAll.lenght;j++){
			if(main[i].cate_main==subAll[j].cate_main){
				sub.push({"cate_sub":"subAll[j].cate_sub"});
			}	
		}
	}
	
</script>

</body>
</html>






























<!-- 검색 기능 
		<div class="search_wrap">
			<div class="search_area">
				<form id="mainSearchForm" name="searchForm" method="get">
					<select name="type">
						<option value=""
							<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
						<option value="title"
							<c:out value="${pageMaker.cri.type eq 'title'?'selected':'' }"/>>제목</option>
						<option value="content"
							<c:out value="${pageMaker.cri.type eq 'content'?'selected':'' }"/>>내용</option>
						<option value="writer"
							<c:out value="${pageMaker.cri.type eq 'writer'?'selected':'' }"/>>전문가</option>
					</select> 
						<input type="text" id="searchKeyword" name="keyword" value="${page.cri.keyword }" placeholder="재능이나 전문가를 검색하세요.">
						<button>Search</button>
					
					<input type="hidden" name="pageNum" value="${page.cri.pageNum }">
					<input type="hidden" name="amount" value="${page.cri.amount }">
				</form>
			</div>
		</div>
 /검색 기능 -->