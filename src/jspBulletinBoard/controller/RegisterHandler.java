package jspBulletinBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ComHandlerInterface;
import jspBulletinBoard.dao.StudentDAO;
import jspBulletinBoard.exception.DuplicateStudentException;
import jspBulletinBoard.service.StudentRegisterService;
import jspBulletinBoard.vo.Student;

public class RegisterHandler implements ComHandlerInterface {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {

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

		StudentRegisterService studentRegisterService = new StudentRegisterService(new StudentDAO());
		try {
			studentRegisterService.regist(studentParam);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"회원가입 완료. 로그인 해주세요.\");");
			script.println(" window.location = '" + request.getContextPath() + "/loginFormPage.jsp';");
			script.println("</script>");
			return null;
		} catch (DuplicateStudentException e) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"이미 같은 학번이 존재합니다.\");");
			script.println("history.go(-1)");
			script.println("</script>");
			return null;
		} catch (Exception e) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"회원가입 실패.\");");
			script.println("history.go(-1)");
			script.println("</script>");
			return null;
		}

	}

}
