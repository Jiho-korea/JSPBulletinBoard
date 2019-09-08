<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String SID = (String)session.getAttribute("login");
	boolean loginAttribute = (SID == null) ? false : true;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판작성페이지</title>
</head>
<body>
<%
	if(loginAttribute){%>
		<jsp:forward page="../WEB-INF/postingPage.jsp"/>
<%}else{ 
		response.sendRedirect("../loginFormPage.jsp");
	}
%>
</body>
</html>