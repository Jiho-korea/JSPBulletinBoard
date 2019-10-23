<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jspBulletinBoard.Student"%>
<%@page import="jspBulletinBoard.ConnectDB" %>
<%@ include file="../included/getWriter.jspf" %>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@page import="jspBulletinBoard.Post" %>
<jsp:useBean id="student" class="jspBulletinBoard.Student" scope="session"/>
<%
	request.setCharacterEncoding("utf-8");
	String sid = (String)session.getAttribute("login");
	
	
	ConnectDB connectDB = new ConnectDB();
	Connection connection = null;
	PreparedStatement preparedStatement1 = null; 
	PreparedStatement preparedStatement2 = null; 
	ResultSet resultSet = null;
	
	
	int postNo = 0;
	if(request.getParameter("postNo") != null){
		postNo = Integer.parseInt(request.getParameter("postNo"));
	}
	Post post = new Post();
	
	if(postNo == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert(\"유효하지 않은 글입니다.\");");
		script.println("location.href = '../from/fromBoardPage.jsp'");
		script.println("</script>");
	}else {
		
		connection = connectDB.connect();     
		
		preparedStatement1 = connection.prepareStatement("SELECT POST_NO, TITLE, SID,  POSTINGDATE, CONTENT, AVAILABLE " + 
				"FROM post WHERE AVAILABLE = 1 AND POST_NO = ?");
		preparedStatement1.setInt(1, postNo);

		resultSet = preparedStatement1.executeQuery();
		
		while(resultSet.next()){
		//POST_NO,TITLE,SID,POSTINGDATE,CONTENT,AVAILABLE
		post.setPostNo(resultSet.getInt("POST_NO"));
		post.setTitle(resultSet.getString("TITLE"));
		post.setSid(resultSet.getInt("SID"));
		post.setPostingdate(resultSet.getString("POSTINGDATE"));
		post.setContent(resultSet.getString("CONTENT"));
		post.setAvailable(resultSet.getInt("AVAILABLE"));
		}
		
		if(!sid.equals(post.getSid()+"")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"권한이 없습니다.\");");
			script.println("location.href = '../from/fromBoardPage.jsp'");
			script.println("</script>");
		}
	}
	
	preparedStatement2 = connection.prepareStatement("DELETE FROM post WHERE POST_NO = ?");
	preparedStatement2.setInt(1, postNo);
	
	int updateQuery = preparedStatement2.executeUpdate();

	if(updateQuery ==1){
		response.sendRedirect("../from/fromBoardPage.jsp");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert(\"삭제에 실패하였습니다.\");");
		script.println("history.go(-1);");
		script.println("</script>");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>