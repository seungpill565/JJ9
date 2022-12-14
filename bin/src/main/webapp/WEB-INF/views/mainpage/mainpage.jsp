<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jj9</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script> <!--  jquery -->
<link rel="stylesheet" href="/jj9/resources/css/category.css?ver=1" />

</head>
<body>

	<!-- header -->
	<div class="main-header">
		<!-- section1 -->
		<section class="header-section1">
			<div class="logo-div">	
				<a href="/jj9/mainpage" class="jj9-mainpage">jj9</a>
			</div>
			<div class="login-register-div">
				<div class="login-register-div-login">
			 		<a href="login" class="member-login">로그인</a>
			 	</div>
			 	<div class="login-register-div-register">  
			 		<a href="register" class="member-register">회원가입</a>
			 	</div>
			</div>
		</section>
		<!-- section1 -->
		
		<!-- section2 -->
		<section class="header-section2">
		<!-- 카테고리 -->

				<div class="mainPage-mainCategory-div">
            <button class="category-button">
                <div class="category-menu-img"></div>
                <span style="font-size:20px;">메인 카테고리</span>
            </button>
            <div class="mainCategory-div">
                <c:forEach items="${mainCates }" var="maincategory" varStatus="status">
                    <div id="mainCategory-div${status.count }" class="mainCategory-div2"> 
                        <a href="/jj9/category/${maincategory.cate_id }" id="mainCategory-a"> ${maincategory.cate_main } ▼</a>
                    <div class="subCategory-div">
                        <c:set var="sub" value="sub${status.count}" />
                        <c:forEach items="${requestScope[sub] }" var="sub" varStatus="status2">
                            <a href="/jj9/category/${sub.cate_id }" id="subCategory-a${status2.count }" class="subCategory-a">${sub.cate_sub }</a>
                        </c:forEach>
                    </div>
                    </div>
                </c:forEach>
            </div>
        </div>
		
		<!-- 카테고리 -->
		
		<!-- 검색 기능 -->
		<div class="search_wrap">
			<div class="search_area">
				<form id="mainSearchForm" name="searchForm" method="get">
					<input type="text" id="searchKeyword" name="keyword" value="${page.cri.keyword }" placeholder="재능을 검색하세요.">
						<button class="searchButton">검색</button>
					<input type="hidden" name="pageNum" value="${page.cri.pageNum }">
					<input type="hidden" name="amount" value="${page.cri.amount }">
				</form>
			</div>
		</div>
		<!-- /검색 기능 -->
		<div class="insert-register-div">
			<div class="talent-insert">
				 <a href="insert">재능 등록하기 </a> <br />
			</div>

			<div class="talent-request">
				 <a href="req/1">재능 의뢰하기 </a> <br />
			</div>
		</div>

		</section>


	</div>
	<hr />
	<!-- header -->

	<!-- body -->

	<section class="body-section">
		<div class="body-div">
			<div class="howToUsejj9-div"></div>
			<div class="best-new-div1">
					<div class="best-new-div2">
						<div class="best-new-talent-title best-new-div2-item">
							<span id="best-new">NEW</span>
							<span id="talent"> 재능</span>
						</div>
						<div>
						</div>
						<div class="best-new-div3">
						<c:forEach items="${newpurchases }" var="newpurchase">
							<div class="best-new-talent-div">
							<div class="best-new-talent">
								<a href="purchase/${newpurchase.talent_id }">
									
										<img class="best-new-talent-image" src=""></img>
										<div class="best-new-talent-title2">${newpurchase.talent_title }</div>
										<div class="best-new-talent-price">가격 : ${newpurchase.talent_price }</div>
										<div class="best-new-talent-seller">판매자 :	${newpurchase.member_id }</div>
										</a>
									</div>
							
							</div>

						</c:forEach>
						</div>
					</div>


					<div class="best-new-div2">
						<div class="best-new-talent-title best-new-div2-item">
							<span id="best-new">BEST</span>
							<span id="talent"> 재능</span>
						</div>
						<div>
						</div>
						<div class="best-new-div3">
						<c:forEach items="${bestpurchases }" var="bestpurchase">
							<div class="best-new-talent-div">
							<div class="best-new-talent">
								<a href="purchase/${bestpurchase.talent_id }">
									
										<img class="best-new-talent-image" src=""></img>
										<div class="best-new-talent-title2">${bestpurchase.talent_title }</div>
										<div class="best-new-talent-price">가격 : ${bestpurchase.talent_price }</div>
										<div class="best-new-talent-seller">판매자 :	${bestpurchase.member_id }</div>
										</a>
									</div>
							
							</div>

						</c:forEach>
						</div>
					</div>
				</div>
		</div>
		<!-- best-new-div1 -->
	</section>
	<!-- /body -->
	

	<!-- footer -->
