
const avgnum = document.getElementById('avg-num');
const avgnumhtml = avgnum.innerHTML;

console.log(parseInt( avgnumhtml));

const avgimg = document.getElementById('avg-img');

if(0 == parseInt(avgnumhtml)){
	avgimg.src = "/jj9/resources/images/star/star0.PNG"
}else if(0<parseInt(avgnumhtml) && parseInt(avgnumhtml) <1){
	avgimg.src = "/jj9/resources/images/star/star1.PNG";
}else if(2<=parseInt(avgnumhtml)&& parseInt(avgnumhtml) <3){
	avgimg.src = "/jj9/resources/images/star/star2.PNG";
}else if(3<=parseInt(avgnumhtml)&& parseInt(avgnumhtml) <4){
	avgimg.src = "/jj9/resources/images/star/star3.PNG";
}else if(4<=parseInt(avgnumhtml)&& parseInt(avgnumhtml) <5){
	avgimg.src = "/jj9/resources/images/star/star4.PNG";
}else if(5==parseInt(avgnumhtml)){	
	avgimg.src = "/jj9/resources/images/star/star5.PNG";
}

console.log(avgimg.src);

const test = document.getElementById('window-button');
const popurl = document.getElementById('pop-url');

 var option = "width = 390, height = 400, top = 100, left = 450, location = no,tatus=no,toolbar=no,scrollbars=no"

test.addEventListener('click',(e)=>{
	console.log(popurl.innerHTML);
	window.open(popurl.innerHTML,'pop01',option);
});





