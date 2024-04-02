<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.b3g1.dto.UserInfo"%>

<%
UserInfo userinfo = (UserInfo) request.getAttribute("userinfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/findID.css" rel="stylesheet">
<title>비밀번호 변경 페이지</title>
<link href="css/mypage.css" rel="stylesheet">
<script type="text/javascript">
	function Check() {
		if(document.modifyForm.uPW.value != document.modifyForm.checkpw.value) {
			alert("비밀번호를 다시 확인해주세요.");
			return false;
		} else if (document.modifyForm.uPW.value == <%=userinfo.getuPW()%>) {
			alert("같은 비밀번호로는 변경할 수 없습니다.");
			return false;
		} else {
			return true;
		}
    } 
</script>
</head>
<body>
<form action="editpw" method="post" name="modifyForm" onSubmit="return Check()">
		<table class="editpwtable">
			<tr>
				<td colspan="2"><h4>비밀번호 변경</h4></td><div class="wrap">
			</tr>
			<tr>
				<th>새 비밀번호</th>
				<td><input type="password" name="uPW" id="uPW"
					value=<%=userinfo.getuPW()%> /></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="checkpw" id="checkpw"
					value=<%=userinfo.getuPW()%> /></td>
			</tr>
		</table>
		<input type="hidden" name="uID" value=<%=request.getParameter("uID")%> />
		<input style="display:block; background-color:black; color:#fff;" type="submit" value="수정완료" />
	</form>
</body>
</html>