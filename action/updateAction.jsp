<%@page import="jspBulletinBoard.Post"%>
<%@page import="java.io.PrintWriter"%>
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
	ConnectDB connectDB = new ConnectDB();
	Connection connection = null;
	PreparedStatement preparedStatement1 = null; 
	ResultSet resultSet1 = null;

	request.setCharacterEncoding("utf-8");

	String sid = (String)session.getAttribute("login");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	Post post = new Post();
	int postNo = 0;
	if(request.getParameter("postNo") != null){
		postNo = Integer.parseInt(request.getParameter("postNo"));
	}
	if(postNo == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert(\"유효하지 않은 글입니다.\");");
		script.println("location.href = '../from/fromBoardPage.jsp'");
		script.println("</script>");
	}else if(title == null || content == null || title.equals("") || content.equals("")){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert(\"입력안된 사항이 있습니다.\");");
		script.println("location.href = '../from/fromBoardPage.jsp'");
		script.println("</script>");
	}else {
		connection = connectDB.connect();     
		
		preparedStatement1 = connection.prepareStatement("SELECT POST_NO, TITLE, SID,  POSTINGDATE, CONTENT, AVAILABLE " + 
				"FROM post WHERE AVAILABLE = 1 AND POST_NO = ?");
		preparedStatement1.setInt(1, postNo);

		resultSet1 = preparedStatement1.executeQuery();
		
		while(resultSet1.next()){
		//POST_NO,TITLE,SID,POSTINGDATE,CONTENT,AVAILABLE
		post.setPostNo(resultSet1.getInt("POST_NO"));
		post.setTitle(resultSet1.getString("TITLE"));
		post.setSid(resultSet1.getInt("SID"));
		post.setPostingdate(resultSet1.getString("POSTINGDATE"));
		post.setContent(resultSet1.getString("CONTENT"));
		post.setAvailable(resultSet1.getInt("AVAILABLE"));
		}
		
		if(!sid.equals(post.getSid()+"")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"권한이 없습니다.\");");
			script.println("location.href = '../from/fromBoardPage.jsp'");
			script.println("</script>");
		}
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	PreparedStatement preparedStatement2 = connection.prepareStatement("UPDATE post SET TITLE = ? , CONTENT = ?  WHERE POST_NO = ?");
	ResultSet resultSet2 = preparedStatement1.executeQuery();
	
	preparedStatement2.setString(1,title);
	preparedStatement2.setString(2,content);
	preparedStatement2.setInt(3,postNo);
	
	int updateQuery = preparedStatement2.executeUpdate();

	if(updateQuery ==1){
		response.sendRedirect("../from/fromBoardPage.jsp");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert(\"수정에 실패하였습니다.\");");
		script.println("history.go(-1);");
		script.println("</script>");
	}
%>
	
</body>
</html>