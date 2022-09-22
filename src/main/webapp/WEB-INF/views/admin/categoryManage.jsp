<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"	crossorigin="anonymous">
<link rel="stylesheet" href="/jj9/resources/css/adminMain.css?ver=1">

</head>
<body>
	<div class="inline">
		<h1 id="logo">
			<a href="./admin" class="jj9-logo">JJ9</a>
		</h1>
		<h3 id="logo-sub">관리자용</h3>
	</div>
	${currUser.member_id } 님 안녕하세요
	<br />


	<div class="thispage__main">
		<div class="main__container">
			<h2 class="main-container__title">카테고리 관리</h2>
			<div class="adminMenu flex">
				<div class="adminMenu__container">
					<ul class="adminMenu-container__ul">
						<li style="background-color: rgb(230, 70, 70);"><a
							href="./categoryManage">카테고리 관리</a></li>
						<li><a href="./memberManage">회원 관리</a></li>							
						<li><a href="./talentPermission">재능등록 요청 관리</a></li>
						<li><a href="./talentManage">재능 관리</a></li>
						<li><a href="./requestTalentManage">요청 재능 관리</a></li>
						<li><a href="./payLog">결제 기록 조회</a></li>
						<li><a href="./refundManage">환불 요청 관리</a></li>
						<li><a href="./couponManage">쿠폰 관리</a></li>
						<li><a href="./faqManage">1:1 문의 관리</a></li>
						<li><a href="./noticeManage">공지 사항 관리</a></li>
					</ul>
				</div>
				<div class="flex-column page-content">
					<div>
						<h1> 새 카테고리 등록 </h1>
						<form action="./addCategory" method="POST">
							새로운 id : <input type="number" name="cate_id" /> 메인 카테고리 : <input
								type="text" name="cate_main" /> 세부 카테고리 : <input type="text"
								name="cate_sub" /> <input type="submit" value="등록하기 " />
						</form>
					</div>
					<div>
						<hr />
						<h1> 카테고리 목록 </h1>

						<table border="1" class="content-table" style="margin: 20px">
							<th><h2 style="margin-top: 10px">&nbsp; id</h2></th>
							<th><h2 style="margin-top: 10px">메인 카테고리</h2></th>
							<th><h2 style="margin-top: 10px">세부 카테고리</h2></th>
						
							<c:forEach items="${categories }" var="category">
							
								<tr>
								    <td style="width: 100px; padding: 10px;">&nbsp; ${category.cate_id} </td>
								    <td style="width: 200px">${category.cate_main}</td>
								    <td style="width: 300px">${category.cate_sub}</td>
									<td>
										<button type="button" data-bs-toggle="modal"
											data-bs-target="#modifyCateModal"
											data-cate-id="${category.cate_id }"
											data-cate-main="${category.cate_main }"
											data-cate-sub="${category.cate_sub }">수정</button>
										<button class="deleteCateBtn" data-id=${category.cate_id } style="margin-right: 10px; margin-left:10px ">삭제</button>
									</td>
								</tr>		
													
							</c:forEach>
														
					    </table>						
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- modal 속성 구현-->
	<div class="modal fade" id="modifyCateModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">New message</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="./updateCategory" method="POST">
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">카테고리
								id</label> <input type="text" class="form-control" id="new-cate-id"
								name="cate_id">
						</div>
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">메인
								카테고리</label> <input type="text" class="form-control" id="new-cate-main"
								name="cate_main">
						</div>
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">세부
								카테고리</label> <input type="text" class="form-control" id="new-cate-sub"
								name="cate_sub">
						</div>
						<div>
							<input id="selectedCateId" type="text" hidden="true"
								name="pre_id" readonly>
						</div>
						<div class="modal-footer">
							<button type="submit" id="modifyConfirmBtn"
								class="btn btn-primary" data-bs-dismiss="modal">수정하기</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<br /><br /><br />



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="/jj9/resources/js/categoryManage.js?ver=1"></script>

</body>
</html>