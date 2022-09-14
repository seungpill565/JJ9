
  const resultElement = document.getElementById('result');
  const price = document.getElementById('price');
  const price2 = document.getElementById('price2');

  let number = resultElement.innerText;
  const priceNumber = price.innerText;
  
  const minusButton = document.getElementById('minus-button');
  
  const priceNumber2 = price2.innerText;
  let sum = 0;
  
  const total_service = document.getElementById('total-service');//총 서비스 금액
  



let total_pay = document.getElementById('total-pay');// 총 결제 금액
const select_cupone_name = document.getElementById('select-cupon-name');
const input_cupone_value = document.getElementById('input-cupon-value');
const dispay = document.getElementById('dis-pay');






  
function count(type)  { 
  if(type === 'plus') {
    number = parseInt(number) + 1;
    select_cupone_name.value = 0;
    input_cupone_value.value = "선택하신  쿠폰이 없습니다.";
    dispay.innerText =0;
    
  }else if(type === 'minus')  {
    number = parseInt(number) - 1;
    select_cupone_name.value = 0;
    input_cupone_value.value = "선택하신  쿠폰이 없습니다.";
    dispay.innerText =0;
    
  }
 	console.log(priceNumber)
 	sum = parseInt(priceNumber2)*parseInt(number);
 
  resultElement.innerText = number;
  
   
  price.innerText = sum;
  total_service.value = sum;
  total_pay.value = sum;
 
  
  
  
  if( resultElement.innerText == '1'){
  	minusButton.disabled = true;
  }else{
  	minusButton.disabled = false;
  }
}
  


//ajax

const btn = document.getElementById('cupon-btn');

const xHttp = new XMLHttpRequest();




let discount;


xHttp.addEventListener('readystatechange', (e)=>{
	
	const readystate = e.target.readyState;
    const responseText = e.target.responseText;
    
    
    if(readystate == 4){
    const coupon = JSON.parse(responseText);
      if(select_cupone_name.value == 0){
        input_cupone_value.value = 0;
      }else{
        input_cupone_value.value = coupon.discount_percent;
      }
	    
	    
	    discount = input_cupone_value.value;
	    console.log(discount);
	    dispay.innerText = price.innerText*(discount/100); // 쿠폰 할인 금액 ..
	    const httpStatus = e.target.httpStatus;
		total_pay.value = parseInt(price.innerText) - parseInt(dispay.innerText);
   	
	   
	   
    }
    
    
});

	select_cupone_name.addEventListener('change' ,(e)=>{
	  	xHttp.open('GET', '/jj9/couponlist/'+e.target.value);
	  	xHttp.send();
	});
	



