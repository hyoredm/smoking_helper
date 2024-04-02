<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.ArrayList,com.b3g1.dto.BoardInfo,com.b3g1.db.MySQLconnector,com.b3g1.util.Utility"%>
<%

String id = (String) session.getAttribute("uID");

ArrayList<BoardInfo> boards = Utility.selectAll();
String search = request.getParameter("search");
String content = request.getParameter("text");
if (search == null | content == null) {
	search = "";
	content = "";
}
if (content.length() != 0) {
	if (search.equals("제목")) {
		boards = Utility.selectSubject(content);
	} else {
		boards = Utility.selectNickName(content);
	}
}
int itemsPerPage = 10; // 페이지당 보여줄 항목 수
int totalItems = boards.size();
int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

String pageParam = request.getParameter("page");
int currentPage = (pageParam == null) ? 1 : Integer.parseInt(pageParam);
currentPage = Math.max(1, Math.min(currentPage, totalPages));

int startIndex = (currentPage - 1) * itemsPerPage;
int endIndex = Math.min(startIndex + itemsPerPage, totalItems);
ArrayList<BoardInfo> pageData = new ArrayList<>();

for (int i = startIndex; i < endIndex; i++) {
	pageData.add(boards.get(i));
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금연도우미 자유게시판</title>
<script type="text/javascript">
	function search() {
		var searchIndex = document.getElementById("searchText");
		var textIndex = document.getElementById("text");
		document.location = "BoardList.jsp?search=" + searchIndex.value
				+ "&text=" + textIndex.value;
	}
	function wrong() {
		alert("작성을 하려면 로그인해주세요!");
	}
</script>
<style>
a {
	text-decoration: none;
	color: inherit;
}

a:visited {
	
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="css/index.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://kit.fontawesome.com/f17998ee90.js" crossorigin="anonymous"></script>
    <script src="js/script.js"defer type="text/javascript"></script>
</head>
<body style="margin: 0; padding: 0;">
		<!-- 현재 세로%바 -->
    <div class="gage">
        <div class="gagebar"></div>
    </div>
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
	<table border=1
		style="margin: 0 auto; border: none; border-collapse: collapse; margin-top: 50px;">
		<tr>

			<td style="border-left: none; border-top: none; border-right: none;"
				colspan='4'><span style="float: left;"><select
					id="searchText" name="search">
						<option value="제목">제목</option>
						<option value="닉네임">닉네임</option>
				</select> <input id="text" type="text" name="content" /> <input
					type="button" value="검색" onclick="search()" /> </span></td>
			<td style="border-left: none; border-top: none; border-right: none;"
				colspan='2'><span style="float: right;"> <%
 if (session.getAttribute("uNICKNAME") != null) {
 %>
					<button type="button"
						style="margin: 0 0; color: #fff; border-radius: 0.5em; margin: 20px auto; cursor: pointer"
						onclick="location='BoardWrite.jsp'">
						<img src="./image/icon-write.png" />
					</button> <%
 } else {
 %>
					<button type="button"
						style="margin: 0 0; color: #fff; border-radius: 0.5em; margin: 20px auto; cursor: pointer"
						onclick="wrong()">
						<img src="./image/icon-write.png" />
					</button> <%
 }
 %>
			</span></td>
		</tr>
		<tr>
			<th
				style="border-width: 3px; text-align: center; background-color: #eee; width: 50px">번호</th>
			<th
				style="border-width: 3px; text-align: center; background-color: #eee; width: 500px">제목</th>
			<th
				style="border-width: 3px; text-align: center; background-color: #eee; width: 100px">닉네임</th>
			<th
				style="border-width: 3px; text-align: center; background-color: #eee; width: 200px">작성/수정
				일시</th>
			<th
				style="border-width: 3px; text-align: center; background-color: #eee; width: 50px">조회수</th>
			<th
				style="border-width: 3px; text-align: center; background-color: #eee; width: 50px">등급</th>
		</tr>
		<%
		if (boards.size() == 0) {
			out.println("<tr><td style='text-align: center;' colspan='6'>게시물이 없습니다.</td></tr>");
		} else {
			for (BoardInfo bi : pageData) {
		%>
		<tr>
			<td style="text-align: center; height: 50px;"><%=bi.getNum()%></td>
			<td
				style="text-align: center; font-family:<%=bi.getText_style()%>; color:<%=bi.getText_color()%>;">
				<%
				if (session.getAttribute("uNICKNAME") != null) {
				%> <a href="board?page=03&num=<%=bi.getNum()%>&subject=<%=bi.getSubject() %>" style="font-family:<%=bi.getText_style()%>; color:<%=bi.getText_color()%>;"> <%
 } else {
 %><a href="javascript:alert('로그인을 해주세요.');" style="font-family:<%=bi.getText_style()%>; color:<%=bi.getText_color()%>;">
					<%
					}
					%> <%=bi.getSubject()%>
			</a> 
			</td>
			<td style="text-align: center;"><%=bi.getuNickName()%></td>
			<%
			if (bi.getMod_date() == null) {
			%>
			<td style="text-align: center;"><%=bi.getReg_date()%></td>
			<%
			} else {
			%>
			<td style="text-align: center;"><%=bi.getMod_date()%></td>
			<%
			}
			%>
			<td style="text-align: center;"><%=bi.getHit()%></td>
			<td style="text-align: center;"><%=bi.getuGrade()%></td>

		</tr>
		<%
		}
		}
		%>
	</table>
	<footer
		style="position: fixed; left: 0; bottom: 0; width: 100%; background-color: #f1f1f1; text-align: center; padding: 10px;">
		<div style="height: 50px; text-align: center; margin: 0 auto;">
			<%
			if (currentPage > 1) {
			%>
			<a
				href="?page=<%=currentPage - 1%>&search=<%=search%>&text=<%=content%>"
				style="display: inline-block; padding: 5px 10px;"><</a>
			<%
			}
			%>

			<%
			for (int i = 1; i <= totalPages; i++) {
			%>
			<a href="?page=<%=i%>&search=<%=search%>&text=<%=content%>"
				style="display: inline-block; padding: 5px 10px;"><%=i%></a>
			<%
			}
			%>

			<%
			if (currentPage < totalPages) {
			%>
			<a
				href="?page=<%=currentPage + 1%>&search=<%=search%>&text=<%=content%>"
				style="display: inline-block; padding: 5px 10px;">></a>
			<%
			}
			%>
		</div>
	</footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>

</html>