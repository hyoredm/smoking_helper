package com.b3g1.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.b3g1.util.Utility;


@WebServlet("/FindPW2")
public class FindPW2 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
request.setCharacterEncoding("UTF-8");
		
		String uNAME = request.getParameter("uNAME");
			String answer = request.getParameter("answer");
			String uID = request.getParameter("uID");
			

			String a= Utility.PWanswer(uNAME, uID, answer);
		
		response.setContentType("text/html; charset=UTF-8");
		if(a.equals("false")) {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('정보가 없습니다');history.back();</script>"); 
			writer.close();
		}else {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('비밀번호는"+a+"입니다. 누르면 홈으로 이동합니다');window.location='index.jsp';</script>"); 
			writer.close();
		}
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
