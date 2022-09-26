<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/jj9/resources/css/requestHome.css" />
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


.active{
      background-color: #cdd5ec;
  }
</style>

</head>
<body>
	
<%@ include file="../header.jsp" %>
<br>
	<!-- body -->
	
	<section class="body-section2">
		<div class="body-div2">
			<div class="prodiv">프로젝트 리스트</div>
			<div class="mainCate-div">
				<c:forEach items="${mainCates }" var="maincategory"
					varStatus="status">
					<div id="mainCate-div${status.count }" class="mainCate-div2">
						<a href="/jj9/req/${maincategory.cate_id }" id="mainCategory-a">
							${maincategory.cate_main } ▼</a>
						<div class="subCate-div">
							<c:set var="sub" value="sub${status.count}" />
							<c:forEach items="${requestScope[sub] }" var="sub"
								varStatus="status2">
								<div class=subCatediv>
									<a href="/jj9/req/${sub.cate_id }"
										id="subCate-a${status2.count }" class="subCate-a">
										　${sub.cate_sub }</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</c:forEach>
			</div>

			<div class="reqList">
				
				<c:forEach items="${purchases}" var="list">
					<div onclick="location.href='../request/${list.trequest_id}';" class="list-div">
						<div class="list-first-row">
							<div class="title-div">
								<a href="../request/${list.trequest_id}"
								class="req-title-a"><c:out value="${list.trequest_title}" /></a> <br>
								
								<div class="category-div">
								<c:out value="${list.cate_main} · ${list.cate_sub }" />
								</div>
							</div>
							<div class="member-id-div">
								작성자 　<c:out value="${list.member_id}" />
							</div>
						</div>
						<div class="list-second-row">
							<div class="budget-div">
								<div class="left">
									예산
								</div>
								<div class="right">
									<fmt:formatNumber value="${list.trequest_budget }"
											groupingUsed="true" />원
								</div>
								 
							</div>
							<div class="date-div">
								<div class="left">
									작성일
								</div>
								<div class="right">
									 <fmt:formatDate value="${list.trequest_date}"
											pattern="yy-MM-dd" />
								</div>
								
							</div>
							<div class="deadline-div">
								<div class="left">
									마감일
								</div>
								<div class="right">
									<fmt:formatDate value="${list.trequest_deadline}"
											pattern="yy-MM-dd" />						
								</div>
							</div>
						</div>
					</div>
					<hr>
					<br>
					<!-- 
						<tr>
							<td><c:out value="${list.rn}" /></td>
							<td><c:out value="${list.trequest_id}" /></td>
							<td><a href="../request/${list.trequest_id}"
								class="req-title-a"><c:out value="${list.trequest_title}" /></a></td>
							<td><c:out value="${list.member_id}" /></td>
							<td><fmt:formatNumber value="${list.trequest_budget }"
									groupingUsed="true" />원</td>
							<td><fmt:formatDate value="${list.trequest_date}"
									pattern="yy-MM-dd" /></td>
							<td><fmt:formatDate value="${list.trequest_deadline}"
									pattern="yy-MM-dd" /></td>
						</tr>
					 -->
				</c:forEach>
			
				<!-- 
				<table border="1">
					<tr>
						<th>번호</th>
						<th>재능번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>예산</th>
						<th>등록일</th>
						<th>마감일</th>
					</tr>

					<c:forEach items="${purchases}" var="list">
						<tr>
							<td><c:out value="${list.rn}" /></td>
							<td><c:out value="${list.trequest_id}" /></td>
							<td><a href="../request/${list.trequest_id}"
								class="req-title-a"><c:out value="${list.trequest_title}" /></a></td>
							<td><c:out value="${list.member_id}" /></td>
							<td><fmt:formatNumber value="${list.trequest_budget }"
									groupingUsed="true" />원</td>
							<td><fmt:formatDate value="${list.trequest_date}"
									pattern="yy-MM-dd" /></td>
							<td><fmt:formatDate value="${list.trequest_deadline}"
									pattern="yy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</table>
				-->
				<div class="pagInfo-wrap">
					<div class="pageInfo-area">
						<ul id="pageInfo" class="pageInfo">

							<!-- 이전페이지 버튼 -->
							<c:if test="${page.prev}">
								<li class="pageInfo_btn previous"><a
									href="${page.startPage-1}">이전</a></li>
							</c:if>
							<!-- 각 번호 페이지 버튼 -->
							<c:forEach var="num" begin="${page.startPage}"
								end="${page.endPage}">
								<li class="pageInfo_btn ${page.cri.pageNum == num ? "active":"" }">
									<a href="${num }">${num}</a>
								</li>

							</c:forEach>

							<!-- 다음페이지 버튼 -->
							<c:if test="${page.next}">
								<li class="pageInfo_btn next"><a
									href="${page.endPage + 1 }">다음</a></li>
							</c:if>

						</ul>
					 
					</div>
				</div>
				<form id="moveForm" method="get">
					<input type="hidden" name="pageNum" value="${page.cri.pageNum }">
					<input type="hidden" name="amount" value="${page.cri.amount }">
				</form>
			</div>
		</div>
	</section>

	<script src="/jj9/resources/js/requestHome.js"></script>
<%@ include file="../footer.jsp" %>
</body>
</html>