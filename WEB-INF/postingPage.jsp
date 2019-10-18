<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jspBulletinBoard.Student"%>
<%@ page import="jspBulletinBoard.ConnectDB" %>
<jsp:useBean id="student" class="jspBulletinBoard.Student" scope="session"/>
<%
	request.setCharacterEncoding("utf-8");
	String SID = (String)session.getAttribute("login");

	ConnectDB connectDB = new ConnectDB();
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
	</style>
	
	<title>게시판작성페이지</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand navbar-light bg-light">
  <a class="navbar-brand" href="<%=request.getContextPath() %>/from/fromMainPage.jsp">JSP 게시판 웹사이트</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample02" aria-controls="navbarsExample02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarsExample02">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath() %>/from/fromMainPage.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="<%=request.getContextPath() %>/from/fromBoardPage.jsp">게시판</a>
      </li>
    </ul>

    <ul class="navbar-nav right">
    	<li class="nav-item active">
        <a class="nav-link" >안녕하세요!  <jsp:getProperty property="name" name="student"/>  님!</a>
      	</li>
      <li class="nav-item">
        <a class="nav-link" href="<%= request.getContextPath()%>/from/fromLoginPage.jsp">로그아웃</a>
      </li>
    </ul>
  </div>
</nav>

<div class="container" style="margin-top:60px">
	<div class="row-col" >
		<form method="post" action="<%= request.getContextPath() %>/action/writeAction.jsp">
			<table class="table table-striped" style="text-align: center; border: 1px solid  #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="30" required  autofocus></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="content" maxlength="2048" style="height: 350px;" required></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit"  class="btn btn-primary pull-right"   style="margin-left:91%" value="글쓰기"/>
		</form>
		
	</div>
</div>
</body>
</html>