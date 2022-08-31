<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jj9 회원가입 페이지</title>
</head>
<body>
	
	<script>
	
		var msg = "<c:out value='${msg}'/>";
	    var url = "<c:out value='${url}'/>";
	    alert(msg);
	    location.href = url;
	</script>
	
</body>
</html>