<%@ include file="../footer.jsp" %>
	
<script src="/jj9/resources/js/category.js?ver=1"></script>
<script>

	var main = new Array();
	<c:forEach items="${maincategorys }" var="maincategory">
		main.push({cate_id:"${maincategory.cate_id}"
					,cate_main:"${maincategory.cate_main}"});
	</c:forEach>
	
	var subAll = new Array();
	<c:forEach items="${subcategorys }" var="subcategory">
		subAll.push({cate_id:"${subcategory.cate_id}"
					,cate_main:"${subcategory.cate_main}"
					,cate_sub:"${subcategory.cate_sub}"});
	</c:forEach>
	
	for(var i=0;i<main.length;i++){ // 속성값 수정 및 요소 텍스트 수정
 		$('.fortest').attr("href", "/jj9/category/"+main[i].cate_id);
 		$('.fortest').text(main[i].cate_main);
	}

 	
	
	
	var box=document.getElementById('mainCategory-a');
	
	//box.addEventListener('mouseover')
	
	console.log(main[0].cate_main)
	console.log(main[0])
	
	////////////////////////////////////////////////////////////
	
	var main1 = "${maincategorys[1].cate_main}"
	console.log("main1 test :  " + main1);
	


	var testarr = new Array();
	for (i = 1; i < 8; i++)
        (function(i) {
            var main11 = document.getElementById('mainCategory-div'+i).innerHTML;
            testarr.push(main11);
            console.log('메인카테고리 들어오는지? : ' + testarr[i-1]);

            $('#mainCategory-div' + i).on('mouseover', function() {
                console.log(testarr[i-1]);

                    for (var j = 0; j < subAll.length; j++) {
                        if (testarr[i-1] == subAll[j].cate_main) {
                        	console.log('i : '+ (i-1))
                        	for(k=0;k<5;k++){
                            	//$('.subCategory-a'+k).attr('href', '/jj9/category/'+subAll[j].cate_id);
                            	
                        	}
                        }
                    }
                }).mouseout(function() {
                })
        })(i);
	/*
	for (var i = 1; i < 8; i++) {
		$('#mainCategory-span' + i).on('mouseover', function() {
			
			
			for (var j = 0; j < subAll.length; j++) {
				if (testarr[i-1] == subAll[j].cate_main) {
					$('.test1').text(subAll[j].cate_sub);	
				}
			}
		}).mouseout(function() {
		})
	}
	*/
</script>

</body>
</html>






























<!-- 검색 기능 
		<div class="search_wrap">
			<div class="search_area">
				<form id="mainSearchForm" name="searchForm" method="get">
					<select name="type">
						<option value=""
							<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
						<option value="title"
							<c:out value="${pageMaker.cri.type eq 'title'?'selected':'' }"/>>제목</option>
						<option value="content"
							<c:out value="${pageMaker.cri.type eq 'content'?'selected':'' }"/>>내용</option>
						<option value="writer"
							<c:out value="${pageMaker.cri.type eq 'writer'?'selected':'' }"/>>전문가</option>
					</select> 
						<input type="text" id="searchKeyword" name="keyword" value="${page.cri.keyword }" placeholder="재능이나 전문가를 검색하세요.">
						<button>Search</button>
					
					<input type="hidden" name="pageNum" value="${page.cri.pageNum }">
					<input type="hidden" name="amount" value="${page.cri.amount }">
				</form>
			</div>
		</div>
 /검색 기능 -->