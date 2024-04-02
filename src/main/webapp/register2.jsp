<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <link href="css/register.css" rel="stylesheet">
</head>
<body>
<%
    String strReferer = request.getHeader("referer");
    
    if(strReferer == null){
    %>
    <script language="javascript">
    alert("get요청 접근불가");
    history.back();
    </script>
<% return;
    }
%>

    <h4>Join Us</h4>
    <div class="wrap">
       
<form id="form" action="user" method="POST">
    <h3 id="reg2" style="font-size: 16px;">기본정보<span class="req">필수입력사항</span></h3>
   <table>
<colgroup>
<col width="130">
<col width="*">
<tbody>
    <tr>
        <th><span class="req2">아이디</span></th>
        <td><input type="text" name="uID" value="" id="reg_mb_id" required="" class="reg_input" minlength="4" maxlength="10" placeholder="아이디 4~10자."></td>
    </tr>
    <tr>
        <th><span class="req2">비밀번호</span></th>
        <td><input type="password" name="uPW" id="reg_mb_password" required="" class="reg_input" minlength="4" maxlength="20" placeholder="비밀번호 4~20자."></td>
    </tr>
    <tr>
        <th><span class="req2">비밀번호 확인</span></th>
        <td><input type="password" name="mb_password_re" id="reg_mb_password_re" required="" class="reg_input" minlength="3" maxlength="20">
            <span id="msg_mb_pw" class="reg_msg nok"  style="display: none;">비밀번호가 같지 않습니다.</span></td>
    </tr>
    <tr>
        <th><span class="req2">이름</span></th>
        <td><input type="text" id="reg_mb_name" name="uNAME" value="" required="" class="reg_input" maxlength="5"></td>
    </tr>
    <tr>
        <th><span class="req2">닉네임</span></th>
        <td><input type="text" name="uNICKNAME" value="" id="reg_mb_nick" required="" class="reg_input nospace" maxlength="10"></td>
    </tr>
    <tr>
        <th><span class="req2">생년월일</span></th>
        <td>
             <div class="info" id="info__birth">
            <select class="box" id="birth-year" name="year">
              <option disabled selected>출생 연도</option>

            </select>
            <select class="box" id="birth-month" name="month">
              <option disabled selected>월</option>

            </select>
            <select class="box" id="birth-day" name="day">
              <option disabled selected>일</option>
            </select>
          </div>
        </td>
    </tr>
    <tr>
        <th>목표일수</th>
        <td><input type="number" style="width:190px;" name="uGOAL" placeholder="최대 365일" min="0" max="365" oninput="if (this.value > 365) this.value = 365;"/></td>
    </tr>
     <tr>
        <th style="font-size:14px;"><span class="req2">비밀번호 찾기 질문</span></th>
        <td>
        <select class="box" id="pw-question" name="uPW_Q">
              <option disabled selected>질문선택</option>
              <option>당신의 보물 1호는?</option>
              <option>인상 깊게 읽은 책 이름은?</option>
              <option>제일 친한 친구 이름은?</option>
            </select>
        </td>
    </tr>
    <tr>
        <th><span class="req2">찾기 답변</span></th>
        <td>
       <input type="text" name="uPW_A" maxlength="20" required />
        </td>
    </tr>
</tbody>
</colgroup>

   </table>
   <div class="confirm">
    <a href="index.jsp" class="cancel">CANCEL</a>            
    <input type="submit" class="join" value="JOIN">           
</div>
    </div>



</form>

    <script>
        const birthYearEl = document.querySelector('#birth-year')
// option 목록 생성 여부 확인
isYearOptionExisted = false;
birthYearEl.addEventListener('focus', function () {
  // year 목록 생성되지 않았을 때 (최초 클릭 시)
  if(!isYearOptionExisted) {
    isYearOptionExisted = true
    for(var i = 1985; i <= 2022; i++) {
      // option element 생성
      const YearOption = document.createElement('option')
      YearOption.setAttribute('value', i)
      YearOption.innerText = i
      // birthYearEl의 자식 요소로 추가
      this.appendChild(YearOption);
    }
  }
});

const birthMonth = document.querySelector('#birth-month')
// option 목록 생성 여부 확인
isYearOptionExisted1 = false;
birthMonth.addEventListener('focus', function () {
  if(!isYearOptionExisted1) {
    isYearOptionExisted1 = true
    for(var i = 1; i <= 12; i++) {
      // option element 생성
      const YearOption1 = document.createElement('option')
      YearOption1.setAttribute('value', i)
      YearOption1.innerText = i

      this.appendChild(YearOption1);
    }
  }
});

const birthDay = document.querySelector('#birth-day')
// option 목록 생성 여부 확인
isYearOptionExisted2 = false;
birthDay.addEventListener('focus', function () {
 
  if(!isYearOptionExisted2) {
    isYearOptionExisted2 = true
    for(var i = 1; i <= 31; i++) {
      // option element 생성
      const YearOption2 = document.createElement('option')
      YearOption2.setAttribute('value', i)
      YearOption2.innerText = i
   
      this.appendChild(YearOption2);
    }
  }
});

const form = document.querySelector('#form');

form.addEventListener('submit', function(event) {
  // 선택된 옵션 값을 가져옴
  const birthYear = document.querySelector('#birth-year').value;
  const birthMonth = document.querySelector('#birth-month').value;
  const birthDay = document.querySelector('#birth-day').value;
  const PWquestion = document.querySelector('#pw-question').value;

  // 옵션이 선택되지 않은 경우 제출을 막음
  if (birthYear === '출생 연도' || birthMonth === '월' || birthDay === '일' || PWquestion === '질문선택') {
    event.preventDefault(); // 제출을 막음
    alert('선택사항을 입력해주세요');
  }
});

const passwordEl = document.querySelector('#reg_mb_password');
const passwordConfirmEl = document.querySelector('#reg_mb_password_re');
const passwordMatchMsg = document.querySelector('#msg_mb_pw');
const joinButton = document.querySelector('.join');

function checkPasswordMatch() {
  if (passwordEl.value !== passwordConfirmEl.value) {
    passwordMatchMsg.style.display = 'inline';
    joinButton.disabled = true;
  } else {
    passwordMatchMsg.style.display = 'none';
    joinButton.disabled = false;
  }
}

passwordConfirmEl.addEventListener('input', checkPasswordMatch);
passwordEl.addEventListener('input', checkPasswordMatch);
    </script>





  
</body>
</html>