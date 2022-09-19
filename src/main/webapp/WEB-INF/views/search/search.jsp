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
	<h1><a href="/jj9/mainpage" class="jj9-mainpage">jj9</a></h1>
	
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
				<!-- 
					<select name="type">
						<option value=""
							<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
						<option value="T"
							<c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
						<option value="C"
							<c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
						<option value="W"
							<c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
					</select> 
				 -->
					<input type="text" id="searchKeyword" name="keyword" value="${page.cri.keyword }" placeholder="재능이나 전문가를 검색하세요.">
						<button>Search</button>
					
					<input type="hidden" name="pageNum" value="${page.cri.pageNum }">
					<input type="hidden" name="amount" value="${page.cri.amount }">
				</form>
			</div>
		</div>
<!-- /검색 기능 -->

	</div>
	
	<br />


	<h3>category </h3>
	<div>
		<span>메인 카테고리
			<ul>
				<c:forEach items="${maincategorys }" var="maincategory">
					<li><a href="../jj9/category/${maincategory.cate_id }" id="${maincategory.cate_id }">${maincategory.cate_id }
							/ ${maincategory.cate_main } / ${maincategory.cate_sub } </a></li>
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
					<td><a href="../jj9/purchase/${list.talent_id}"><c:out
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
		    <input type="hidden" name="keyword" value=${page.cri.keyword } />
			<input type="hidden" name="pageNum" value="${page.cri.pageNum }">
        	<input type="hidden" name="amount" value="${page.cri.amount }">
        </form> 
	</div>
	



	<br />
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
	

	<script src="/jj9/resources/js/category.js?ver=1"></script>

</body>
</html>