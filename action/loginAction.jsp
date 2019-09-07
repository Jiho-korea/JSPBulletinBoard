<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.lang.RuntimeException"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String bool = request.getParameter("memory");    
	String SID = request.getParameter("SID");    
	String userPassword = request.getParameter("userPassword");    
	
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
		preparedStatement.setInt(1, Integer.parseInt(SID));
		preparedStatement.setString(2,userPassword);
		
		resultSet = preparedStatement.executeQuery();
		
		if(resultSet.first()){
			session.setAttribute("login", SID);
			if(bool != null&&(bool.equals("memory"))){
					session.setAttribute("login1", SID);
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