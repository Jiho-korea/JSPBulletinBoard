package jspBulletinBoard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainPage", urlPatterns = { "/from/main" })
public class MainPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sid =  (String)session.getAttribute("login");
		boolean loginCheck = (sid == null) ? false:true;
		
		if(loginCheck) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/mainPage.jsp"); 
			dispatcher.forward(request, response);
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/loginPage.jsp");
			dispatcher.forward(request, response);
		}
	}
}
