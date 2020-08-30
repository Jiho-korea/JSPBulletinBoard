package jspBulletinBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jspBulletinBoard.dao.StudentDAO;
import jspBulletinBoard.vo.Student;

@WebServlet(name = "Login",  urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String bool = request.getParameter("memory");    
		String sid = request.getParameter("sid");    
		String password = request.getParameter("password");    
		if(sid == null ||  password == null || sid.equals("") ||password.equals("")){
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
		
		if(loginStudent != null){ // 반환된 레코드 있을시(로그인 성공시) 학생 정보를 담은 Student 객체 리턴
			session.setAttribute("login", sid);
			if(bool != null&&(bool.equals("memory"))){
					session.setAttribute("login1", sid);
			}else{
					session.removeAttribute("login1");
			}
		
			session.setAttribute("student", loginStudent);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/mainPage.jsp"); // WEB-INF 하위 JSP 폴더로 forward 하는 코드
			dispatcher.forward(request, response);
		}else{ 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"로그인 실패! ID, password 를 확인 해주세요.\");");
			script.println("history.go(-1)");
			script.println("</script>");
		}
	}
}