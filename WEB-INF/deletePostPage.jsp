<%@page import="jspBulletinBoard.PostDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jspBulletinBoard.Student"%>
<%@ include file="included/getWriter.jspf" %>
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
	
	int postNo = 0;
	if(request.getParameter("postNo") != null){
		postNo = Integer.parseInt(request.getParameter("postNo"));
	}
	PostDAO postDAO = new PostDAO();
	Post post = new Post();
	
	if(postNo == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert(\"유효하지 않은 글입니다.\");");
		script.println("location.href = '../from/fromBoardPage.jsp'");
		script.println("</script>");
	}else {
		
		post = postDAO.getPostInfo(String.valueOf(postNo));
		
		if(!sid.equals(post.getSid()+"")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"권한이 없습니다.\");");
			script.println("location.href = '../from/fromBoardPage.jsp'");
			script.println("</script>");
		}
	}
	
	int updateQuery = postDAO.deletePost(String.valueOf(postNo));

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