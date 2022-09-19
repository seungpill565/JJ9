<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/jj9/resources/css/insertTalent.css">
<meta charset="UTF-8">
<title>jj9 - 재능 등록하기</title>
</head>
<body>

	<div class="top-menu">
		<div class="top-row">
			<div><a href="#" class="local-font">jj9</a></div>
		</div>
	</div>

	<div id="sub-title">
		<h3>재능 등록하기</h3>
	</div>
	
	
	<div class="content-body">	
		<form action="./insert" method="POST" enctype="multipart/form-data">
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
				<div class="col-name">가격</div> <input type="number" name="talent_price"/>
			</div> <br>
			<div class="colcol">
				<div class="col-name">작업기간(일)</div> <input type="number" name="talent_workday"/>
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
			<input type="hidden" value="1" name="member_id"/>
			<div><input id="submit" type="submit" value="확인"/></div>
		</form>
	</div>	
	<!--  <input type="textarea" name="talent_service_exp"/> 
	<input type="textarea" name="talent_curriculum"/>
	--> 
	
	
	<script src="/jj9/resources/js/insertTalent.js"></script>
</body>
</html>