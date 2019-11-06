<%@page import="jspBulletinBoard.Student"%>
<%@page import="jspBulletinBoard.StudentDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.lang.RuntimeException"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="student" class="jspBulletinBoard.Student" scope="session"/>
<%
	request.setCharacterEncoding("utf-8");
  // 아이디 기억 유무
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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지로 이동</title>
</head>
<body>
	<jsp:setProperty property="*" name="student"/>
	<jsp:setProperty property="name" name="student"  value="<%= loginStudent.getName() %>"/>
	<jsp:setProperty property="grade" name="student"  value="<%= loginStudent.getGrade()%>"/>
	<jsp:setProperty property="subject" name="student"  value="<%= loginStudent.getSubject()%>"/>
	<jsp:setProperty property="manager" name="student"  value="<%= loginStudent.getManager()%>"/>
	<jsp:forward page="/WEB-INF/mainPage.jsp"/>
	<%
		}else{ %>
			<script>
			alert("로그인 실패! ID, password 를 확인 해주세요.");
			history.go(-1);
			</script>	
<%
		}
%>
</body>
</html>