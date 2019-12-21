package jspBulletinBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jspBulletinBoard.dao.PostDAO;

@WebServlet(name = "Board",  urlPatterns = {"/from/board"})
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		boolean nextPage = false;
		
		PostDAO postDAO =new PostDAO();
		nextPage = postDAO.nextPage(pageNumber);
		
		List<Object> postList = postDAO.postList(pageNumber);
		if(postList == null || postList.isEmpty()) {
			PrintWriter script = response.getWriter();
			script.println("<script>");  
			script.println("alert(\"존재하지 않는 페이지입니다.\");");
			script.println("history.go(-1)");
			script.println("</script>");
		}else {
			request.setAttribute("pageNumber", pageNumber);
			request.setAttribute("nextPage", nextPage);
			request.setAttribute("postList", postList);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/boardPage.jsp"); 
			dispatcher.forward(request, response);
		}
	}
}
