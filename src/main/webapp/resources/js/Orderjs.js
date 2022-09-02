function count(type)  {
  // 결과를 표시할 element
  const resultElement = document.getElementById('result');
  //화면출력돈
  const price = document.getElementById('price');
  //값 돈
  const price2 = document.getElementById('price2');
  
  // 현재 화면에 표시된 값
  let number = resultElement.innerText;
  const priceNumber = price.innerText;
  
  //버튼들
  const minusButton = document.getElementById('minus-button');
  

  const priceNumber2 = price2.innerText;
  let sum = 0;
  
  // 더하기/빼기
  if(type === 'plus') {
    number = parseInt(number) + 1;
    
  }else if(type === 'minus')  {
    number = parseInt(number) - 1;
    //0되면 버튼 못누르게
    
  }
 	console.log(priceNumber)
 	sum = parseInt(priceNumber2)*parseInt(number);
 
  // 결과 출력
  
  resultElement.innerText = number;
   
  price.innerText = sum;
  
  if( resultElement.innerText == '1'){
  	minusButton.disabled = true;
  }else{
  	minusButton.disabled = false;
  }
  
}

//ajax

const btn = document.getElementById('cupon-btn');

const xHttp = new XMLHttpRequest();

const select_cupone_name = document.getElementById('select-cupon-name');
const input_cupone_value = document.getElementById('input-cupon-value');

xHttp.addEventListener('readystatechange', (e)=>{
	
	const readystate = e.target.readyState;
    const responseText = e.target.responseText;
    
    if(readystate == 4){
    const coupon = JSON.parse(responseText);
    input_cupone_value.value = coupon.discount_percent; 
    }
});

select_cupone_name.addEventListener('change' ,(e)=>{
  //console.log('slect tag event:',e);
  //console.log('selected option:',e.target.value);
  xHttp.open('GET', '/jj9/couponlist/'+e.target.value);
  xHttp.send();
});
 



