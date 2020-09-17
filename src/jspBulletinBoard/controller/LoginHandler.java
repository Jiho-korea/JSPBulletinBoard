package jspBulletinBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ComHandlerInterface;
import jspBulletinBoard.dao.StudentDAO;
import jspBulletinBoard.exception.StudentNotFoundException;
import jspBulletinBoard.service.LoginService;
import jspBulletinBoard.vo.Student;

public class LoginHandler implements ComHandlerInterface {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String bool = request.getParameter("memory");
		String sid = request.getParameter("sid");
		String password = request.getParameter("password");
		if (sid == null || password == null || sid.equals("") || password.equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"입력안된 사항이 있습니다.\");");
			script.println("history.go(-1)");
			script.println("</script>");
		}
		Student student = new Student();
		student.setSid(Integer.parseInt(sid));
		student.setPassword(password);

		LoginService loginService = new LoginService(new StudentDAO());
		try {
			student = loginService.login(student);
			session.setAttribute("login", student.getSid());
			if (bool != null && (bool.equals("memory"))) {
				session.setAttribute("login1", student.getSid());
			} else {
				session.removeAttribute("login1");
			}
			session.setAttribute("student", student);
			return "/WEB-INF/mainPage.jsp";

		} catch (StudentNotFoundException e) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"로그인 실패! ID, password 를 확인 해주세요.\");");
			script.println("history.go(-1)");
			script.println("</script>");
			script.flush();
			return null;
		} catch (Exception e) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"로그인 실패.\");");
			script.println("history.go(-1)");
			script.println("</script>");
			return null;
		}

	}

}
