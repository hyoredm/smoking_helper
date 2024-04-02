package com.b3g1.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b3g1.dto.DTOClass;
import com.b3g1.util.Utility;


@WebServlet("/LetterDetail")
public class LetterDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int num =  Integer.parseInt(request.getParameter("NUM")); 
		List<DTOClass> result = Utility.letterDETAIL(num);
		   HttpSession session = request.getSession();
		int unread = Utility.Unread((String)session.getAttribute("uNICKNAME"));
		session.setAttribute("unread", unread);
		request.setAttribute("LTD", result);
		RequestDispatcher rd = request.getRequestDispatcher("LetterDetail.jsp");
		rd.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
