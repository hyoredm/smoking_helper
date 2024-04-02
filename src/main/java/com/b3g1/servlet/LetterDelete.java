package com.b3g1.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b3g1.util.Utility;


@WebServlet("/LetterDelete")
public class LetterDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	 int NUM =  Integer.parseInt(request.getParameter("NUM"));
	 int result = Utility.letterDELETE(NUM);
	 if(result == 1) {
		 PrintWriter writer = response.getWriter();
		 HttpSession session = request.getSession();
writer.println("<script>alert('쪽지삭제성공');document.location='letter?uID="+session.getAttribute("uNICKNAME")+"'</script>"); 
			writer.close();
	 }else {
		 PrintWriter writer = response.getWriter();
			writer.println("<script>alert('쪽지삭제실패'); history.back();</script>"); 
			writer.close();
	 }
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
