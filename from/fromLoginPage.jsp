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
<title>Insert title here</title>
</head>
<body>
<%
	if(loginAttribute){
		session.removeAttribute("login");
	%>
		<jsp:forward page="../loginFormPage.jsp"/>
<%}else{ 
		response.sendRedirect("../loginFormPage.jsp");
	}
%>
	
</body>
</html>