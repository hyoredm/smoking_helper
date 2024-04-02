<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <form action="FindPW" id="form">
        <input type="text" id="name" name="uNAME"  placeholder="이름을 입력해주세요"/>
   
        <input type="text" id="name" name="uID" style="margin-top: 34px;" placeholder="아이디를 입력해주세요"/>
          <div id="haha">
        <input type="submit" style="margin-top: 34px;" value="확인">
        <input type="button" id="bttn" value="홈으로" onclick="document.location='index.jsp';" />
        </div>
            </form>
            </div>

	 



</body>
</html>