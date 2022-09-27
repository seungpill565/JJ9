<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${reqAll.trequest_title }</title>
</head>
<body>
	
	<div>jj9</div>

	<h5>${reqAll.cate_main} / ${reqAll.cate_sub }</h5>
	<h1>${reqAll.trequest_title }</h1>
	<br>
	
	<h4>구체적 내용</h4>
	${reqAll.trequest_content }
	<br>
	<br>
	
	<h4>프로젝트 작업 마감 일자</h4>
	${reqAll.trequest_deadline }
	<br>
	<br>
	
	<div>
	
	<h4>예산</h4>
	<h2><fmt:formatNumber value="${reqAll.trequest_budget }" groupingUsed="true" /> 원</h3>
	<button>제안하기</button>
	</div>
	
	
	
	
<%@ include file="../footer.jsp" %>








</body>
</html>