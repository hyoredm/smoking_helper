package com.b3g1.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b3g1.db.MySQLconnector;
import com.b3g1.dto.UserInfo;
import com.b3g1.util.Utility;


@WebServlet("/modify")
public class ModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		UserInfo userinfo = Utility.myPageSelectDB(request.getParameter("uID"));
		
		request.setAttribute("userinfo", userinfo);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("userModifyMyPage.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		MySQLconnector.connectDB();
		
		HttpSession session = request.getSession();
		
		String uID = request.getParameter("uID");
		String uNICKNAME = request.getParameter("uNICKNAME");
		session.setAttribute("uNICKNAME", uNICKNAME);
		String year = request.getParameter("year");
		if(year == null) {
			year = request.getParameter("years");
		}
		String month = request.getParameter("month");
		if(month == null) {
			month = request.getParameter("months");
		}
		String day = request.getParameter("day");
		if(day == null) {
			day = request.getParameter("days");
		}
		String uBIRTH = year +"년"+ month +"월"+ day+"일";
		String PW_Q  = request.getParameter("PW_Q");
		String PW_A = request.getParameter("PW_A");
		int uGOAL = Integer.parseInt(request.getParameter("uGOAL"));
		System.out.println(request.getParameter("uNO_PERIOD"));
		
		System.out.println(request.getParameter("years"));
		Utility.myPageModifyDB(uNICKNAME, uBIRTH, PW_Q, PW_A, uGOAL, uID);
		// 값 넘기면서 이동111
		UserInfo userinfo = Utility.myPageSelectDB(request.getParameter("uID"));
		request.setAttribute("userinfo", userinfo);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("userMyPage.jsp");
		requestDispatcher.forward(request, response);
	}


}
