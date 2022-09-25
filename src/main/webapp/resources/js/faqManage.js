 
//// 회원수정 form 모달

var exampleModal = document.getElementById('answerFaqModal')
exampleModal.addEventListener('show.bs.modal', function (event) {
  // Button that triggered the modal
  var button = event.relatedTarget
  // Extract info from data-bs-* attributes 

  var faqId = button.getAttribute('data-faq-id')
  var faqCate = button.getAttribute('data-faq-cate') 
  var faqTitle = button.getAttribute('data-faq-title')
  var faqContent = button.getAttribute('data-faq-content') 
  var faqDate = button.getAttribute('data-faq-date') 
  var memberId = button.getAttribute('data-member-id') 
  var faqAnswer = button.getAttribute('data-faq-answer') 

  // If necessary, you could initiate an AJAX request here
  // and then do the updating in a callback.
  //
  // Update the modal's content.
  var modalTitle = exampleModal.querySelector('.modal-title')
  var modalTitle2 = exampleModal.querySelector('.modal-title2')
  var newFaqCate = exampleModal.querySelector('.modal-body #new-faq-cate')  
  var newFaqId = exampleModal.querySelector('.modal-body #new-faq-id')  
  var newFaqContent = exampleModal.querySelector('.modal-body #new-faq-content')  
  var newFaqDate = exampleModal.querySelector('.modal-body #new-faq-date')  
  var newFaqAnswer = exampleModal.querySelector('.modal-body #new-faq-answer') 
  var FaqId = exampleModal.querySelector('.modal-body #faq-id') 
  
  modalTitle.textContent = faqTitle;
  modalTitle2.textContent = '작성자 : ' + memberId;
  newFaqId.innerHTML = faqId;
  newFaqCate.innerHTML = faqCate;
  newFaqDate.innerHTML = faqDate;  
  newFaqContent.value = faqContent;
  newFaqAnswer.value = faqAnswer; 
  FaqId.value = faqId;
  
  
})
