<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jspBulletinBoard.Post" %>
<%@page import="jspBulletinBoard.PostDAO"%>

<jsp:useBean id="student" class="jspBulletinBoard.Student" scope="session"/>
<%

	request.setCharacterEncoding("utf-8");

	String SID = (String)session.getAttribute("login");

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	if(title == null || content == null || title.equals("") || content.equals("")){
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
<title>Insert title here</title>
</head>
<body>
<%
	PostDAO postDAO = new PostDAO();
	int postNo = postDAO.getPostNo();
	
	int updateQuery = postDAO.write(String.valueOf(postNo), title, SID, content);

	if(updateQuery ==1){
		response.sendRedirect("../from/fromBoardPage.jsp");
	}
%>
	
</body>
</html>