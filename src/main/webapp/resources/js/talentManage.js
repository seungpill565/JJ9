
 
//// 재능 요청 상세정보 form 모달

var exampleModal = document.getElementById('talentDetailsModal')
exampleModal.addEventListener('show.bs.modal', function (event) {
  // Button that triggered the modal
  var button = event.relatedTarget
  // Extract info from data-bs-* attributes 

  var talentId = button.getAttribute('data-talent-id')
  var talentTitle = button.getAttribute('data-talent-title')
  var memberId = button.getAttribute('data-member-id') 
  var talentPrice = button.getAttribute('data-talent-price') 
  var talentDate = button.getAttribute('data-talent-date') 
  var talentServiceExp = button.getAttribute('data-talent-service-exp') 
  var talentCurriculum = button.getAttribute('data-talent-curriculum') 
  var talentWorkday = button.getAttribute('data-talent-workday') 
  var talentSummery = button.getAttribute('data-talent-summary') 
  var talentPaycount = button.getAttribute('data-talent-paycount') 
  

  // If necessary, you could initiate an AJAX request here
  // and then do the updating in a callback.
  //
  // Update the modal's content.
  var modalTitle = exampleModal.querySelector('.modal-title')
  var newTalentTitle = exampleModal.querySelector('.modal-body #new-talent-title')
  var newMemberId = exampleModal.querySelector('.modal-body #new-member-id')
  var newTalentPrice = exampleModal.querySelector('.modal-body #new-talent-price')
  var newTalentDate = exampleModal.querySelector('.modal-body #new-talent-date')
  var newTalentServiceExp = exampleModal.querySelector('.modal-body #new-talent-service-exp')
  var newTalentCurriculum = exampleModal.querySelector('.modal-body #new-talent-curriculum')
  var newTalentWorkday = exampleModal.querySelector('.modal-body #new-talent-workday')
  var newTalentSummery = exampleModal.querySelector('.modal-body #new-talent-summary')
  var newTalentPaycount = exampleModal.querySelector('.modal-body #new-talent-paycount')
  var newTalentId = exampleModal.querySelector('.modal-body #new-talent-id')
  

  modalTitle.textContent = '재능 요청 상세정보 (재능id: '+talentId+')';
  newTalentTitle.value = talentTitle;
  newMemberId.value = memberId;
  newTalentPrice.value = talentPrice;
  newTalentDate.value = talentDate;
  newTalentServiceExp.value = talentServiceExp;
  newTalentCurriculum.value = talentCurriculum;
  newTalentWorkday.value = talentWorkday;
  newTalentSummery.value = talentSummery;
  newTalentPaycount.value = talentPaycount;
  newTalentId.value = talentId;  


})
