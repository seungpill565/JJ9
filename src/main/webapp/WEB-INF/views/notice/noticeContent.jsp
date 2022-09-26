<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jj9</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script> <!--  jquery -->
<link rel="stylesheet" href="/jj9/resources/css/category.css?ver=1" />
<link rel="stylesheet" href="/jj9/resources/css/notice.css?ver=1" />

</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
	
	
		

	<!-- body -->

	<section class="body-section">
		<div class="body-div">		
		
			<h1 style="font-size: 50px;">공지사항</h1>
			
			
			<hr style=" width: 100%; margin-top: -20px;"><hr />
			<table id="notice-content-table" style="border: 1px solid black;">
				<tbody>
					<tr>
						<th style="background-color: grey; color: white; font-size: 30px">${notice.notice_title}</th>
					</tr>
					<tr>
						<td class="fontGray_666 font_12" style="font-size: 20px; padding-left: 30px">등록일 : ${notice.notice_date}</td>
					</tr>
					<tr style="height: 500px;">
						<td style=" font-size: 25px; border-top: 2px solid grey; padding: 50px 20px;">
							<div style="white-space:pre-wrap; max-width: 950px; font-size: 25px">
								${notice.notice_content}
							
							</div>							
						</td>
					</tr>
				</tbody>
			</table>
	<button style="width: 150px; height: 40px; margin: 20px 60px; border: grey 2px solid"
		onclick="location.href= './notice'"
	>목록으로</button>
					
		</div>		
	</section>

	<!-- footer -->
<%@ include file="../footer.jsp" %>
	

<script src="https://kit.fontawesome.com/a202e204ec.js" crossorigin="anonymous"></script>

</body>
</html>




