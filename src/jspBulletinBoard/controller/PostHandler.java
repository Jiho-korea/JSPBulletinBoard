package jspBulletinBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ComHandlerInterface;
import jspBulletinBoard.dao.CommentDAO;
import jspBulletinBoard.dao.PostDAO;
import jspBulletinBoard.vo.Comment;
import jspBulletinBoard.vo.Post;
import jspBulletinBoard.vo.Student;

public class PostHandler implements ComHandlerInterface {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		response.setCharacterEncoding("UTF-8");

		String postNo = request.getParameter("postNo");
		Student student = (Student) session.getAttribute("student");
		// 댓글을 수정하려는지 검사하는 코드
		int commentNo = 0;
		if (request.getParameter("commentNo") != null && !"0".equals(request.getParameter("commentNo"))) {
			commentNo = Integer.parseInt(request.getParameter("commentNo"));
		}

		if (postNo == null || postNo.equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"글번호가 잘못 되었습니다.\");");
			script.println("location.href = '../from/board'");
			script.println("</script>");
			return null;
		}

		Post postParam = new Post();
		postParam.setPostNo(Integer.parseInt(postNo));

		PostDAO postDAO = new PostDAO();
		Post post = postDAO.getPostInfo(postParam);

		if (post == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"존재하지 않는 게시글 입니다.\");");
			script.println("location.href = '../from/board'");
			script.println("</script>");
			return null;
		} else {
			request.setAttribute("post", post);
			if (commentNo != 0) {
				CommentDAO commentDAO = new CommentDAO();
				Comment comment = new Comment();
				comment.setCommentNo(commentNo);
				comment = commentDAO.selectComment(comment);

				if (comment != null && student.getSid() != comment.getSid()) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert(\"권한이 없습니다.\");");
					script.println("history.go(-1)");
					script.println("</script>");
					return null;
				} /*
					 * else if (comment == null) { PrintWriter script = response.getWriter();
					 * script.println("<script>"); script.println("alert(\"존재하지 않는 댓글 입니다.\");");
					 * script.println("history.go(-1)"); script.println("</script>"); return null; }
					 */ else {
					request.setAttribute("comment", comment);

				}
			}
			return "/WEB-INF/postPage.jsp";

		}
	}

}
