 
//// 공지사항 수정 form 모달

var exampleModal = document.getElementById('modifyNoticeModal')
exampleModal.addEventListener('show.bs.modal', function (event) {
  // Button that triggered the modal
  var button = event.relatedTarget
  // Extract info from data-bs-* attributes 

  var noticeId = button.getAttribute('data-notice-id')
  var noticeTitle = button.getAttribute('data-notice-title')
  var noticeContent = button.getAttribute('data-notice-content') 
  var noticeDate = button.getAttribute('data-notice-date') 
  var noticeImportance = button.getAttribute('data-notice-importance') 

  // If necessary, you could initiate an AJAX request here
  // and then do the updating in a callback.
  //
  // Update the modal's content.
  var modalTitle = exampleModal.querySelector('.modal-title')
  var newNoticeTitle = exampleModal.querySelector('.modal-body #new-notice-title')  
  var newNoticeContent = exampleModal.querySelector('.modal-body #new-notice-content')  
  var newNoticeDate = exampleModal.querySelector('.modal-body #new-notice-date')  
  var newNoticeImportance = exampleModal.querySelector('.modal-body #new-notice-importance') 
  var newNoticeId = exampleModal.querySelector('.modal-body #notice-id') 
  
  modalTitle.textContent = noticeId+'번 공지 수정';
  newNoticeTitle.value = noticeTitle;
  newNoticeContent.value = noticeContent;
  newNoticeDate.value = noticeDate;  
  newNoticeImportance.value = noticeImportance;
  newNoticeId.value = noticeId;
  
})
