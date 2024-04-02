<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호찾기</title>
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
<form action="FindPW2" id="form">
<input type="hidden" value="${param.uNAME}" name="uNAME"/>
<input type="hidden" value="${param.uID }" name="uID"/>
<p id="question">${requestScope.Question}</p>
<input type="text" id="name"  style="margin-top: 30px;" placeholder="답변" name="answer"/>
  <div id="haha">
<input type="submit" value="확인" style="margin-top: 30px;" />
<input type="button" id="bttn" value="홈으로" onclick="document.location='index.jsp';" />
</div>
</form>
</div>

</body>
</html>