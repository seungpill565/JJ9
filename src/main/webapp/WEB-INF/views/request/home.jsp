<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재능 의뢰 목록</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script> <!--  jquery -->
<style type="text/css">
.show-page>li {
	list-style: none;
	float: left;
	padding: 6px;
}

.pageInfo {
	list-style: none;
	display: inline-block;
	margin: 50px 0 0 100px;
}

.pageInfo li {
	float: left;
	font-size: 20px;
	margin-left: 18px;
	padding: 7px;
	font-weight: 500;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: underline;
}
.active{
      background-color: #cdd5ec;
  }
</style>

</head>
<body>
	<h1><a href="../mainpage">jj9</a></h1>
	
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
					<td><c:out value="${list.trequest_id}" /></td>
					<td><a href="../purchase/${list.trequest_id}"><c:out
								value="${list.trequest_title}" /></a></td>
					<td><c:out value="${list.member_id}" /></td>
					<td><fmt:formatDate value="${list.trequest_date}"
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
							<a href="${page.startPage-1}">이전</a>
						</li>
					</c:if>
					<!-- 각 번호 페이지 버튼 -->
					<c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
                    <li class="pageInfo_btn ${page.cri.pageNum == num ? "active":"" }">
                             		<a href="${num }">${num}</a></li>

                </c:forEach>

					<!-- 다음페이지 버튼 -->
					<c:if test="${page.next}">
						<li class="pageInfo_btn next">
							<a href="${page.endPage + 1 }">다음</a>
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
	



	<br />
	<br />
	<div>
		재능 등록 테스트 용<br />
		<a href="/jj9/insert">재능 등록 </a> <br />
	</div>
	
	<div>
		재능 의뢰 테스트 용<br />
		<a href="/jj9/insertRequest">재능 의뢰 등록 </a> <br />
	</div>
	
	<br />
	

	<script src="/jj9/resources/js/requestHome.js"></script>

</body>
</html>