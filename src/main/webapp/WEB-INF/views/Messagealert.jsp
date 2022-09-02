<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script>
    var msg = "<c:out value='${msg}'/>";
    var url = "<c:out value='${url}'/>";
    alert(msg)
    if(msg == "쪽지를 보내셨습니다."){
    	self.close();	
    }else{
    	location.href = url;	
    }
    
    
	</script>

</body>
</html>