<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jspBulletinBoard.vo.Student"%>
<jsp:useBean id="student" class="jspBulletinBoard.vo.Student" scope="session"/>

<%
	String SID = (String)session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
<jsp:include page="included/top.jsp">
	<jsp:param value="main" name="type"/>
</jsp:include>
<br>
</body>
</html>