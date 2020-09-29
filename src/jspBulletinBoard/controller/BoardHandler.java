package jspBulletinBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ComHandlerInterface;
import jspBulletinBoard.dao.PostDAO;
import jspBulletinBoard.exception.NonExistentPageException;
import jspBulletinBoard.service.PostListService;
import jspBulletinBoard.vo.BoardRequest;

public class BoardHandler implements ComHandlerInterface {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		int pageNumber = 1;
		String title = null;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		if (request.getParameter("title") != null) {
			title = request.getParameter("title");
		}
		boolean nextPage = false;

		PostListService postListService = new PostListService(new PostDAO());
		nextPage = postListService.nextPage(pageNumber);
		try {
//			Map<String, Object> boardRequest = new HashMap<String, Object>();
//			boardRequest.put("pageNumber", (pageNumber - 1) * 10);
//			boardRequest.put("title", title);
			BoardRequest boardRequest = new BoardRequest((pageNumber - 1) * 10, title);
			List<Object> postList = postListService.postList(boardRequest);
			request.setAttribute("pageNumber", pageNumber);
			request.setAttribute("nextPage", nextPage);
			request.setAttribute("postList", postList);
			return "/WEB-INF/views/boardPage.jsp";
		} catch (NonExistentPageException e) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"존재하지 않는 페이지입니다.\");");
			script.println("history.go(-1)");
			script.println("</script>");
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"알 수 없는 오류.\");");
			script.println("history.go(-1)");
			script.println("</script>");
			script.flush();
			return null;
		}

	}

}
