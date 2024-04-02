<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.util.List, com.b3g1.dto.DTOClass" %>
<% List<DTOClass> letters = (List<DTOClass>) request.getAttribute("letters"); 

if (session.getAttribute("uID") == null) {
	out.println(
	"<script type='text/javascript'> function uIDnull(){ alert('로그인을 해주시기 바랍니다.'); history.back();}uIDnull();</script>");
}

String id = (String) session.getAttribute("uID");%>
<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="css/letter.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/f17998ee90.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="js/letter.js"></script>
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

<div class="wrap">
        <p id="header"><%= session.getAttribute("uNICKNAME") %>님의 쪽지함</p>
        <div id="sendread">
            <p class="send">받은 쪽지함</p>
            <p class="send clicked">쪽지 보내기</p>
            <div style="clear:both;"></div>
            <div class="abc show">
            <% if (letters.size() > 0)  { %>
                <% for(int i=letters.size()-1; i>=0;i--) { %>
                <div class="letters" onclick="goDETAIL(<%= letters.get(i).getNUM()%>);">
                    <p class="iconwrap"><i class="fa-solid fa-user users"></i></p>
                  
                    <p class="reader"><%= letters.get(i).getSENDER_ID() %></p>
                    <p class="reader" style="font-size: 14px; overflow:hidden;"><%= letters.get(i).getCONTENTS() %></p>
                </div>
<% } %>
<% } else { %>
	<div style="margin-top:100px;">받은 쪽지가 없습니당</div>
<% } %>
            </div>

            <form action="LetterWrite"  class="form">
                <input type="hidden" value="<%= session.getAttribute("uNICKNAME") %>" name="SENDER_ID"/>
                <input type="text" id="sendname" placeholder="받는사람닉네임" name="RECEIVER_ID" />
                <p id="contentex">보낼내용</p>
                <textarea id="content" name="CONTENTS" placeholder="최대100자" maxlength="100"></textarea>
                <input type="submit" id="message" value="보내기" />
                </form>
        </div>

    </div>
<script>
function goDETAIL(num){
	document.location="LetterDetail?NUM="+num;
}
</script>



		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>
p{
margin-bottom:0;
}</style>
</body>
</html>