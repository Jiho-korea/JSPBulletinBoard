<%@page import="jspBulletinBoard.StudentDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="jspBulletinBoard.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%
	request.setCharacterEncoding("utf-8");

	String sid = request.getParameter("sid");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String grade = request.getParameter("grade");
	String subject = request.getParameter("subject");
	
	if(sid == null || name == null || password == null || grade == null || subject == null || sid.equals("") ||subject.equals("") ||password.equals("") ||grade.equals("") ||name.equals("")){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert(\"입력안된 사항이 있습니다.\");");
		script.println("history.go(-1)");
		script.println("</script>");
		
	}

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 체크</title>
</head>
<body>

<%
	StudentDAO studentDAO = new StudentDAO();
	int checkRegistration = studentDAO.checkRegistration(sid);
	int updateCount = 0;
	
	if(checkRegistration == 1){ %>
			<script>
				alert("이미 같은 학번이 존재합니다.");
				history.go(-1)
			</script>	
<%		
	}else{ %>
<% 		
		updateCount = studentDAO.register(sid, name, password, grade, subject);
	}
%>

<%  
	if(updateCount == 1){ %>
		<script>
			alert("회원가입 완료. 로그인 해주세요.");
			
			 window.location = '../loginFormPage.jsp';
		</script>
	
<%}%>   
</body>
</html>