package com.b3g1.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.b3g1.util.Utility;


@WebServlet("/FindPW")
public class FindPW extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String uNAME = request.getParameter("uNAME");
			
			String uID = request.getParameter("uID");
		String a =Utility.PWquestion(uNAME, uID);
		
		if(a.equals("false")) {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('정보가 없습니다');history.back();</script>"); 
			writer.close();
		}else {
			request.setAttribute("Question", a);
			request.setAttribute("uNAME", uNAME);
			request.setAttribute("uID", uID);
			RequestDispatcher rd = request.getRequestDispatcher("FindPW2.jsp");
			rd.forward(request, response);

		}
		
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
