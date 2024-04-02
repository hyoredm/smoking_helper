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


@WebServlet("/LetterWrite")
public class LetterWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String contents = request.getParameter("CONTENTS");
		String sender = request.getParameter("SENDER_ID");
		String receiver = request.getParameter("RECEIVER_ID");
		response.setContentType("text/html; charset=UTF-8");
		int result = Utility.letterWRITE(contents,sender,receiver);
		 if(result >= 1) {
			 HttpSession session = request.getSession();
				int unread = Utility.Unread((String)session.getAttribute("uNICKNAME"));
				session.setAttribute("unread", unread);
			 PrintWriter writer = response.getWriter();
	writer.println("<script>alert('쪽지전송성공');document.location='letter?uID="+session.getAttribute("uNICKNAME")+"';</script>"); 
				writer.close();
		 }else {
			 PrintWriter writer = response.getWriter();
			 HttpSession session = request.getSession();
				writer.println("<script>alert('쪽지전송실패');document.location='letter?uID="+session.getAttribute("uNICKNAME")+"';</script>"); 
				writer.close();
		 }
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
