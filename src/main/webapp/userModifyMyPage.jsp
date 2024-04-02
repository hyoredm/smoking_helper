<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.b3g1.dto.UserInfo"%>

<%
UserInfo userinfo = (UserInfo) request.getAttribute("userinfo");
int dday = userinfo.getuGOAL()-userinfo.getuNO_PERIOD();
String birth = userinfo.getuBIRTH();
int uNO_PERIOD=userinfo.getuNO_PERIOD();
String years = birth.substring(0,4);
String months = birth.substring(5,6);
String days = birth.substring(7,9);
String id = (String) session.getAttribute("uID");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정 페이지</title>
<link href="css/mypage.css" rel="stylesheet">
<script type="text/javascript">
function DeleteAlert() {
	if(!confirm("탈퇴를 하시겠습니까?")) {
		alert("탈퇴가 취소되었습니다.");
		return false;
	} else {
		alert("탈퇴가 완료되었습니다.");
		return true;
	}

}
</script>
</head>
<body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="css/index.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://kit.fontawesome.com/f17998ee90.js" crossorigin="anonymous"></script>
    <script src="js/script.js"defer type="text/javascript"></script>
<!-- 현재 세로%바 끝 -->
<!-- 위로스크롤바 -->
    <div class="topscroll">
        <i class="fa-solid fa-chevron-up fa-3x"></i>
    </div>
<!-- 위로스크롤바끝 -->

<!--메뉴팝업 -->
<div class="layerpopup">
    <div class="container" style="height:100px;">
       <button class="cbtn">X</button>
    </div>
    <div class="layerwrap">
        <div class="layermenuout">
        <ul class="layermenu">
<li><a href="index.jsp" onclick="document.location='ClickCount?click=home'">Home</a></li>
            <li><a href="#" onclick="document.location='ClickCount?click=board'">Board</a></li>
            <li><a href="#" onclick="document.location='ClickCount?click=letter'">Letter</a></li>
            <li><a href="#" onclick="document.location='ClickCount?click=mypage'">MyPage</a></li>
        </ul>
        </div>
        <div class="layerimg">
            <a href="#"><img src="image/abc.png" alt="이미지1"></a>
        </div>
    </div>
    </div>
    <!-- 메뉴팝업끝 -->
    <div class="loginbgout">
        <div class="loginbgin">
            <form id="loginform" action="LoginCheck.jsp" method="POST">
                <p style="width:100%;text-align: center; font-size:20px; font-weight: bold;">금연도우미</p>
                <input type="text" id="email" maxlength="10" required name="id" placeholder="ID" />
                <input type="password" id="pass" name="pw" required placeholder="Password" />
                <p id="fp"><a href="register1.jsp">회원가입</a><a href="FindID.jsp">아이디찾기</a>
                    <a href="FindPW.jsp">비밀번호찾기</a></p>
                <div style="clear:both;"></div>
                <input type="submit" value="로그인" id="submit">
            </form>
            <button class="closebtn">X</button>
        </div>
    </div>
