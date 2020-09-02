package jspBulletinBoard.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ComHandlerInterface;

public class MainPageHandler implements ComHandlerInterface {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("login");
		boolean loginCheck = (sid == null) ? false : true;

		if (loginCheck) {
			return "/WEB-INF/mainPage.jsp";
		} else {
			return "/loginPage.jsp";
		}
	}

}
