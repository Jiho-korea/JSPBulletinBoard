package jspBulletinBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ComHandlerInterface;
import jspBulletinBoard.dao.CommentDAO;
import jspBulletinBoard.dao.PostDAO;
import jspBulletinBoard.exception.NonExistentCommentException;
import jspBulletinBoard.exception.NonExistentPostException;
import jspBulletinBoard.exception.UnauthenticatedException;
import jspBulletinBoard.service.UpdateCommentService;
import jspBulletinBoard.service.ViewPostService;
import jspBulletinBoard.vo.Comment;
import jspBulletinBoard.vo.Post;
import jspBulletinBoard.vo.Student;

public class PostHandler implements ComHandlerInterface {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		String postNo = request.getParameter("postNo");
		Student student = (Student) session.getAttribute("student");
		// 댓글을 수정하려는지 검사하는 코드
		int commentNo = 0;
		if (request.getParameter("commentNo") != null && !"0".equals(request.getParameter("commentNo"))) {
			commentNo = Integer.parseInt(request.getParameter("commentNo"));
		}
		// 이상한 글번호를 파라미터로 주었을 때
		if (postNo == null || postNo.equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"글번호가 잘못 되었습니다.\");");
			script.println("location.href = '../from/board'");
			script.println("</script>");
			return null;
		}

		Post post = new Post();
		post.setPostNo(Integer.parseInt(postNo));

		// 수정
		ViewPostService viewPostService = new ViewPostService(new PostDAO());
		try {
			post = viewPostService.getPostInfo(post);
			request.setAttribute("post", post);

			// 댓글 수정하려 할 때 수행됨
			if (commentNo != 0) {
				UpdateCommentService updateCommentService = new UpdateCommentService(new CommentDAO());
				Comment comment = new Comment();
				comment.setCommentNo(commentNo);
				try {
					comment = updateCommentService.getComment(comment, student);
					request.setAttribute("comment", comment);

				} catch (NonExistentCommentException e) { // 존재하지 않는 댓글을 수정하려 할 때
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert(\"존재하지 않는 댓글 입니다.\");"); // 여기서 오류가 나오네
					script.println("history.go(-1)");
					script.println("</script>");
					script.flush();
					return null;
				} catch (UnauthenticatedException e) { // 댓글 수정 권한이 없을 때
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert(\"권한이 없습니다.\");");
					script.println("history.go(-1)");
					script.println("</script>");
					script.flush();
					return null;
				}
			}
			return "/WEB-INF/postPage.jsp";

		} catch (NonExistentPostException e) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"존재하지 않는 게시글 입니다.\");");
			script.println("location.href = '../from/board'");
			script.println("</script>");
			script.flush();
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"알 수 없는오류.\");");
			script.println("location.href = '../from/board'");
			script.println("</script>");
			script.flush();
			return null;
		}
	}
}
