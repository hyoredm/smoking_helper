<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id = (String) session.getAttribute("uID");
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>테스트</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="css/index.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://kit.fontawesome.com/f17998ee90.js" crossorigin="anonymous"></script>
    <script src="js/script.js"defer type="text/javascript"></script>
</head>
<body>
    <!-- 현재 세로%바 -->
    <div class="gage">
        <div class="gagebar">
        </div>
    </div>
<!-- 현재 세로%바 끝 -->

<!-- 위로스크롤바 -->
    <div class="topscroll">
        <i class="fa-solid fa-chevron-up fa-3x"></i>
    </div>
<!-- 위로스크롤바끝 -->
  <% if(id != null){ %>
    <div class="ac" onclick=" handleButtonClick();">
        <img src="image/11223.JPG">
       </div>
 <% } %>
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

    <div class="container text-center">
            <ul class="headerimg d-flex justify-content-center">
                <li class="slidea"><img src="image/1.png" class="img-fluid" alt="이미지1">
                    <button class="hdbtn btna"><i class="fa-solid fa-chevron-up fa-2x"></i></button>
                    <button class="hdbtn btnb"><i class="fa-solid fa-chevron-up fa-2x"></i></button>
                </li>
                <li class="slidea"><img src="image/2.png" class="img-fluid" alt="이미지3">
                    <button class="hdbtn btna"><i class="fa-solid fa-chevron-up fa-2x"></i></button>
                    <button class="hdbtn btnb"><i class="fa-solid fa-chevron-up fa-2x"></i></button></li>
                <li class="slidea"><img src="image/3.png" class="img-fluid" alt="이미지4">
                    <button class="hdbtn btna"><i class="fa-solid fa-chevron-up fa-2x"></i></button>
                    <button class="hdbtn btnb"><i class="fa-solid fa-chevron-up fa-2x"></i></button></li> 
            </ul>
       </div>
    
       <div class="container aaaaa" style="height: 2000px;">
        <img class="img-fluid" src="image/nosmoking.png" style="display: block;margin: 0 auto;" alt="이미지5">
    </div>
    
    
       <script>
       function handleButtonClick() {
           if (!localStorage.getItem('buttonClicked')) {
               localStorage.setItem('buttonClicked', Date.now());

               document.querySelector('.ac').disabled = true;
               document.location = 'PeriodUp?periodID=<%= session.getAttribute("uID") %>';

               setTimeout(function () {
                   localStorage.removeItem('buttonClicked');
                   document.querySelector('.ac').disabled = false;
               }, 24 * 60 * 60 * 1000);
           } else {
               // 이미 버튼이 클릭된 경우 남은 시간 계산
               const lastClickedTime = localStorage.getItem('buttonClicked');

               // 유효성 검사: 숫자로 변환 가능한지 확인
               if (lastClickedTime !== null && !isNaN(parseInt(lastClickedTime))) {
                   const currentTime = Date.now();
                   const elapsedTime = currentTime - parseInt(lastClickedTime);
                   const remainingTimeInSeconds = Math.max((24 * 60 * 60 * 1000 - elapsedTime) / 1000, 0);
                   const remainingHours = Math.floor(remainingTimeInSeconds / 3600);
                   const remainingMinutes = Math.floor((remainingTimeInSeconds % 3600) / 60);
                   const remainingSeconds = Math.floor(remainingTimeInSeconds % 60); // 소수점 제거

                   // 한국어로 알림 메시지 표시
                   var message = remainingHours + "시간 " + remainingMinutes + "분 " + remainingSeconds + "초 후에 누를 수 있습니당";
                   alert(message);
               } else {
                   // 유효하지 않은 값인 경우 처리
                   alert("유효하지 않은 값이 저장되어 있습니다.");
               }
           }
       }
    </script>
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>