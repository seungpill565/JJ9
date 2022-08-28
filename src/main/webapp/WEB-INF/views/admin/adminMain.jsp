<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>

<h3>관리자 페이지입니다.</h3>
관리자 ${currUser.member_id } 님 안녕하세요 <br />
보유 포인트는 ${currUser.member_point } 점 입니다<br />

<%= session.getAttribute("currUser") %>
 
<hr />
<a href=" <c:url value="/addCateForm"/>">카테고리 등록</a> <br />
<a href="<c:url value="/deleteCateForm"/>">카테고리 삭제</a> <br />
<a href="<c:url value="/memberManagement"/>">회원 관리</a> <br />
<a href="">상품등록 요청 관리</a><br />

<hr />


</body>
</html>