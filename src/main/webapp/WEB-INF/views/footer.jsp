<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

*{
	font-family: 'Jua', sans-serif;
	font-size : 17px;
	box-sizing: border-box;
}

a:link {
	color: black;
	text-decoration: none;
}

div{
	display: block;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

li{
	list-style: none;
}

.footer1-wrap { /*mp4hix*/
	display: flex;
	flex-direction: column;
	width: 100%;
    margin-left: auto;
    margin-right: auto;
    background-color: #ffffff;
    position: relative;
    max-width: 1280px;
}

.footer1-menu{ /*hal1fa*/
	display: flex;
	flex-direction: row;
	-webkit-box-pack: justify;
	justify-content: space-between;
	padding-top: 32px;
    padding-bottom: 16px;
    width: 100%;
    max-width: 1200px;
	margin: 0 auto;
}

.footer1-menus{/*mtvqtk*/
	padding-left: 16px;
    padding-right: 16px;
	flex: auto;
}

.footer1-menus-cs{
	font-size: 16px;
    font-weight: bold;
    margin: 0 0 8px 0;
    line-height: 1.5;
    letter-spacing: -0.34px;
}


.footer1-menus-title{/*103556c*/
	margin: 0 0 16px 0;
    font-weight: 600;
    font-size: 0.920rem;
    line-height: 1.57;
    color: #212224;
}

.footer1-menus-ul{/* 1195nvm*/
	margin: 0;
	padding: 0;
}

.footer1-menus-li{

	margin: 0;
	padding: 0;



	font-family: "Metro Sans","Helvetica","Arial",sans-serif;
    font-weight: 400;
    font-size: 0.775rem;
    line-height: 1.43;
    letter-spacing: 0.15;
    margin: 0;
    color: #555969;
    text-align: inherit;
    margin-bottom: 8px;

	text-decoration: none;
    color: inherit;
    cursor: pointer;

}

.footer1-menus-workTime{
	font-family: sans-serif;
	font-size: 14px;
	color: gray;
	
}

.footer1-menus-request {
	border: solid black 1px;
	margin-top: 10px;
	padding: 8px;
	border-radius: 7px;
	font-size: 15px;
}

.footer1-menus-request:hover {
	background: rgb(247, 245, 245);
}

.footer1-menus-holiday {
	font-family: sans-serif;
	font-size: 14px;
	color: gray;
}

.footer2-area1{/* 12mnx47 */
	max-width: 1200px;
    text-align: center;
	margin: 16px auto 0 auto;
}

.footer2-area1-content{ /* rzeez2 */
	font-family: "Metro Sans","Helvetica","Arial",sans-serif;
	font-weight: 400;
	line-height: 1.43;
	margin: 0;
    color: #303441;
    text-align: inherit;
    font-size: 13px;
	margin: 16px auto 0 auto;
}

/*
.footer2-area1-contents{ lj40198 
	margin: 0 4px;
    font-size: 14px;
    color: #303441;
}

.footer2-area1-contents:after{
	content: '|';
}*/

.footer2-area2{ /* 1jeb6ex */
	padding: 16px;
    cursor: pointer;
    max-width: 1200px;
    text-align: center;
    margin: 0 auto;
}

.footer2-area2-content1{ /* 15tn6b5*/
	font-weight: 400;
    font-size: 0.75rem;
    line-height: 1.66;
	margin: 0;
	text-align: inherit;
    color: #9a9ba7;
}

.footer2-area2-content2{ /* f484kl */
	padding: 16px;
    cursor: pointer;
    max-width: 1200px;
    text-align: center;
    margin: 0 auto;
}

.footer2-area2-content2-p{
	padding: 16px;
    cursor: pointer;
    max-width: 1200px;
    margin: 0 auto;

	font-family: "Metro Sans","Helvetica","Arial",sans-serif;
    font-weight: 400;
    font-size: 0.75rem;
    line-height: 1.66;
    margin: 0;
    text-align: inherit;
    color: #c8cad2;
}

</style>
</head>
<body>


<footer>
		<hr /> 
		<div class="footer1-wrap">
			<nav class="footer1-menu">
				<div class="footer1-menus">
					<p class="footer1-menus-cs">고객센터</p>
					<p class="footer1-menus-workTime">09:00~18:00 (점심시간 13:00~14:00)</p>
					<p class="footer1-menus-holiday">주말, 공휴일 휴무</p>
					<a role="link" color="default" href="account/inquiry" class="footer1-menus-requestLink">
						<span class="footer1-menus-request">1:1 문의</span>
					</a>
				</div>
				
				<div class="footer1-menus">
					<p class="footer1-menus-title">jj9</p>
					<ul class="footer1-menus-ul">
						<li class="footer1-menus-li">jj9 메인</li>
						<li class="footer1-menus-li">Prime</li>
						<li class="footer1-menus-li">엔터프라이즈</li>
						<li class="footer1-menus-li">프리랜서클럽</li>
					</ul>
				</div>
				
				<div class="footer1-menus">
					<p class="footer1-menus-title">jj9 정보</p>
					<ul class="footer1-menus-ul">
						<li class="footer1-menus-li">서비스 소개</li>
						<li class="footer1-menus-li">인재영업</li>
					</ul>
				</div>

				<div class="footer1-menus">
					<p class="footer1-menus-title">관련 사이트</p>
					<ul class="footer1-menus-ul">
						<li class="footer1-menus-li">jj9 블로그</li>
						<li class="footer1-menus-li">jj9 인스타그램</li>
						<li class="footer1-menus-li">jj9 유튜브</li>
					</ul>
				</div>
				
				<div class="footer1-menus">
					<p class="footer1-menus-title">지원</p>
					<ul class="footer1-menus-ul">
						<li class="footer1-menus-li">공지사항</li>
						<li class="footer1-menus-li">자주 묻는 질문</li>
						<li class="footer1-menus-li">이용약관</li>
						<li class="footer1-menus-li">개인정보처리방침</li>
						<li class="footer1-menus-li">전문가 센터</li>
					</ul>
				</div>
	
			
			</nav>
		</div>
	<!-- footer2 -->
	
		<hr /> 
		<div class="footer2-area1">
			<p class="footer2-area1-content">
				(주)jj9 | 
				
				팀장 : 안승필 | 
				
				사이트 관리자 : 장몽운, 김도현, 홍준혁, 박성훈, 김은희 |
				
				고객센터 : 1234-5678 | 
				
				help@jj9
			</p>
		</div>
		
		<div class="footer2-area2">
			<p class="footer2-area2-content1">(주)jj9는 스프링 프로젝트를 위해 만들어진 사이트입니다. 실제 서비스가 아님을 유의해 주시기 바랍니다.</p>
			<div class="footer2-area2-content2">
				<p class="footer2-area2-content2-p">Copyright @ 2022 jj9 Inc. All rights reserved.</p>
			</div>
		</div>
	</footer>

</body>
</html>