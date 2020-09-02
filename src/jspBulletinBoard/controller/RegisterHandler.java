package jspBulletinBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ComHandlerInterface;
import jspBulletinBoard.dao.StudentDAO;
import jspBulletinBoard.vo.Student;

public class RegisterHandler implements ComHandlerInterface {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();

		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		String sid = request.getParameter("sid");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String grade = request.getParameter("grade");
		String subject = request.getParameter("subject");

		if (sid == null || name == null || password == null || grade == null || subject == null || sid.equals("")
				|| subject.equals("") || password.equals("") || grade.equals("") || name.equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"입력안된 사항이 있습니다.\");");
			script.println("history.go(-1)");
			script.println("</script>");
			return null;

		}
		Student studentParam = new Student();
		studentParam.setSid(Integer.parseInt(sid));
		studentParam.setName(name);
		studentParam.setPassword(password);
		studentParam.setGrade(Integer.parseInt(grade));
		studentParam.setSubject(subject);

		StudentDAO studentDAO = new StudentDAO();

		int checkRegistration = studentDAO.checkRegistration(studentParam);
		int updateCount = 0;

		if (checkRegistration == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"이미 같은 학번이 존재합니다.\");");
			script.println("history.go(-1)");
			script.println("</script>");
			return null;
		} else {
			updateCount = studentDAO.register(studentParam);
			if (updateCount == 1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert(\"회원가입 완료. 로그인 해주세요.\");");
				script.println(" window.location = '" + request.getContextPath() + "/loginFormPage.jsp';");
				script.println("</script>");
				return null;
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert(\"회원가입 실패.\");");
				script.println("history.go(-1)");
				script.println("</script>");
				return null;
			}
		}
	}

}
