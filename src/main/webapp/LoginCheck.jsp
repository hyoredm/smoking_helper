<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*,com.b3g1.db.MySQLconnector,com.b3g1.db.Querys,java.text.DateFormat,java.text.SimpleDateFormat,java.util.Date
     ,java.util.ArrayList" %>
<%
	Connection conn = null;
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginCheck</title>
</head>
<body>
<%

    conn = MySQLconnector.connectDB();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    boolean loginSuccess = false; // 로그인 성공 여부를 저장하기 위한 변수
	String idd = null;
    try {
        pstmt = conn.prepareStatement(Querys.loginC);
        pstmt.setString(1, id);
        pstmt.setString(2, pw);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            // 로그인 성공
            String uID = rs.getString("uID");
            String uNICKNAME = rs.getString("uNICKNAME");
            String period = rs.getString("uNO_PERIOD");
            String RegDate = rs.getString("RegDate");
            int uGRADE = rs.getInt("uGRADE");
            // 세션 생성 및 정보 저장
            session.setAttribute("uID", id);
            session.setAttribute("uNICKNAME", uNICKNAME);
            session.setAttribute("uNO_PERIOD", period);
            session.setAttribute("RegDate", RegDate);
            session.setAttribute("uGRADE", uGRADE);
            loginSuccess = true; // 로그인 성공 여부를 true로 설정
            idd = id;
            
            
         
            
        }
        if (!loginSuccess) {
            // 로그인 실패 시 클라이언트 측에서 경고창을 띄우고 이전 페이지로 리다이렉션
            %>
            <script>
                alert("아이디 또는 비밀번호를 확인해주세요");
                history.go(-1); // 이전 페이지로 돌아가기
            </script>
            <%
        } else {
            // 로그인 성공 시 이동할 페이지로 리다이렉션
            String ip=request.getRemoteAddr();
       	 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
         String dateTime = dateFormat.format(new Date());
            PreparedStatement pstmt2 = conn.prepareStatement("insert into log_info (uIP,uID,LOG_DATE) values(?,?,?)");
		      pstmt2.setString(1, ip);
		      pstmt2.setString(2, (String) session.getAttribute("uID"));
		      pstmt2.setString(3, dateTime);
		       int n = pstmt2.executeUpdate();
		      if(n>0){
		    	  ArrayList<Integer> abcc = new ArrayList<Integer>();
		            PreparedStatement pstmt3 = conn.prepareStatement("select * from user_letter where RECEIVER_ID=? AND UNREAD=? ");
		            pstmt3.setString(1, (String)session.getAttribute("uNICKNAME"));
		           
		            pstmt3.setInt(2, 0);
		            ResultSet rs2 =pstmt3.executeQuery();
		            while(rs2.next()){
		            	abcc.add(0);
		            }
		                  
		           
		            session.setAttribute("unread", abcc.size());
		      }
		      
        	   response.sendRedirect(request.getHeader("referer"));
        }
    } catch (Exception e) {
        System.out.println("Exception 오류2 -> "+e.getMessage());
    } finally {
        Querys.close(conn);
    }
%>
</body>
</html>