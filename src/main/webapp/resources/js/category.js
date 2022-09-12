//<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


//const cate_id = document.getElementById('');



//<c:forEach items="${categorys}" var="category">
	//alert("${category.cate_id}");	// �쐞�뿉 list�굹 蹂��닔瑜� �꽑�뼵�븯怨� alert �옄由ъ뿉 �떞�쑝硫� 李⑤�����濡� 媛믪쓣 諛쏅뒗�떎.

//</c:forEach>

let moveForm = $("#moveForm");

var para = document.location.href.split("category/");
console.log(para)

const link = window.location.pathname;
console.log(link);

console.log('para[1]  : ' + para[1]);
console.log("test");
console.log('test1');

$(".pageInfo a").on("click", function(e){
 
	e.preventDefault();
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	moveForm.attr("action", "/jj9/category/"+para[1]);
	moveForm.submit();
        
});
