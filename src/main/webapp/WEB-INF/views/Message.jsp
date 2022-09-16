<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/jj9/resources/css/Messagecss.css">
</head>
<body>
	
	<h1 id="logo">jj9</h1>
	
 	<form action="info" method="POST">
	 	<div>제목</div>
	 	 <input type="text" name="message_name" value="" >
	 	 <div>받는 사람</div>
	 	 <input type="text" name="sender_id" value="${id.member_id }"readonly="readonly">
	 	 <div>내용</div>
	 	 <textarea id="text-area" rows="5" cols="40" name="message_content"></textarea>
	 	 <div id="text-cnt">(0/100)</div>
	 	 <input id="message-button" type="submit" value="전송">
 	</form>
	
	 <script>
 
    $(document).ready(function() {
        $('#text-area').on('keyup', function() {
            $('#text-cnt').html("("+$(this).val().length+" / 100)");
 
            if($(this).val().length > 100) {
                $(this).val($(this).val().substring(0, 100));
                $('#text-cnt').html("(100 / 100)");
            }
        });
    });
        
    </script>
	
	

</body>
</html>