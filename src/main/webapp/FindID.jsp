<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/findID.css" rel="stylesheet">
    <title>Document</title>
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

	<h4>회원 정보 찾기</h4>
<div class="wrap">
    <form action="findID" id="form">
       
        <input type="text" id="name" name="uNAME" placeholder="이름을 입력해주세요"/>
        
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
        <br>
        <div id="haha">
                <input type="submit" value="확인">
         <input type="button" id="bttn" value="홈으로" onclick="document.location='index.jsp';" />
        </div>
            </form>
</div>
    

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


  // 옵션이 선택되지 않은 경우 제출을 막음
  if (birthYear === '출생 연도' || birthMonth === '월' || birthDay === '일') {
    event.preventDefault(); // 제출을 막음
    alert('선택사항을 입력해주세요');
  }
});
</script>



</body>
</html>