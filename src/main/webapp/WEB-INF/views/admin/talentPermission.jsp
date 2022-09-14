<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재능 등록 요청 관리</title>
</head>
<body>

	<h3>재능 등록 요청 관리 페이지입니다.</h3>
	관리자 ${currUser.member_id } 님 안녕하세요 <br />	
	
	<hr />
	<a href=" <c:url value="/admin"/>">관리자 메인 페이지</a> <br />
	<a href=" <c:url value="/categoryManage"/>">카테고리 관리</a> <br />
	<a href="<c:url value="/memberManage"/>">회원 관리</a> <br />
	<a href="<c:url value="/talentPermission"/>">재능등록 요청 관리</a><br />
	<a href="<c:url value="/talentManage"/>">재능 관리</a><br />
	<a href="<c:url value="/payLog"/>">결제 기록 조회</a><br />
	<a href="<c:url value="/refundManage"/>">환불 요청 관리</a><br />

	<hr />
	<h4>- 등록 요청 목록 -</h4>
	<ul>
	<c:forEach items="${talents }" var="talent">
		<li>
		${talent.talent_id}	/${talent.talent_title} / ${talent.member_id} / ${talent.talent_date}
			 <a href="permissionTalent?id=${talent.talent_id }"><button>등록</button></a>
			 <a href="deleteTalent?id=${talent.talent_id }"><button>삭제</button></a>
		</li>		
	</c:forEach>		
	</ul>

</body>
</html>