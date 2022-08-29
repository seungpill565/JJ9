<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	img {
		width: 100px;
	}
</style>
</head>
<body>

	<h3>Ajax Index</h3>
	
	<h5>static resource mapping</h5>
	
	<p>
		정적 자원들은 webapp/resources/에 보관하고 /resources/** uri로 접근하면 된다
		(servlet-context의 내용을 참조)
	</p>
	
	<img src="https://static.hubzum.zumst.com/hubzum/2020/08/21/10/16af61affa8841f58caaedd241064824.jpg"/>
	<img src="/restful/resources/images/penguin.jpg"/>

	<hr>

	<button id="btn-xhttp">XHttp 요청 보내기</button> <br>

	<hr>

	name: 
		<select id="select-pizza-name" name="name">
			<option value="null">DB에서 가져온 피자 이름들을 넣기</option>
			<c:forEach items="${pizzas }" var="pizza">
				<option value="${pizza.id }">${pizza.name }</option>
			</c:forEach>
		</select> <br>
	price: 		<input type="number" id="input-pizza-price" placeholder="피자를 선택하면 값이 채워집니다."> <br>
	calories: 	<input type="number" id="input-pizza-calories" placeholder="피자를 선택하면 값이 채워집니다."> <br>
	pizza id: 	<input type="number" id="input-pizza-id" placeholder="피자를 선택하면 값이 채워집니다."> <br>
	<input id="input-pizza-name" type="hidden"/>
	<button id="btn-xhttp-put">XHttp PUT 해보기 (Update)</button>

	<hr>
	
	<div id="out2">아직 수정 전입니다.</div>
	
	<hr>
	
	price: 		<input type="number" id="post-pizza-price"> 	<br>
	calories: 	<input type="number" id="post-pizza-calories"> 	<br>
	name: 		<input type="text"  id="post-pizza-name"/> 		<br>
	
	<button id="btn-xhttp-post">XHttp POST 해보기 (Insert)</button>
	
	<hr>
	
	<div id="out3">아직 추가 전입니다.</div>
	
	<hr>

	<div id="out"></div>

	<script src="/restful/resources/js/ajax.js"></script>

</body>
</html>