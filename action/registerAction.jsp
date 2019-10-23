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
/*	List<Object> parameters = new ArrayList<Object>();
	parameters.add(Integer.parseInt(SID));
	parameters.add(userName);
	parameters.add(userPassword);
	parameters.add(Integer.parseInt(grade));
	parameters.add(subject);  */
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 체크</title>
</head>
<body>

<%

	try {
		// JDBC 드라이버 로딩
		Class.forName("com.mysql.cj.jdbc.Driver"); 
	} catch (ClassNotFoundException e) {
		throw new RuntimeException(e);
	}

	Connection connection = null;
	PreparedStatement preparedStatement = null; // 회원검색 용
	PreparedStatement preparedStatement2 = null; // 회원가입 용
	ResultSet resultSet = null; // 회원검색
	int updateQuery = 0;
	Student student = null;


	try{
	// 데이터베이스 연결
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbulletinboard?useSSL=false&serverTimezone=UTC", "root", "1111");
	
	//쿼리문 처리 객체 생성
		preparedStatement = connection.prepareStatement("SELECT * FROM student WHERE SID = ?");
		preparedStatement.setInt(1, Integer.parseInt(sid));
		resultSet = preparedStatement.executeQuery();
		if(resultSet.first()){ %>
			<script>
				alert("이미 같은 학번이 존재합니다.");
				history.go(-1)
			</script>
			
<%		
		}else{ %>
<% 		
			preparedStatement2 = connection.prepareStatement("INSERT INTO student VAlUES(?,?,?,?,?,0)");
			preparedStatement2.setInt(1,Integer.parseInt(sid));
			preparedStatement2.setString(2,name);
			preparedStatement2.setString(3,password);
			preparedStatement2.setInt(4,Integer.parseInt(grade));
			preparedStatement2.setString(5,subject);
			
			updateQuery = preparedStatement2.executeUpdate();
		}
		
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
				preparedStatement.close();
			}catch(SQLException e){
			
			}
		}
		
		if(preparedStatement2 != null){
			try{
				preparedStatement2.close();
			}catch(SQLException e){
			
			}
		}
		
		if(connection != null){
			try{
				connection.close();
			}catch(SQLException e){
			
			}
		}
	
	}
%>

<%  
	if(updateQuery == 1){ %>
		<script>
			alert("회원가입 완료. 로그인 해주세요.");
			
			 window.location = '../loginFormPage.jsp';
		</script>
	
<%}
%>   
</body>
</html>