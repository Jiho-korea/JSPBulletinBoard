<%@page import="jspBulletinBoard.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@page import="jspBulletinBoard.Student"%>
<%@ page import="jspBulletinBoard.ConnectDB" %>
<%@ include file="../included/getWriter.jspf" %>
<jsp:useBean id="student" class="jspBulletinBoard.Student" scope="session"/>
<%

	request.setCharacterEncoding("utf-8");
	String SID = (String)session.getAttribute("login");
	int pageNumber = 1;
	
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	
	ConnectDB connectDB = new ConnectDB();
	connection = connectDB.connect();
	preparedStatement = connection.prepareStatement("SELECT POST_NO, TITLE, SID, date_format(POSTINGDATE,'%Y-%m-%d') as POSTINGDATE, CONTENT, AVAILABLE " + 
													"FROM post WHERE AVAILABLE = 1 ORDER BY POST_NO DESC LIMIT 10 OFFSET ?");
	preparedStatement.setInt(1, (pageNumber - 1) * 10);
	
	resultSet = preparedStatement.executeQuery();
	List<Post> postList = new ArrayList<Post>();
	
	while(resultSet.next()){
		//POST_NO,TITLE,SID,POSTINGDATE,CONTENT,AVAILABLE
		Post post = new Post();
		post.setPostNo(resultSet.getInt("POST_NO"));
		post.setTitle(resultSet.getString("TITLE"));
		post.setSid(resultSet.getInt("SID"));
		post.setPostingdate(resultSet.getString("POSTINGDATE"));
		post.setContent(resultSet.getString("CONTENT"));
		post.setAvailable(resultSet.getInt("AVAILABLE"));
		
		postList.add(post);
	}
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
	
	<title>게시판메인페이지</title>
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
        <a class="nav-link" >안녕하세요! <jsp:getProperty property="name" name="student"/> 님!</a>
      	</li>
      <li class="nav-item">
        <a class="nav-link" href="<%= request.getContextPath()%>/from/fromLoginPage.jsp">로그아웃</a>
      </li>
    </ul>
  </div>
</nav>

<div class="container" style="margin-top:60px">
	<div class="row">
		<table class="table table-striped" style="text-align: center; border: 1px solid  #dddddd">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center; width:15%">글번호</th>
					<th style="background-color: #eeeeee; text-align: center; width:55%">제목</th>
					<th style="background-color: #eeeeee; text-align: center; width:10%">작성자</th>
					<th style="background-color: #eeeeee; text-align: center; width:20%">작성일</th>
				</tr>
			</thead>
			<tbody>
				
					<%
						for(int i = 0; i<postList.size(); i++){
							String writer = getWriter(postList.get(i).getSid());
					%>
					<tr>
					<td><%= postList.get(i).getPostNo() %></td>
					<td><%= postList.get(i).getTitle() %></td>
					<td><%= writer%></td>
					<td><%= postList.get(i).getPostingdate() %></td>
					</tr>
					<%
						}
					
						connectDB.release();
					%>
				
			</tbody>
		</table>
		<a href="<%=request.getContextPath() %>/from/fromPostingPage.jsp" class="btn btn-primary pull-right"   style="margin-left:91%">글쓰기</a>
	</div>
</div>
</body>
</html>