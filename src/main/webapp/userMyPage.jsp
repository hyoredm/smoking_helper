<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.b3g1.dto.UserInfo"%>

<%
UserInfo userinfo = (UserInfo) request.getAttribute("userinfo");
int dday = userinfo.getuGOAL() - userinfo.getuNO_PERIOD();
String id = (String) session.getAttribute("uID");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="css/mypage.css" rel="stylesheet">
<script type="text/javascript">
	function editPW() {
		document.location="editpw?uID=<%=userinfo.getuID()%>";
	}
</script>
</head>
<body>

	<%
	if (session.getAttribute("uID") == null) {
		out.println(
		"<script type='text/javascript'> function uIDnull(){ alert('로그인을 해주시기 바랍니다.'); history.back();}uIDnull();</script>");
	}
	%>

	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
		crossorigin="anonymous">
	<link href="css/index.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://kit.fontawesome.com/f17998ee90.js"
		crossorigin="anonymous"></script>
	<script src="js/script.js" defer type="text/javascript"></script>
	<!-- 현재 세로%바 끝 -->
	<!-- 위로스크롤바 -->
	<div class="topscroll">
		<i class="fa-solid fa-chevron-up fa-3x"></i>
	</div>
	<!-- 위로스크롤바끝 -->

	<!--메뉴팝업 -->
	<div class="layerpopup">
		<div class="container" style="height: 100px;">
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
				<p
					style="width: 100%; text-align: center; font-size: 20px; font-weight: bold;">금연도우미</p>
				<input type="text" id="email" maxlength="10" required name="id"
					placeholder="ID" /> <input type="password" id="pass" name="pw"
					required placeholder="Password" />
				<p id="fp">
					<a href="register1.jsp">회원가입</a><a href="FindID.jsp">아이디찾기</a> <a
						href="FindPW.jsp">비밀번호찾기</a>
				</p>
				<div style="clear: both;"></div>
				<input type="submit" value="로그인" id="submit">
			</form>
			<button class="closebtn">X</button>
		</div>
	</div>
	<!-- https://earlgreybutter.tistory.com/184 -->
	<div class="container" style="height: 150px;">
		<div class="float-start ms-3 center1 h-100">
			<a href="index.jsp">금연도우미</a>
		</div>
		<div class="float-end me-3 h-100 center1">
			<i class="fa-solid fa-bars" id="laybtn" style="cursor: pointer;"></i>
		</div>
		<%
		if (id == null) {
		%>
		<div class="float-end me-3 h-100 center1">
			<i class="fa-solid fa-user me-3" id="loginuser1"
				style="cursor: pointer;"></i>
		</div>
		<%
		} else {
		%>
		 <div style="position:relative" class="float-end h-100 center1 me-5" onclick="document.location='letter?uID=<%=session.getAttribute("uNICKNAME") %>'">
        <i class="fa-regular fa-envelope"  id="letter" style="cursor: pointer; position:relative; color:#ccc;"><span style="font-size:20px;position:absolute;top:15px;left:23px;color:green;font-weight:bold;"><%= session.getAttribute("unread") %></span></i>
        </div>
		<div class="user float-end" style="display: inline-block;">
			<span><%=session.getAttribute("uNICKNAME")%>님<i
				onclick="document.location='logout.jsp';"
				class="fa-solid fa-right-from-bracket outbtn"></i></span> <span>금연 <%=session.getAttribute("uNO_PERIOD")%>일차
				입니다
			</span>
		</div>
		<%
		}
		%>
	</div>
	<div style="clear: both;"></div>

	<br />
	<div class="mypagebox">

		<div class="mypagetitle">
			<h2 align=center>마이페이지</h2>
		</div>

		<div class="welcome" align=center>
			안녕하세요
			<%=userinfo.getuNICKNAME()%>님, 오늘은 금연
			<%=userinfo.getuNO_PERIOD()%>일차 입니다. <br /> 목표일까지 D-<%=dday%>!
		</div>
		<form action="pwmypage">
			<table class="mypagetable" border=1
				style="border: 1px solid black; border-collapse: collapse;">
				<input type="hidden" name="uID" value="<%=userinfo.getuID()%>" />
				<tr>
					<th width=200px
						style="background-color: #eee; border: 1px solid black;">아이디</th>
					<td width=200px style="border: 1px solid black;"><%=userinfo.getuID()%></td>
				</tr>
				<tr>
					<th style="background-color: #eee; border: 1px solid black;">이름</th>
					<td style="border: 1px solid black;"><%=userinfo.getuName()%></td>
				</tr>
				<tr>
					<th style="background-color: #eee; border: 1px solid black;">닉네임</th>
					<td style="border: 1px solid black;"><%=userinfo.getuNICKNAME()%></td>
				</tr>
				<tr>
					<th style="background-color: #eee; border: 1px solid black;">생년월일</th>
					<td style="border: 1px solid black;"><%=userinfo.getuBIRTH()%></td>
				</tr>
				<tr>
					<th style="background-color: #eee; border: 1px solid black;">비밀번호
						힌트</th>
					<td style="border: 1px solid black;"><%=userinfo.getuPW_Q()%></td>
				</tr>
				<tr>
					<th style="background-color: #eee; border: 1px solid black;">비밀번호
						힌트 답</th>
					<td style="border: 1px solid black;"><%=userinfo.getuPW_A()%></td>
				</tr>
				<tr>
					<th style="background-color: #eee; border: 1px solid black;">목표일수</th>
					<td style="border: 1px solid black;"><%=userinfo.getuGOAL()%></td>
				</tr>
				<tr>
					<th style="background-color: #eee; border: 1px solid black;">금연기간</th>
					<td style="border: 1px solid black;"><%=userinfo.getuNO_PERIOD()%></td>
				</tr>
			</table>
			<div class="editbtn">
				<input type="submit" value="정보수정" />
			</div>
<input type="button" value="비밀번호 수정" onClick="editPW()" />
		</form>
	</div>
	<div class="boardlink"
		style="margin-top: 50px; width: 100%; display: inline-block; text-align: center;">
		<a href="myWritingBoard.jsp?uNICKNAME=<%=userinfo.getuNICKNAME()%>">나의게시물
			바로가기</a>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>