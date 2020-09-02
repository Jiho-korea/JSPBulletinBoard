package jspBulletinBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ComHandlerInterface;
import jspBulletinBoard.dao.PostDAO;
import jspBulletinBoard.vo.Post;

public class UpdatePostHandler implements ComHandlerInterface {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("login");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		PostDAO postDAO = new PostDAO();
		Post post = new Post();
		int postNo = 0;
		if (request.getParameter("postNo") != null) {
			postNo = Integer.parseInt(request.getParameter("postNo"));
		}

		Post postParam = new Post();
		postParam.setPostNo(postNo);
		postParam.setTitle(title);
		postParam.setContent(content);

		if (postNo == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"유효하지 않은 글입니다.\");");
			script.println("location.href = '../from/board'");
			script.println("</script>");
			return null;
		} else if (title == null || content == null || title.equals("") || content.equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"입력안된 사항이 있습니다.\");");
			script.println("location.href = '../from/board'");
			script.println("</script>");
			return null;
		} else {
			post = postDAO.selectPost(postParam);

			if (post != null && !sid.equals(post.getSid() + "")) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert(\"권한이 없습니다.\");");
				script.println("location.href = '../from/board'");
				script.println("</script>");
				return null;
			} else if (post == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert(\"존재하지 않는 게시글 입니다.\");");
				script.println("location.href = '../from/board'");
				script.println("</script>");
				return null;
			}
		}

		int updateQuery = postDAO.updatePost(postParam);
		if (updateQuery == 1) {
			response.sendRedirect("../from/board");
			return null;
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"수정에 실패하였습니다.\");");
			script.println("history.go(-1);");
			script.println("</script>");
			return null;
		}
	}

}
