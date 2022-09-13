

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
 
//// 카테고리수정 form 모달

var exampleModal = document.getElementById('modifyCateModal')
exampleModal.addEventListener('show.bs.modal', function (event) {
  // Button that triggered the modal
  var button = event.relatedTarget
  // Extract info from data-bs-* attributes 

  var cateId = button.getAttribute('data-cate-id')
  var cateMain = button.getAttribute('data-cate-main')
  var cateSub = button.getAttribute('data-cate-sub') 

  // If necessary, you could initiate an AJAX request here
  // and then do the updating in a callback.
  //
  // Update the modal's content.
  var modalTitle = exampleModal.querySelector('.modal-title')
  var newCateId = exampleModal.querySelector('.modal-body #new-cate-id')
  var newCateMain = exampleModal.querySelector('.modal-body #new-cate-main')
  var newCateSub = exampleModal.querySelector('.modal-body #new-cate-sub')
  
  var selectedCateId = exampleModal.querySelector('.modal-body #selectedCateId')

  modalTitle.textContent = '카테고리 수정하기 (' + cateMain +'>'+ cateSub+ ')';
  newCateId.value = cateId;
  newCateMain.value = cateMain;
  newCateSub.value = cateSub;
  
  selectedCateId.value = cateId;
})
