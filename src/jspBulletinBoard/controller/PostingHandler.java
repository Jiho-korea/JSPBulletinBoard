package jspBulletinBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ComHandlerInterface;
import jspBulletinBoard.dao.PostDAO;
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
		}

		PostDAO postDAO = new PostDAO();
		int postNo = postDAO.getPostNo();
		// String postNo , String title, String sid , String content
		Post postParam = new Post();
		postParam.setPostNo(postNo);
		postParam.setTitle(title);
		postParam.setSid(SID);
		postParam.setContent(content);

		int updateQuery = postDAO.write(postParam);

		if (updateQuery == 1) {
			response.sendRedirect("board");
			return null;
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"게시글 작성 실패.\");");
			script.println("history.go(-1)");
			script.println("</script>");
			return null;
		}
	}

}
