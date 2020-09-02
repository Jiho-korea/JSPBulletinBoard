package jspBulletinBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ComHandlerInterface;
import jspBulletinBoard.dao.CommentDAO;
import jspBulletinBoard.vo.Comment;
import jspBulletinBoard.vo.Student;

public class CommentHandler implements ComHandlerInterface {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("student");

		int postNo = Integer.parseInt(request.getParameter("postNo"));
		String commentContent = request.getParameter("commentContent");

		if (commentContent == null || commentContent.equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"올바르게 입력을 해주세요.\");");
			script.println("history.go(-1)");
			script.println("</script>");
		}

		Comment comment = new Comment();
		comment.setCommentContent(commentContent);
		comment.setSid(student.getSid());
		comment.setPostNo(postNo);

		CommentDAO commentDAO = new CommentDAO();

		int success = commentDAO.insertComment(comment);

		if (success == 1) {
			return "/from/post?postNo=" + postNo;
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"댓글 작성 실패.\");");
			script.println("history.go(-1)");
			script.println("</script>");
			return null;
		}
	}

}
