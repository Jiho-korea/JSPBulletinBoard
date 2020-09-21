package jspBulletinBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ComHandlerInterface;
import jspBulletinBoard.dao.PostDAO;
import jspBulletinBoard.exception.PostingException;
import jspBulletinBoard.service.PostService;
import jspBulletinBoard.vo.Post;

public class PostingHandler implements ComHandlerInterface {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		int SID = (Integer) session.getAttribute("login");

		String title = request.getParameter("title");
		String content = request.getParameter("content");

		if (title == null || content == null || title.equals("") || content.equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"입력안된 사항이 있습니다.\");");
			script.println("history.go(-1)");
			script.println("</script>");
			script.flush();
		}

		Post post = new Post();
		post.setTitle(title);
		post.setSid(SID);
		post.setContent(content);

		try {
			PostService postService = new PostService(new PostDAO());
			postService.post(post);
			response.sendRedirect("board");
			return null;
		} catch (PostingException e) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"게시글 작성 실패.\");");
			script.println("history.go(-1)");
			script.println("</script>");
			script.flush();
			return null;
		}
	}

}
