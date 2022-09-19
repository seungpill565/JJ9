
 
//// 재능 요청 상세정보 form 모달

var exampleModal = document.getElementById('talentDetailsModal')
exampleModal.addEventListener('show.bs.modal', function (event) {
  // Button that triggered the modal
  var button = event.relatedTarget
  // Extract info from data-bs-* attributes 

  var talentId = button.getAttribute('data-talent-id')

  var talentTitle = button.getAttribute('data-talent-title')
  var talentContent = button.getAttribute('data-talent-content')
  var memberId = button.getAttribute('data-member-id') 
  var talentDate = button.getAttribute('data-talent-date') 
  var talentDeadline = button.getAttribute('data-talent-deadline') 
  var talentBudget = button.getAttribute('data-talent-budget') 
 
  var talentCateid = button.getAttribute('data-talent-cate-id') 
  var talentCateMain = button.getAttribute('data-talent-cate-main') 
  var talentCateSub = button.getAttribute('data-talent-cate-sub') 
  
  

  // If necessary, you could initiate an AJAX request here
  // and then do the updating in a callback.
  //
  // Update the modal's content.
  var modalTitle = exampleModal.querySelector('.modal-title')

  var newTalentTitle = exampleModal.querySelector('.modal-body #new-talent-title')
  var newTalentCate = exampleModal.querySelector('.modal-body #new-talent-cate')
  var newTalentContent = exampleModal.querySelector('.modal-body #new-talent-content')
  var newMemberId = exampleModal.querySelector('.modal-body #new-member-id')
  var newTalentDate = exampleModal.querySelector('.modal-body #new-talent-date')
  var newTalentDeadline = exampleModal.querySelector('.modal-body #new-talent-deadline')
  var newTalentBudget = exampleModal.querySelector('.modal-body #new-talent-budget')
  var newTrequestId = exampleModal.querySelector('.modal-body #new-trequest-id')
  
  

  modalTitle.textContent = '재능 요청 상세정보 (요청 번호 : '+talentId+')';
  newTalentTitle.value = talentTitle;
  newTalentCate.value = talentCateMain+'('+talentCateSub+')';
  newTalentContent.value = talentContent;
  newMemberId.value = memberId;
  newTalentDate.value = talentDate;
  newTalentDeadline.value = talentDeadline;
  newTalentBudget.value = talentBudget;

  newTrequestId.value = talentId;

})
