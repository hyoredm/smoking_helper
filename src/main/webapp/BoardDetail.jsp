<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.ArrayList,com.b3g1.dto.BoardInfo,com.b3g1.db.MySQLconnector,com.b3g1.util.Utility"%>
<%
String id = (String) session.getAttribute("uID");
int num = Integer.parseInt(request.getParameter("num"));
BoardInfo bi = Utility.selectDetail(num);
String fontname = bi.getText_style();
String fontcolor = bi.getText_color();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금연도우미 자유게시판</title>
</head>
<script type="text/javascript">
function deleteboard(){
	 var delConfirm = confirm('게시물을 삭제하시겠습니까?');
	   if (delConfirm) {
		   document.location="board?num=<%=num%>&page=05";
		} else {
		}
	}
function really(){
	 var realConfirm = confirm('정말로 신고하시겠습니까? 신고 사유가 적절하지 않을 시, 불이익이 생길 수 있습니다.');
	   if (realConfirm) {
		   document.getElementById("loginform2").submit();;
	} else {
	}
}
</script>
<body>

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
<div class="reportbgout">
				<div class="loginbgin1">
					<form id="loginform2" action="board" method="POST">
						<p
							style="width: 100%; text-align: center;margin-top:30px;font-size: 20px; font-weight: bold;">신고사유</p>
						<textarea name="COMMENT" id="hoho" required></textarea>
						<input type="button" value="신고접수" id="submit1" onclick="really();" /> <input
							type="hidden" name="page" value="06" />
							<input type="hidden" name="BOARD_NUM" value="<%=num %>" />
					</form>
					<button class="closebtn1">X</button>
				</div>
			</div>
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
	<div class="container" style="height: 80px;">
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
		<div class="float-end h-100 center1 me-5"
			onclick="document.location='letter?uID=<%=session.getAttribute("uNICKNAME")%>'">
			<i class="fa-regular fa-envelope" id="letter"
				style="cursor: pointer;"></i>
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
	<!-- 게시판 -->
	<table border=1
		style="margin: 0 auto; border-bottom: none; border-left: none; border-collapse: collapse; margin-top: 50px;">
		<tr>
			<th
				style="border-width: 3px; text-align: center; background-color: #eee; width: 100px">제목</th>
			<td
				style="border: 1px solid #444444;width: 28.5em;height:100px; padding-left: 10px; font-size: 2em; table-layout: fixed; font-family:<%=fontname%>; color:<%=fontcolor%>"><%=bi.getSubject()%></td>
		</tr>
		<tr>
			<th
				style="height: 50px; border-width: 3px; text-align: center; background-color: #eee; width: 50px">작성자/조회수</th>
			<td style="border: 1px solid #444444; padding-left: 10px"><%=bi.getuNickName()%>/<%=bi.getHit()%></td>
		</tr>
		<tr>
			<th
				style="text-align: center; border-width: 3px; background-color: #eee; width: 120px">내용</th>
			<td width="400" height="400"
				style="border: 1px solid #444444; vertical-align: top; text-align: left; font-size: 30px; padding: 10px"><pre><%=bi.getContents()%></pre></td>
		</tr>
		<tr>
			<td colspan='2'
				style="border-bottom: none; border-left: none; border-right: none;"><span
				style="float: right;"><input type="button" value="목록"
					onclick="location='board?page=01'" /> <%
 if (session.getAttribute("uNICKNAME").equals(bi.getuNickName())) {
 %> <input type="button" value="수정"
					onclick="location='BoardModify.jsp?num=<%=num%>'" /> <%
 }
 %> <%
 if (session.getAttribute("uNICKNAME").equals(bi.getuNickName()) | session.getAttribute("uID").equals("admin")) {
 %> <input type="button" value="삭제" onclick="deleteboard()" /> <%
 }
 %> <input
					type="button" id="loginuser2" value="신고" />
			</span></td>
		</tr>
	</table>


	<footer
		style="position: fixed; left: 0; bottom: 0; width: 100%; background-color: #f1f1f1; text-align: center; padding: 10px;">
		<div style="height: 50px; text-align: center; margin: 0 auto;"></div>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

</body>
</html>