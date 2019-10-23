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
	
	try{ 
		Class.forName("com.mysql.cj.jdbc.Driver");
	}catch(ClassNotFoundException e){
		throw new RuntimeException(e);
	}
	
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	
	try{
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbulletinboard?useSSL=false&serverTimezone=UTC","root","1111");
		preparedStatement = connection.prepareStatement("SELECT * FROM student WHERE SID = ? AND PASSWORD = ? ");
		preparedStatement.setInt(1, Integer.parseInt(sid));
		preparedStatement.setString(2,password);
		
		resultSet = preparedStatement.executeQuery();
		
		if(resultSet.first()){
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
	<jsp:setProperty property="name" name="student"  value="<%= resultSet.getString(\"NAME\") %>"/>
	<jsp:setProperty property="grade" name="student"  value="<%= resultSet.getInt(\"GRADE\")%>"/>
	<jsp:setProperty property="subject" name="student"  value="<%= resultSet.getString(\"SUBJECT\")%>"/>
	<jsp:setProperty property="manager" name="student"  value="<%= resultSet.getInt(\"MANAGER\")%>"/>
	<jsp:forward page="/WEB-INF/mainPage.jsp"/>
	<%
		}else{ %>
			<script>
			alert("로그인 실패! ID, password 를 확인 해주세요.");
			history.go(-1);
			</script>	
<%	}	
	}catch(SQLException e){
		throw e;
	}finally{
		if(resultSet != null){
			try{
				resultSet.close();
			}catch(SQLException e){
				
			}
		}
		if(preparedStatement != null){
			try{
				resultSet.close();
			}catch(SQLException e){
				
			}
		}
		if(connection != null){
			try{
				resultSet.close();
			}catch(SQLException e){
				
			}
		}
	}
	
%>
</body>
</html>