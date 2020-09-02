package jspBulletinBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ComHandlerInterface;
import jspBulletinBoard.dao.StudentDAO;
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
		Student studentParam = new Student();
		studentParam.setSid(Integer.parseInt(sid));
		studentParam.setPassword(password);

		StudentDAO studentDAO = new StudentDAO();
		Student loginStudent = studentDAO.login(studentParam);

		if (loginStudent != null) { // 반환된 레코드 있을시(로그인 성공시) 학생 정보를 담은 Student 객체 리턴
			session.setAttribute("login", sid);
			if (bool != null && (bool.equals("memory"))) {
				session.setAttribute("login1", sid);
			} else {
				session.removeAttribute("login1");
			}

			session.setAttribute("student", loginStudent);

			return "/WEB-INF/mainPage.jsp";

		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"로그인 실패! ID, password 를 확인 해주세요.\");");
			script.println("history.go(-1)");
			script.println("</script>");
			return null;
		}
	}

}
