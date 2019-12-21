package jspBulletinBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jspBulletinBoard.dao.PostDAO;
import jspBulletinBoard.dao.StudentDAO;
import jspBulletinBoard.vo.Post;

@WebServlet(name = "Post", urlPatterns = { "/from/post" })
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String postNo = request.getParameter("postNo");

		if(postNo == null || postNo.equals("")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"글번호가 잘못 되었습니다.\");");
			script.println("location.href = '../from/board'");
			script.println("</script>");
		}

		Post postParam = new Post();
		postParam.setPostNo(Integer.parseInt(postNo));
		
		PostDAO postDAO = new PostDAO();
		Post post = postDAO.getPostInfo(postParam);
		
		if(post == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"존재하지 않는 게시글 입니다.\");");
			script.println("location.href = '../from/board'");
			script.println("</script>");
		}else {
			request.setAttribute("post", post);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/postPage.jsp"); 
			dispatcher.forward(request, response);
		}
	}
}
