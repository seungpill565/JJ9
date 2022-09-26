<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/jj9/resources/css/category.css?ver=1" />
<link rel="stylesheet" href="/jj9/resources/css/mypage-category.css">
<link rel="stylesheet" href="/jj9/resources/css/insertTalent.css">
<link rel="stylesheet" href="/jj9/resources/css/footer.css">
<meta charset="UTF-8">
<title>jj9 - 재능 등록하기</title>
</head>
<body>
<%@ include file="../include/header.jsp" %>
	<div class="mypage">
		<div class="mypage__category insertTalent__category">
			<div class="category__container inca">
				<ul class="cate-container__ul">
					<li><h2>재능등록하기</h2></li>
					<li><a href="/jj9/account/sell-talent">판매재능관리</a></li>
					<li><a href="/jj9/account/purchase-history">구매재능내역</a></li>
					<li style="background-color: rgb(230, 70, 70);"><a style="color: white;" href="/jj9/insert">재능등록하기</a></li>
					<li><a href="/jj9/insertRequest">재능의뢰등록</a></li>
					<li><a href="/jj9/account/note">쪽지관리</a></li>
					<li><a href="/jj9/account/add-coupon">쿠폰등록</a></li>
					<li><a href="/jj9/account/inquiry">1:1 문의</a></li>
					<li><a href="/jj9/account/member-modify">회원정보수정</a></li>
					<li><a href="/jj9/account/secession">회원탈퇴</a></li>
				</ul>
			</div>
		</div>
		
		<div class="thispage__main">
			<div class="main__container">
				<h2 class="main-container__title inca-title">재능등록하기</h2>
				<div class="container__card">
					<div class="content-body">	
						<form action="./insert" method="POST" enctype="multipart/form-data" onsubmit="return confirm('등록 하시겠습니까?');">
							<div class="colcol1">
								<div class="col-name">카테고리</div> 
								<select id="select-cate-main" name="cate-main">
									<option value="null">선택</option>
									<c:forEach items="${mainCates }" var="cate">
										<option value="${cate.cate_main }">${cate.cate_main }</option>
									</c:forEach>
								</select>
						
								<select id="select-cate-sub" name="cate-sub">
									<option value="null">세부카테고리 선택</option>
								</select> <br>
							</div>
							
							
							<div class="colcol">
								<div class="col-name">제목</div> <input type="text" name="talent_title"/>
							</div> <br>
							<div class="colcol">
								<div class="col-name">가격</div> <input type="number"  min="5000" max="100000000" name="talent_price"/>
							</div> <br>
							<div class="colcol">
								<div class="col-name">작업기간(일)</div> <input type="number" min="1" max="500" name="talent_workday"/>
							</div> <br>
							<div class="colcol">
								<div class="col-name">이미지</div> <input type="file" name="image_file"/> (최대 15MB) 
							</div> <br>
							<div class="colcol2">
								<div class="col-name">샘플</div> <br> <textarea name="talent_summary" id="" cols="30" rows="5"></textarea>
							</div> <br>
							<div class="colcol2">
								<div class="col-name">상세내용</div> <br> <textarea name="talent_service_exp" id="" cols="30" rows="20"></textarea>
							</div> <br>
							<div class="colcol2">
								<div class="col-name">커리큘럼</div> <br> <textarea name="talent_curriculum" id="" cols="30" rows="10"></textarea>
							</div> <br>
							<input type="hidden" value="test1" name="member_id"/>
							<div class="submit-btn"><input id="submit" type="submit" value="확인"/></div>
						</form>
					</div>	
					
					
					
				</div>
			</div>
		</div>
	</div>

<%@ include file="../include/footer.jsp" %>
	
	
	<script src="/jj9/resources/js/insertTalent.js"></script>
</body>
</html>