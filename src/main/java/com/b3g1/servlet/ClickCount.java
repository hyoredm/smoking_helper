package com.b3g1.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.b3g1.util.Utility;
@WebServlet("/ClickCount")
public class ClickCount extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String click = request.getParameter("click");
        Utility.menuCOUNT(click);
        PrintWriter writer = response.getWriter();
        if(click.equals("board")) {
            response.sendRedirect("board?page=01");
        }
        if(click.equals("letter")){
            HttpSession Session = request.getSession();
            String uNICKNAME=(String)Session.getAttribute("uNICKNAME");
            if(uNICKNAME==null) {
            	writer.println("<script>alert('로그인을 해주시기 바랍니다.');history.back();</script>"); 
                writer.close();
            }
            String encodedString = URLEncoder.encode(uNICKNAME, "UTF-8");
            response.sendRedirect("letter?uID="+encodedString);
        
        }
        if(click.equals("mypage")) {
            response.sendRedirect("mypage");
        }
            writer.println("<script>history.back();</script>"); 
                        writer.close();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}