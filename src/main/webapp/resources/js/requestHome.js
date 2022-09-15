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
