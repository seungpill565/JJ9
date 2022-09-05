<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>category</title>
<!-- 
	 	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		</style>
		 -->
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
				<c:forEach items="${maincategorys }" var="category">
					<li><a href="${category.cate_id }" id="${category.cate_id }">${category.cate_id }
							/ ${category.cate_main } / ${category.cate_sub } </a></li>
				</c:forEach>
			</ul>
		</span> <span>서브 카테고리
			<ul>
				<c:forEach items="${subcategorys }" var="category">
					<li><a href="${category.cate_id }" id="${category.cate_id }">${category.cate_id }
							/ ${category.cate_main } / ${category.cate_sub } </a></li>
				</c:forEach>
			</ul>
		</span>
	</div>
	
	<br />

	<div>재능 목록 <br /> <!-- 페이징 없이 카테고리별 재능 표시 -->
		<c:forEach items="${purchases }" var="purchase">
			<div>
				<span>
					<a href="../purchase/${purchase.talent_id }">
					 	${purchase.talent_title } <br />
					 	가격 : ${purchase.talent_price }
					 	판매자 : ${purchase.member_id } <br />
					 	cate_id : ${purchase.cate_id } <br />
					 	재능 번호 : ${purchase.talent_id } <br />
					 </a>
				</span> 
			</div><br />
		</c:forEach>
		
	</div>
	 
	
	<br /><br />
	
	<!-- 첫번째 페이징 코드 
	<c:forEach items="${pages }" var="purchase">
		<tr>
			<td>${purchase.talent_id }</td>
			<td><a href="../purchase/${purchase.talent_id }"></a></td>
			<td>${purchase.member_id }</td>
			<td>${purchase.talent_price }</td>
		</tr>
	</c:forEach>
	
	<c:if test="${pagevo.prev }">
		<li><a href="../category?pageNum=${pagevo.startPage - 1 }&amount=${pagevo.amount} ">이전</a></li>
	</c:if>
		
	<c:forEach begin="${pagevo.startPage }" end="${pagevo.endPage }">
		<li class="${pagevo.pageNum eq num ? 'active' : '' }">
			<a href="../category?pageNum=${num }&amount=${pagevo.amount}">${num }</a>
		</li>
	</c:forEach>
	
	<c:if test="${pagevo.next }">
		<li><a href="../category?pageNum=${pagevo.endPage + 1 }&amount=${pagevo.amount} ">다음</a></li>
	</c:if>
	
	-->

		<div>
		<table>
						<tr><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th></tr>
						
						<c:forEach items="${list}" var = "list">
							<tr>
								<td><c:out value="${list.talent_id}" /></td>
								<td>
									<a href="/board/readView?bno=${list.talent_id}"><c:out value="${list.talent_title}" /></a>
								</td>
								<td><c:out value="${list.member_id}" /></td>
								<td><fmt:formatDate value="${list.talent_date}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
						
					</table>
			<ul>
				<c:if test="${pagemaker.prev}">
					<li><a
						href="list${pagemaker.makeQuery(pagemaker.startPage - 1)}">이전</a></li>
				</c:if>

				<c:forEach begin="${pagemaker.startPage}" end="${pagemaker.endPage}"
					var="idx">
					<li><a href="list${pagemaker.makeQuery(idx)}">${idx}</a></li>
				</c:forEach>

				<c:if test="${pagemaker.next && pagemaker.endPage > 0}">
					<li><a
						href="list${pagemaker.makeQuery(pagemaker.endPage + 1)}">다음</a></li>
				</c:if>
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
	

	<script src="/jj9/resources/js/category.js"></script>
</body>
</html>