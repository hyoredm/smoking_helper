package com.b3g1.servlet;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b3g1.util.Utility;

@WebServlet("/board")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String page = request.getParameter("page");
		HttpSession session = request.getSession();
		

		if (page.equals("01")) {
			response.sendRedirect("BoardList.jsp");
		} else if (page.equals("02")) {
			LocalDateTime now = LocalDateTime.now();
			String subject = request.getParameter("subject");
			String uNickName = (String) session.getAttribute("uNICKNAME");
			String text_color = request.getParameter("text_color");
			String text_font = request.getParameter("text_font");
			String contents = request.getParameter("contents");
			String ip = request.getRemoteAddr();
			String reg_date = now.toString();
			int uGrade = (int)session.getAttribute("uGRADE");
			Utility.insertBoard(subject, uNickName, text_color, text_font, contents, ip, reg_date, uGrade);
			response.sendRedirect("board?page=01");
		} else if (page.equals("03")) {
			int num = Integer.parseInt(request.getParameter("num"));
			String subject=request.getParameter("subject");
			Utility.updateHit(num);
			Utility.updateAdminHit(subject);
			response.sendRedirect("BoardDetail.jsp?num=" + num);
		} else if (page.equals("04")) {
			LocalDateTime now = LocalDateTime.now();
			String subject = request.getParameter("subject");
			String text_color = request.getParameter("text_color");
			String text_font = request.getParameter("text_font");
			String contents = request.getParameter("contents");
			String mod_date = now.toString();
			int num = Integer.parseInt(request.getParameter("num"));
			Utility.updateList(subject, text_color, text_font, contents, mod_date, num);
			response.sendRedirect("board?page=01");
		} else if (page.equals("05")) {
			int num = Integer.parseInt(request.getParameter("num"));
			Utility.deleteList(num);
			response.sendRedirect("board?page=01");
		}else if (page.equals("06")) {
			String uID=(String)session.getAttribute("uID");
			String COMMENT=request.getParameter("COMMENT");
			int BOARD_NUM=Integer.parseInt(request.getParameter("BOARD_NUM"));
			Utility.insertReport(uID, COMMENT, BOARD_NUM);
			response.sendRedirect("BoardDetail.jsp?num=" + BOARD_NUM);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
