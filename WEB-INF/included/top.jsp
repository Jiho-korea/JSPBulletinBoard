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
<meta name="viewport" content="width=device-width , initial-scale=1">
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" >
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
	
	<title>top</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand navbar-light bg-light">
  <a class="navbar-brand" href="${pageContext.request.contextPath}/from/main">JSP 게시판 웹사이트</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample02" aria-controls="navbarsExample02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarsExample02">
    <ul class="navbar-nav mr-auto">
    <%if(type.equals("board")){ %>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/from/main">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/from/board">게시판</a>
      </li>
      <%}else if(type.equals("main")){ %>
      <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/from/main">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/from/board">게시판</a>
      </li>
      <%} %>
    </ul>

    <ul class="navbar-nav right">
    	<li class="nav-item active">
        <a class="nav-link" >안녕하세요! <jsp:getProperty property="name" name="student"/> 님!</a>
      	</li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/from/logout">로그아웃</a>
      </li>
    </ul>
  </div>
</nav>
</body>
</html>