<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jspBulletinBoard.ConnectDB" %>

<jsp:useBean id="student" class="jspBulletinBoard.Student" scope="session"/>
<%

	request.setCharacterEncoding("utf-8");

	String SID = (String)session.getAttribute("login");
	
	ConnectDB connectDB = new ConnectDB();
	Connection connection = connectDB.connect();
	String title = request.getParameter("title");
	String content = request.getParameter("content");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	PreparedStatement preparedStatement1 = connection.prepareStatement("SELECT MAX(POST_NO)  + 1  AS POST_NO FROM post");
	ResultSet resultSet = preparedStatement1.executeQuery();
	int postNo = 0;
	while(resultSet.next()){
		postNo = resultSet.getInt("POST_NO");
		if(postNo == 0){
			postNo = 1;
		}
	}
	
	
	PreparedStatement preparedStatement2 = connection.prepareStatement("insert into post(POST_NO,TITLE,SID,POSTINGDATE,CONTENT,AVAILABLE)  VALUES(?,?,?,SYSDATE(),?,1)");
	preparedStatement2.setInt(1,postNo);
	preparedStatement2.setString(2,title);
	preparedStatement2.setInt(3,Integer.parseInt(SID));
	preparedStatement2.setString(4,content);
	
	int updateQuery = preparedStatement2.executeUpdate();

	if(updateQuery ==1){
		response.sendRedirect("../from/fromBoardPage.jsp");
	}
%>
	
</body>
</html>