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

	<h1><a href="mainpage" class="jj9-mainpage">jj9</a></h1>

	<div>
		헤더 부분 <br />
		<div>
			로그인 테스트 용<br /> <a href="login">로그인</a> <br /> <a href="">회원가입</a>
		</div>
		
		<br />

<!-- 검색 기능 -->
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

</body>
</html>