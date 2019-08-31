<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String SID = (String)session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
	<h1>여기는 메인페이지입니다.</h1>

	<p>
		안녕하세요 ! <%= SID %> 님!!
	</p>
</body>
</html>