 
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



function autoHypenTel(str) {
  str = str.replace(/[^0-9]/g, '');
  var tmp = '';

  if (str.substring(0, 2) == 02) {
    // 서울 전화번호일 경우 10자리까지만 나타나고 그 이상의 자리수는 자동삭제
    if (str.length < 3) {
      return str;
    } else if (str.length < 6) {
      tmp += str.substr(0, 2);
      tmp += '-';
      tmp += str.substr(2);
      return tmp;
    } else if (str.length < 10) {
      tmp += str.substr(0, 2);
      tmp += '-';
      tmp += str.substr(2, 3);
      tmp += '-';
      tmp += str.substr(5);
      return tmp;
    } else {
      tmp += str.substr(0, 2);
      tmp += '-';
      tmp += str.substr(2, 4);
      tmp += '-';
      tmp += str.substr(6, 4);
      return tmp;
    }
  } else {
    // 핸드폰 및 다른 지역 전화번호 일 경우
    if (str.length < 4) {
      return str;
    } else if (str.length < 7) {
      tmp += str.substr(0, 3);
      tmp += '-';
      tmp += str.substr(3);
      return tmp;
    } else if (str.length < 11) {
      tmp += str.substr(0, 3);
      tmp += '-';
      tmp += str.substr(3, 3);
      tmp += '-';
      tmp += str.substr(6);
      return tmp;
    } else {
      tmp += str.substr(0, 3);
      tmp += '-';
      tmp += str.substr(3, 4);
      tmp += '-';
      tmp += str.substr(7);
      return tmp;
    }
  }

  return str;
}

$('#new-member-phoneNum').keyup(function (event) {
  event = event || window.event;
  var _val = this.value.trim();
  this.value = autoHypenTel(_val);
});