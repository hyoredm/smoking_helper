<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.b3g1.dto.BoardInfo,com.b3g1.db.MySQLconnector,com.b3g1.util.Utility"%>
<%
int num = Integer.parseInt(request.getParameter("num"));
BoardInfo bi =  Utility.selectDetail(num);

String id = (String) session.getAttribute("uID");

%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function changeStyle() {
		var fontSelectElement = document.getElementById("fontSelect");
		var colorSelectElement = document.getElementById("colorSelect");
		var selectedFont = fontSelectElement.value;
		var selectedColor = colorSelectElement.value;
		var textToChange = document.getElementById("textToChange");

		textToChange.style.fontFamily = selectedFont;
		textToChange.style.color = selectedColor;
	}
	function really(){
		 var realConfirm = confirm('수정을 취소하고 원본으로 돌아가시겠습니까?');
		   if (realConfirm) {
			   document.location="BoardDetail.jsp?num=<%=num%>";
		} else {
		}
	}
</script>
<meta charset="UTF-8">
<link rel="icon" href="./images/icon.jpg" />
<title>금연도우미 게시판</title>
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
    <!-- 게시판 -->
	<form action="board" method="post">
		<table border="1"
			style="margin: 0 auto; border-bottom: none; border-left: none;border-collapse: collapse; margin-top: 50px;">
			<tr>
				<th rowspan='2'
					style="border-width: 3px; text-align: center; background-color: #eee; width: 120px">제목</th>
				<td style="padding-left:10px"><span style="margin-left:10px;margin-right:10px">글자 폰트: </span><select id="fontSelect" name="text_font"
					onchange="changeStyle()">
						<option value="굴림">굴림</option>
						<%
						if ((int)session.getAttribute("uGRADE") >= 2) {
						%>
						<option value="궁서">궁서</option>
						<%
						}
						%>
						<%
						if ((int)session.getAttribute("uGRADE") >= 3) {
						%>
						<option value="문체부 쓰기 흘림체">문체부 쓰기 흘림체</option>
						<%
						}
						%>

				</select><span style="margin-left:10px;margin-right:10px">글자 색:</span><select id="colorSelect" name="text_color"
					onchange="changeStyle()">
						<option value="black">Black</option>
						<%
						if ((int)session.getAttribute("uGRADE") >= 2) {
						%>
						<option value="red">Red</option>
						<%
						}
						%>
						<%
						if ((int)session.getAttribute("uGRADE") >= 3) {
						%>
						<option value="blue">Blue</option>
						<%
						}
						%>
				</select></td>
			</tr>
			<tr>
				<td style="height: 50px; table-layout: fixed"><input
					type="text" name="subject" id="textToChange"
					value="<%=bi.getSubject()%>"
					style="width: 28.5em;height:100px;padding-left:10px;  font-size: 2em;" required /></td>
			</tr>
			<tr>
				<th
					style="height:50px; border-width: 3px; text-align: center; background-color: #eee; width: 50px">작성자</th>
				<td style="padding-left:10px">${sessionScope.uNICKNAME }</td>
			</tr>
			<tr>
				<th
					style="border-width: 3px; text-align: center; background-color: #eee; width: 50px">내용</th>
				<td><textarea name="contents" style="resize: none;padding:10px;font-size: 25px;width:36.5em;height:18em" required><%=bi.getContents()%></textarea></td>
			</tr>
			<tr>
				<td colspan='2'
					style="border-bottom: none; border-left: none; border-right: none;"><span
					style="float: right;"><input type="submit" value="수정" /><input type="button"
					value="상세정보" style="margin-left: 10px" onclick="really()" /></span></td>
			</tr>

		</table>
		<input type="hidden" name="page" value="04" /><input type="hidden"
			name="num" value="<%=num%>" />
	</form>
	<footer
		style="position: fixed; left: 0; bottom: 0; width: 100%; background-color: #f1f1f1; text-align: center; padding: 10px;">
		<div style="height: 50px; text-align: center; margin: 0 auto;"></div>
	</footer>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>