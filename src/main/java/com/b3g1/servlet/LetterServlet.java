package com.b3g1.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.b3g1.dto.DTOClass;
import com.b3g1.util.Utility;


@WebServlet("/letter")
public class LetterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String uID = request.getParameter("uID");
		
		List<DTOClass> abc = Utility.letterREAD(uID);
		
		request.setAttribute("letters", abc);
		RequestDispatcher rd = request.getRequestDispatcher("LetterBox.jsp");
		rd.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
