 
//// 회원수정 form 모달

var exampleModal = document.getElementById('modifyMemberModal')
exampleModal.addEventListener('show.bs.modal', function (event) {
  // Button that triggered the modal
  var button = event.relatedTarget
  // Extract info from data-bs-* attributes 

  var memberId = button.getAttribute('data-member-id')
  var memberEmail = button.getAttribute('data-member-email')
  var memberPhoneNum = button.getAttribute('data-member-phoneNum') 
  var memberBirthday = button.getAttribute('data-member-birthday') 
  var memberName = button.getAttribute('data-member-name') 
  var memberNickName = button.getAttribute('data-member-nickName') 
  var memberComments = button.getAttribute('data-member-comments') 
  var memberPoint = button.getAttribute('data-member-point') 

  console.log(memberEmail);

  // If necessary, you could initiate an AJAX request here
  // and then do the updating in a callback.
  //
  // Update the modal's content.
  var modalTitle = exampleModal.querySelector('.modal-title')
  var newMemberId = exampleModal.querySelector('.modal-body #new-member-id')
  var newMemberMail = exampleModal.querySelector('.modal-body #new-member-email')
  var newMemberPhoneNum = exampleModal.querySelector('.modal-body #new-member-phoneNum')  
  var newMemberBirthday = exampleModal.querySelector('.modal-body #new-member-birthday')  
  var newMemberName = exampleModal.querySelector('.modal-body #new-member-name')  
  var newMemberNickName = exampleModal.querySelector('.modal-body #new-member-nickName')  
  var newMemberComments = exampleModal.querySelector('.modal-body #new-member-comments')  
  var newMemberPoint = exampleModal.querySelector('.modal-body #new-member-point')  

  modalTitle.textContent = '회원수정하기 ' + memberName +'님('+ memberId +')';
  newMemberId.value = memberId;
  newMemberMail.value = memberEmail;
  newMemberPhoneNum.value = memberPhoneNum;
  newMemberBirthday.value = memberBirthday;
  newMemberName.value = memberName;
  newMemberNickName.value = memberNickName;
  newMemberComments.value = memberComments;
  newMemberPoint.value = memberPoint;
  
  
})
