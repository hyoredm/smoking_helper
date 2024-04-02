package com.b3g1.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.b3g1.dto.UserInfo;
import com.b3g1.util.Utility;


@WebServlet("/pwmypage")
public class pwMyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		UserInfo userinfo = Utility.myPageSelectDB(request.getParameter("uID"));
		
		request.setAttribute("userinfo", userinfo);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("pwMyPage.jsp");
		requestDispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		UserInfo userinfo = Utility.myPageSelectDB(request.getParameter("uID"));
		System.out.println(userinfo);
		request.setAttribute("userinfo", userinfo);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("userModifyMyPage.jsp");
		requestDispatcher.forward(request, response);
	}

}
