package jspBulletinBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ComHandlerInterface;
import jspBulletinBoard.dao.CommentDAO;
import jspBulletinBoard.vo.Comment;

public class DeleteCommentHandler implements ComHandlerInterface {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("login");

		int commentNo = 0;
		int postNo = 0;
		if (request.getParameter("commentNo") != null) {
			commentNo = Integer.parseInt(request.getParameter("commentNo"));
		}
		if (request.getParameter("postNo") != null) {
			postNo = Integer.parseInt(request.getParameter("postNo"));
		}

		Comment commentParam = new Comment();
		commentParam.setCommentNo(commentNo);

		CommentDAO commentDAO = new CommentDAO();
		Comment comment = new Comment();

		if (commentNo == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"유효하지 않은 댓글입니다.\");");
			script.println("history.go(-1)");
			script.println("</script>");
			return null;
		} else {

			comment = commentDAO.selectComment(commentParam);

			if (comment != null && !sid.equals(comment.getSid() + "")) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert(\"권한이 없습니다.\");");
				script.println("history.go(-1)");
				script.println("</script>");
				return null;
			} else if (comment == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert(\"존재하지 않는 댓글 입니다.\");");
				script.println("history.go(-1)");
				script.println("</script>");
				return null;
			}
		}

		int success = commentDAO.deleteComment(commentParam);

		if (success == 1) {
			request.removeAttribute("comment");
			return "/from/post?postNo=" + postNo;

		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"댓글 삭제에 실패하였습니다.\");");
			script.println("history.go(-1);");
			script.println("</script>");
			return null;
		}
	}

}
