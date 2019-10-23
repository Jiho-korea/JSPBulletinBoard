<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sid =  (String)session.getAttribute("login");
	boolean loginCheck = (sid == null) ? false:true;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
<%
	if(loginCheck){
%>
<jsp:forward page="../WEB-INF/mainPage.jsp"/>

<%}else{ %>
<jsp:forward page="../loginFormPage.jsp"/>
<%} %>
</body>
</html>