<!-- https://earlgreybutter.tistory.com/184 -->
     <div class="container" style="height:80px;">
        <div class="float-start ms-3 center1 h-100"><a href="index.jsp">금연도우미</a></div>
        <div class="float-end me-3 h-100 center1">
            <i class="fa-solid fa-bars" id="laybtn" style="cursor: pointer;"></i></div>
        <% if(id == null){ %>
           <div class="float-end me-3 h-100 center1">
        <i class="fa-solid fa-user me-3"  id="loginuser1" style="cursor: pointer;"></i>
       </div>
          <% } else { %>
            <div style="position:relative" class="float-end h-100 center1 me-5" onclick="document.location='letter?uID=<%=session.getAttribute("uNICKNAME") %>'">
        <i class="fa-regular fa-envelope"  id="letter" style="cursor: pointer; position:relative; color:#ccc;"><span style="font-size:20px;position:absolute;top:15px;left:23px;color:green;font-weight:bold;"><%= session.getAttribute("unread") %></span></i>
        </div>
            <div class="user float-end" style="display: inline-block;">
            <span><%= session.getAttribute("uNICKNAME")%>님<i onclick="document.location='logout.jsp';" class="fa-solid fa-right-from-bracket outbtn"></i></span>
            <span>금연 <%= session.getAttribute("uNO_PERIOD") %>일차 입니다</span>
        </div>
          <%} %>
    </div>
    <div style="clear:both;"></div>
    
	<div class="editpagebox">
	<div class="editpagetitle">
	<h2 align=center style="margin-top:2em">마이페이지</h2>
	</div>
	안녕하세요 <%=userinfo.getuNICKNAME()%>님, 오늘은 금연 <%=userinfo.getuNO_PERIOD()%>일차 입니다.
	<br />
	목표일까지 D-<%=dday %>!
	<form action="modify" method="post" name="modifyForm" onSubmit="return Check()">
		<table class="editpagetable" border=1>
			<input type="hidden" value="<%=userinfo.getuID()%>" name="uID" />
			<tr>
				<th style="width:200px;background-color:#eee ;border : 1px solid black;">아이디</th>
				<td style="width:200px; border : 1px solid black;"><%=request.getParameter("uID")%></td>
			</tr>
			<tr>
				<th style="background-color:#eee ;border : 1px solid black;">이름</th>
				<td style="border : 1px solid black;"><a name="uName" value=<%=userinfo.getuName()%> style="text-align: center" ><%=userinfo.getuName()%></a></td>
			</tr>
			<tr>
				<th style="background-color:#eee ;border : 1px solid black;">닉네임</th>
				<td style="border : 1px solid black;"><input type="text" name="uNICKNAME" value="${sessionScope.uNICKNAME }" style="text-align: center" /></td>
			</tr>
			<tr>
				<th style="background-color:#eee ;border : 1px solid black;">생년월일</th>
				<td style="border : 1px solid black;">
			<div class="info" id="info__birth">
            <select class="box" id="birth-year" name="year">
              <option disabled selected value="<%= years %>"><%= years %></option>

            </select>
            <select class="box" id="birth-month" name="month">
              <option disabled selected value="<%= months %>"><%= months %></option>

            </select>
            <select class="box" id="birth-day" name="day">
              <option disabled selected value="<%= days %>"><%= days %></option>
            </select>
          </div>
          </td>
			</tr>
			<tr>
				<th style="background-color:#eee ;border : 1px solid black;">비밀번호 힌트</th>
				<td style="border : 1px solid black;"><input type="text" name="PW_Q"
					value="<%=userinfo.getuPW_Q()%>" style="text-align: center" /></td>
			</tr>
			<tr>
				<th style="background-color:#eee ;border : 1px solid black;">비밀번호 힌트 답</th>
				<td style="border : 1px solid black;"><input type="text" name="PW_A"
					value="<%=userinfo.getuPW_A()%>"  style="text-align: center"/></td>
			</tr>

			<tr>
				<th style="background-color:#eee ;border : 1px solid black;">목표일수</th>
				<td style="border : 1px solid black;"><input type="number" name="uGOAL"
					value="<%=userinfo.getuGOAL()%>" max="365"
					oninput="if (this.value > 365) this.value = 365;" style="text-align: center"/></td>
			</tr>
			<tr>
				<th style="background-color:#eee ;border : 1px solid black;">금연기간</th>
				<td style="border : 1px solid black;"><a name="uNO_PERIOD" value="<%=userinfo.getuNO_PERIOD()%>"><%=userinfo.getuNO_PERIOD()%></a></td>
			</tr>
		</table>
		<br />
		
		<input type="hidden" value="<%= years %>" name="years" />
		<input type="hidden" value="<%= months %>" name="months" />
		<input type="hidden" value="<%= days %>" name="days" />
		<input type="submit" name="btn" class="join" value="수정완료" style="margin-top: 50px"/>
	</form>
	<form action="deleteuser" method="GET" onSubmit="return DeleteAlert()">
		<input type="hidden" name="uID" value=<%=request.getParameter("uID")%> />
		<input type="submit" value="회원탈퇴" />
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
    alert('생년월일을 선택해주세요.');
  }
});



</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>