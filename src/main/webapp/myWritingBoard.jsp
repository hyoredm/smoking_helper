<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.b3g1.dto.BoardInfo"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.b3g1.util.Utility"%>


<%
ArrayList<BoardInfo> boardinfo = Utility.myBoardSelectDB((String)session.getAttribute("uNICKNAME"));
String id = (String) session.getAttribute("uID");
int itemsPerPage = 10; // 페이지당 보여줄 항목 수
int totalItems = boardinfo.size();
int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

String pageParam = request.getParameter("page");
int currentPage = (pageParam == null) ? 1 : Integer.parseInt(pageParam);
currentPage = Math.max(1, Math.min(currentPage, totalPages));

int startIndex = (currentPage - 1) * itemsPerPage;
int endIndex = Math.min(startIndex + itemsPerPage, totalItems);
ArrayList<BoardInfo> pageData = new ArrayList<>();

for (int i = startIndex; i < endIndex; i++) {
	pageData.add(boardinfo.get(i));
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 게시물</title>
<link href="css/mypage.css" rel="stylesheet">

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
	<div class="myboardbox">
	<div class="myboardtitle">
	<h2 align=center>내가 쓴 게시물</h2>
	</div>
	<form>
		<table style="margin-left: 20px;margin-right:20px;  margin-top:50px ;text-align:center" border=1>
			<tr>
				<th style="background-color:#eee ;border : 1px solid black;" align=center width=250px>제목</th>
				<th style="background-color:#eee ;border : 1px solid black;" align=center width=200px>등록일시</th>
				<th style="background-color:#eee ;border : 1px solid black;" align=center width=100px>조회수</th>
			</tr>

			<%
			for (BoardInfo bi:pageData) {
			%>
			<tr>
				<td style="border : 1px solid black;" align=center><%=bi.getSubject() %></td>
				<td style="border : 1px solid black;" align=center><%=bi.getReg_date() %></td>
				<td style="border : 1px solid black;" align=center><%=bi.getHit() %></td>
			</tr>
			<%
			}
			%>

		</table>
	</form>
	</div>
	<div class="boardlink" style="margin-top: 50px;width:100%; display: inline-block; text-align: center;">
		<a href="mypage">마이페이지로</a>
	</div>
	<footer
		style="position: fixed; left: 0; bottom: 0; width: 100%; background-color: #f1f1f1; text-align: center; padding: 10px;">
		<div style="height: 50px; text-align: center; margin: 0 auto;">
			<%
			if (currentPage > 1) {
			%>
			<a
				href="?page=<%=currentPage - 1%>"
				style="display: inline-block; padding: 5px 10px;"><</a>
			<%
			}
			%>

			<%
			for (int i = 1; i <= totalPages; i++) {
			%>
			<a href="?page=<%=i%>"
				style="display: inline-block; padding: 5px 10px;"><%=i%></a>
			<%
			}
			%>

			<%
			if (currentPage < totalPages) {
			%>
			<a
				href="?page=<%=currentPage + 1%>"
				style="display: inline-block; padding: 5px 10px;">></a>
			<%
			}
			%>
		</div>
	</footer>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>