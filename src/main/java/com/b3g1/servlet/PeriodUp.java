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


@WebServlet("/PeriodUp")
public class PeriodUp extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
			int result = Utility.periodUp(request.getParameter("periodID"));
			if(result>=1) {
				HttpSession session = request.getSession();
				session.setAttribute("uNO_PERIOD", result);
				PrintWriter writer = response.getWriter();
				writer.println("<script>alert('출석체크 성공'); location.href='index.jsp';</script>"); 
				writer.close();
			}else {
				PrintWriter writer = response.getWriter();
				writer.println("<script>alert('뭔가이상해요'); history.back();</script>"); 
				writer.close();
			}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
