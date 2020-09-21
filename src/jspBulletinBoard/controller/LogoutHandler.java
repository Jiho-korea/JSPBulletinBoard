package jspBulletinBoard.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ComHandlerInterface;

public class LogoutHandler implements ComHandlerInterface {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		session.removeAttribute("login");
		session.removeAttribute("student");

		return "/loginFormPage.jsp";// WEB-INF 하위 JSP 폴더로 forward

	}

}
