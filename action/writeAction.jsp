<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jspBulletinBoard.vo.Post" %>
<%@page import="jspBulletinBoard.dao.PostDAO"%>

<jsp:useBean id="student" class="jspBulletinBoard.vo.Student" scope="session"/>
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
	// String postNo , String title, String sid , String content
	Post postParam = new Post();
	postParam.setPostNo(postNo);
	postParam.setTitle(title);
	postParam.setSid(Integer.parseInt(SID));
	postParam.setContent(content);
	
	int updateQuery = postDAO.write(postParam);

	if(updateQuery ==1){
		response.sendRedirect("../from/fromBoardPage.jsp");
	}
%>
	
</body>
</html>