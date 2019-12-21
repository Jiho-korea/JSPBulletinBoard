package jspBulletinBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jspBulletinBoard.dao.PostDAO;
import jspBulletinBoard.vo.Post;

@WebServlet(name = "DeletePost", urlPatterns = { "/from/delete" })
public class DeletePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sid = (String)session.getAttribute("login");
		
		int postNo = 0;
		if(request.getParameter("postNo") != null){
			postNo = Integer.parseInt(request.getParameter("postNo"));
		}
		
		Post postParam = new Post();
		postParam.setPostNo(postNo);
		
		PostDAO postDAO = new PostDAO();
		Post post = new Post();
		
		if(postNo == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"유효하지 않은 글입니다.\");");
			script.println("location.href = '../from/board'");
			script.println("</script>");
		}else {
			
			post = postDAO.getPostInfo(postParam);
			
			if(post != null && !sid.equals(post.getSid()+"")){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert(\"권한이 없습니다.\");");
				script.println("location.href = '../from/board'");
				script.println("</script>");
			}else if(post == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert(\"존재하지 않는 게시글 입니다.\");");
				script.println("location.href = '../from/board'");
				script.println("</script>");
			}
		}
		
		int updateQuery = postDAO.deletePost(postParam);

		if(updateQuery ==1){
			response.sendRedirect("../from/board");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"삭제에 실패하였습니다.\");");
			script.println("history.go(-1);");
			script.println("</script>");
		}
	}
}
