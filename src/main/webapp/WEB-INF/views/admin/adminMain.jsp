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

<!-- 
<%= session.getAttribute("currUser") %>
 -->
 
<hr />
<a href=" <c:url value="/admin"/>">관리자 메인 페이지</a> <br />
<a href=" <c:url value="/categoryManage"/>">카테고리 관리</a> <br />
<a href="<c:url value="/memberManage"/>">회원 관리</a> <br />
<a href="<c:url value="/talentPermission"/>">재능등록 요청 관리</a><br />
<a href="<c:url value="/talentManage"/>">재능 관리</a><br />
<a href="<c:url value="/payLog"/>">결제 기록 조회</a><br />
<a href="<c:url value="/refundManage"/>">환불 요청 관리</a><br />
<a href="<c:url value="/couponManage"/>">쿠폰 관리</a><br />
<a href="<c:url value="/faqManage"/>">1:1 문의 관리</a><br />
<a href="<c:url value="/noticeManage"/>">공지 사항 관리</a><br />



<hr />


</body>
</html>