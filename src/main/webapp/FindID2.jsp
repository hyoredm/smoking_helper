<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%    String a = (String) request.getAttribute("question");
        String uNAME = (String) request.getAttribute("uNAME");
            String uBIRTH = (String) request.getAttribute("uBIRTH");
 
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="css/findID.css" rel="stylesheet">
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
    <form action="findID2" id="form">
        <p id="question"><%= a %></p>
        <input type="hidden" value="<%= uNAME %>" name="uNAME"/>
<input type="hidden" value="<%= uBIRTH %>" name="uBIRTH"/>
        <input type="text" id="name"  style="margin-top: 30px;" placeholder="답변" name="answer"/>
         <div id="haha">
        <input type="submit" value="확인" style="margin-top: 30px;"/>
        <input type="button" id="bttn" value="홈으로" onclick="document.location='index.jsp';" />
      </div>
        </form>
    
        </div>
</body>
</html>