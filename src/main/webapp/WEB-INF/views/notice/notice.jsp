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
			<h1 style="font-size: 20px;">총 ${noticesCount} 개의 공지사항</h1>
			<div class="notice-list" style="background-color: #f7c7c7;">
			
				<table  class="content-table" style="border:none; margin: 20px; margin-left: 5%">
					
					
												
				
					<c:forEach items="${notices1 }" var="notice">
					
						<tr class="notice1-part" style="border-bottom: 1px solid black">
						    
						    <td style="width: 80%">
						    	<button type="button" class="btn btn-outline-secondary" 
									data-notice-id = "${notice.notice_id }"
									data-notice-title = "${notice.notice_title }"
									data-notice-content = "${notice.notice_content }"
									data-notice-date = "${notice.notice_date }"
									data-notice-importance = "${notice.notice_importance }"				
									style="margin-right: 10px; margin-left:10px; font-size: 25px;"
									onclick="location.href= './noticeContent?id=${notice.notice_id }'" 
								 ><i class="fa-solid fa-triangle-exclamation"></i> ${notice.notice_title} </button></td>
							<td style="font-size: 25px;">${notice.notice_date}</td>
						   		   
							
						</tr>													
					</c:forEach>	
					</table>	
					<table class="content-table" style="border:none; margin-top: -20px; margin-left: 5%; margin-right: 20px; border-top: none; border-bottom: none;">	
							
							<c:forEach items="${notices2 }" var="notice">
							
							<tr class="notice1-part" style="border-bottom: 1px solid black">
							    
							    <td style="width: 80%">
							    	<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#modifyNoticeModal"
										data-notice-id = "${notice.notice_id }"
										data-notice-title = "${notice.notice_title }"
										data-notice-content = "${notice.notice_content }"
										data-notice-date = "${notice.notice_date }"
										data-notice-importance = "${notice.notice_importance }"				
										style="margin-right: 10px; margin-left:10px; font-size: 25px;"
										onclick="location.href= './noticeContent?id=${notice.notice_id }'" 
									 ><i class="fa-regular fa-star"></i> ${notice.notice_title} </button></td>
								<td style="font-size: 25px;">${notice.notice_date}</td>	 
							    			   
								
							</tr>														
							</c:forEach>
							</table>
							
							<table class="content-table" style="border:none;margin: 0px 20px; margin-left: 5%">
							<c:forEach items="${notices3 }" var="notice">
							
							<tr class="notice1-part" style="border-bottom: 1px solid black">
							    
							    <td style="width: 80%">
							    	<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#modifyNoticeModal"
										data-notice-id = "${notice.notice_id }"
										data-notice-title = "${notice.notice_title }"
										data-notice-content = "${notice.notice_content }"
										data-notice-date = "${notice.notice_date }"
										data-notice-importance = "${notice.notice_importance }"				
										style="margin-right: 10px; margin-left:10px; font-size: 25px;"
										onclick="location.href= './noticeContent?id=${notice.notice_id }'" 
									 >${notice.notice_title} </button></td>
								<td style="font-size: 25px;">${notice.notice_date}</td>
							   		   
								
							</tr>													
							</c:forEach>							
														
					    </table>		
			
			</div>
					
		</div>		
	</section>
	

	<!-- footer -->
<%@ include file="../footer.jsp" %>
	

<script src="https://kit.fontawesome.com/a202e204ec.js" crossorigin="anonymous"></script>

</body>
</html>




