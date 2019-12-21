package jspBulletinBoard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Logout",  urlPatterns = {"/from/logout"})
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("login");
		session.removeAttribute("student");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/loginFormPage.jsp"); // WEB-INF 하위 JSP 폴더로 forward 하는 코드
		dispatcher.forward(request, response);
	}
}
