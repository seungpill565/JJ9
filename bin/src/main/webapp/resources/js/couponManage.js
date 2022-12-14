


//// 삭제버튼
var deleteCateBtns = document.querySelectorAll('.deleteCateBtn');
[].forEach.call(deleteCateBtns, function(deleteCateBtn){
  deleteCateBtn.addEventListener("click" , deleteCate , false );
});


function deleteCate(e){
  const del = window.confirm("삭제하시겠습니까?");
  
  if (del){
    console.log('삭제 true 들어옴');
    const btnCateId = e.target.dataset.id;
    console.log('눌린 버튼 id : ' + btnCateId);
    location.href = './deleteCategory?id='+btnCateId;
  }
}

//// 쿠폰생성 form 모달

var exampleModal = document.getElementById('createCouponModal')
exampleModal.addEventListener('show.bs.modal', function (event) {
  // Button that triggered the modal
  var button = event.relatedTarget
  // Extract info from data-bs-* attributes 

  var random_code = button.getAttribute('data-random-code')  

  // If necessary, you could initiate an AJAX request here
  // and then do the updating in a callback.
  //
  // Update the modal's content.
  
  var newCouponCode = exampleModal.querySelector('.modal-body #new-coupon-code')
  var inputDate = exampleModal.querySelector('.modal-body #input-date')
  newCouponCode.value = random_code;  

  //기본값으로 한달 뒤 날짜로 설정
  var date = new Date()
  date.setMonth(date.getMonth() + 1)
  document.getElementById('input-date').value = date.toISOString().substring(0, 10); 
 
})
