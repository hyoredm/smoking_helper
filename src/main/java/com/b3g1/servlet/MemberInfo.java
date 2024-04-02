package com.b3g1.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.b3g1.util.Utility;


@WebServlet("/user")
public class MemberInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	
		String uID = request.getParameter("uID");
		String uPW = request.getParameter("uPW");
		String uNAME = request.getParameter("uNAME");
		String uNICKNAME = request.getParameter("uNICKNAME");
		String uBIRTH = request.getParameter("year")+"년"+request.getParameter("month")+"월"+request.getParameter("day")+"일";
		String uPW_Q = request.getParameter("uPW_Q");
		String uPW_A = request.getParameter("uPW_A");
		String uGOAL = request.getParameter("uGOAL");
		
	int result =Utility.insertDB(uID,uPW,uNAME,uNICKNAME,uBIRTH,uPW_Q,uPW_A,uGOAL);
		if(result==1) {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('회원가입 성공'); location.href='index.jsp';</script>"); 
			writer.close();
		}else {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('아이디 또는 닉네임이 중복입니다'); history.back();</script>"); 
			writer.close();
		}
		
	}
	
	

	
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
