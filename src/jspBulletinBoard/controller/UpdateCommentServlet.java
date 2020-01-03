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

import jspBulletinBoard.dao.CommentDAO;
import jspBulletinBoard.vo.Comment;
import jspBulletinBoard.vo.Student;
// DAO의 댓글 수정 메소드에 접는 하는 서블릿
@WebServlet("/from/updatecomment")
public class UpdateCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Student student = (Student)session.getAttribute("student");
		
		String commentContent = request.getParameter("commentContent");
		
		int commentNo = 0;
		int postNo = 0;
		
		if(request.getParameter("commentNo") != null){
			commentNo = Integer.parseInt(request.getParameter("commentNo"));
		}
		if(request.getParameter("postNo") != null){
			postNo = Integer.parseInt(request.getParameter("postNo"));
		}
		if(commentNo == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"유효하지 않은 댓글입니다.\");");
			script.println("history.go(-1)");
			script.println("</script>");
		}
		if(postNo == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"유효하지 않은 게시글입니다.\");");
			script.println("history.go(-1)");
			script.println("</script>");
		}
		
		
		Comment commentParam = new Comment();
		commentParam.setCommentNo(commentNo);
		commentParam.setCommentContent(commentContent);
		CommentDAO commentDAO = new CommentDAO();
		Comment comment = new Comment();
		
		comment = commentDAO.selectComment(commentParam);
			
		if(comment != null && student.getSid() != comment.getSid()){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"권한이 없습니다.\");");
			script.println("history.go(-1)");
			script.println("</script>");
		}else if(comment == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"존재하지 않는 댓글 입니다.\");");
			script.println("history.go(-1)");
			script.println("</script>");
		}
		
		int success = commentDAO.updateComment(commentParam);

		if(success ==1){
			request.removeAttribute("comment");
			response.sendRedirect(request.getContextPath() + "/from/post?postNo=" + postNo);
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"댓글 수정에 실패하였습니다.\");");
			script.println("history.go(-1);");
			script.println("</script>");
		}
	}

}
