<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="student" class="jspBulletinBoard.vo.Student"
	scope="session" />
<%
	String type = request.getParameter("type");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width , initial-scale=1">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" >
<style>
#main {
	width: 40%;
	margin-top: 50px;
}

a, a:hover {
	color: #000000;
	text-decoration: none;
	'
}
</style>

<title>top</title>
<script defer src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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



<%-- 여기서 부터 css 없는 거/////////////  
	<div align="center">
		<a href="${pageContext.request.contextPath}/from/main"
			style="margin-right: 15%"><font size="5px"><b>JSP 게시판
					웹사이트</b></font></a> <b>안녕하세요! <jsp:getProperty property="name" name="student" />
			님!
		</b> &nbsp;&nbsp;&nbsp; <a
			href="${pageContext.request.contextPath}/from/logout"><input
			type="button" value="로그아웃" /></a><br>
		<br>

		<%
			if (type.equals("board")) {
		%>
		<a href="${pageContext.request.contextPath}/from/main">Home </a>
		&nbsp;&nbsp;&nbsp; <a
			href="${pageContext.request.contextPath}/from/board"><b>게시판</b></a>

		<%
			} else if (type.equals("main")) {
		%>

		<a href="${pageContext.request.contextPath}/from/main"><b>Home</b></a>
		&nbsp;&nbsp;&nbsp; <a
			href="${pageContext.request.contextPath}/from/board">게시판</a>
		<%
			}
		%>

	</div>
	--%>
</body>
</html>