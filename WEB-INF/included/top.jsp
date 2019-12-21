<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="student" class="jspBulletinBoard.vo.Student" scope="session"/>
<%
	String type = request.getParameter("type");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style>
		a,a:hover{
			color : #000000;
			text-decoration : none;'
		}
	</style>
	
	<title>top</title>
<title>Insert title here</title>
</head>
<body>
<div align="center">
  <a href="${pageContext.request.contextPath}/from/main" style="margin-right: 15%"><font size="5px"><b>JSP 게시판 웹사이트</b></font></a>
	 <b>안녕하세요! <jsp:getProperty property="name" name="student"/> 님!</b>
     	&nbsp;&nbsp;&nbsp;
    <a href="${pageContext.request.contextPath}/from/logout"><input type="button" value="로그아웃"/></a><br><br>
    
    <%if(type.equals("board")){ %>
        <a href="${pageContext.request.contextPath}/from/main">Home </a> &nbsp;&nbsp;&nbsp;
     
        <a href="${pageContext.request.contextPath}/from/board"><b>게시판</b></a>
     
      <%}else if(type.equals("main")){ %>
     
        <a href="${pageContext.request.contextPath}/from/main"><b>Home</b></a> &nbsp;&nbsp;&nbsp;
 
        <a href="${pageContext.request.contextPath}/from/board">게시판</a>
      <%} %>
       
</div>  
</body>
</html>