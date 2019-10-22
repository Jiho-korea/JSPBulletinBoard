<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jspBulletinBoard.Student"%>
<jsp:useBean id="student" class="jspBulletinBoard.Student" scope="session"/>

<%
	request.setCharacterEncoding("utf-8");
	String SID = (String)session.getAttribute("login");

	//Student student = getPersonalInfo(Integer.parseInt(SID));
%>
<!DOCTYPE html>
<html>
<head>
	
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width , initial-scale=1">
	<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet" >

	<style>
		#main{
			width: 40%;
			margin-top:50px;
	
		}
		
		a,a:hover{
			color : #000000;
			text-decoration : none;'
		}
	</style>
	<title>메인페이지</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../included/top.jsp">
	<jsp:param value="main" name="type"/>
</jsp:include>
</body>
</html>