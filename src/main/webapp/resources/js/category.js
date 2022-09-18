// view에서 JQuery 적용해야됨@@@@@@@@@@@@@@@

let moveForm = $("#moveForm");

var cate_id = document.location.href.split("category/"); // url에서 category/ 기준으로 자른 문자열을 배열로 반환
console.log(cate_id) // cate_id[0], [1] 출력

console.log('cate_id[1]  : ' + cate_id[1]); // 필요한건 cate_id 이므로 para[1] 확인 


$(".pageInfo a").on("click", function(e){

	// .find() : 해당하는 요소를 선택
	// .val()  : 해당 변수의 value를 다시 설정
 	// .attr(a) : 선택된 요소 집합에서 첫번째 요소의 attributeName에 해당하는 속성값을 반환한다.
 	// $(this) : 1 ~ 10까지 페이징 번호 중 내가 누른 번호에 해당하는 것만 선택한다.
 	
	e.preventDefault(); // a링크의 동작을 멈춘다 / 멈춰야 hidden form 으로 페이지 번호와 표시개수를 보낼 수 있고 페이지네이션이 작동한다
	moveForm.find("input[name='pageNum']").val($(this).attr("href")); // input 요소 중 name이 pageNum 인 것을 선택 > 해당 value를 내가 선택한 페이지의 a 링크 경로로 설정 ( ${num}이다)
	moveForm.attr("action",cate_id[1]); // moveform 요소에 action 속성을 추가하고 속성의 값은 uri다
	moveForm.submit();
        
});

let mainSearchForm = $("#mainSearchForm");




$(".search_area button").on("click", function(e){
	const keyword = $("#searchKeyword")
	if(keyword != null){
		console.log('keyword : '+keyword);
		e.preventDefault(); // 일단 버튼의 기능을 막고
		mainSearchForm.find("input[name='pageNum']").val(1); // 페이징 번호를  1로 지정
		mainSearchForm.attr("action", "/jj9/search");
		mainSearchForm.submit();
	}else{
		
	}
	
});



//  $(".search_area button").keypress(function(e){
 		
//  		if(e.keyCode == 13){

	        // e.preventDefault(); // 일단 버튼의 기능을 막고
	        // let val = $("input[name='searchText']").val(); // name이 keyword인 input 요소를 찾아서 val로 선언 / 내가 검색한 단어 /
	        // mainSearchForm.find("input[name='keyword']").val(val); // moveform의 인풋 요소에 값을 내가 검색한 단어로 지정
	        // console.log("keyword : " + val);
	        // mainSearchForm.find("input[name='pageNum']").val(1); // 페이징 번호를  1로 지정
	        // mainSearchForm.attr("action", "/jj9/search");
	        // mainSearchForm.submit();	
//         }
// });
	
