<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 카테고리 추가</title>
</head>
<body>
<h3>카테고리 관리 페이지입니다.</h3>
관리자 ${currUser.member_id } 님 안녕하세요 <br />
보유 포인트는 ${currUser.member_point } 점 입니다<br />

<hr />
<a href=" <c:url value="/admin"/>">관리자 메인 페이지</a> <br />
<a href=" <c:url value="/addCateForm"/>">카테고리 관리</a> <br />
<a href="<c:url value="/memberManagement"/>">회원 관리</a> <br />
<a href="">상품등록 요청 관리</a><br />

<hr />


<h4>- 새 카테고리 등록 -</h4>
<form action="./addCategory" method="POST">
	id : <input type="text" name="cate_id" />
	메인 카테고리 : <input type="text" name="cate_main" />
	세부 카테고리 : <input type="text" name="cate_sub" />
	<input type="submit" value="등록하기 "/>
</form>

<hr />

<h4>- 카테고리 목록 -</h4>
<ul>
	<c:forEach items="${categories }" var="category">
		<li>
			${category.cate_main} > ${category.cate_sub}
			 <a href="update?id=${category.cate_id }"><button>수정</button></a>
			 <a href="delete?id=${category.cate_id }"><button>삭제</button></a>
		</li>		
	</c:forEach>		
</ul>


</body>
</html>