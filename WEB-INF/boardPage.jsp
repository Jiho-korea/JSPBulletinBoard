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

	Connection connection = null;
	PreparedStatement preparedStatement = null; // 10개씩 게시글을 짤라서 테이블로 보여주는데 사용된다.
	ResultSet resultSet = null;
	PreparedStatement preparedStatement2 = null; // 2는 다음페이지가 있는지 확인하는 용도
	ResultSet resultSet2 = null;
	
	ConnectDB connectDB = new ConnectDB();
	connection = connectDB.connect();     
	
	
	int pageNumber = 1;
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	boolean nextPage = false;
	preparedStatement2 = connection.prepareStatement("SELECT POST_NO, TITLE, SID,  POSTINGDATE, CONTENT, AVAILABLE " + 
			"FROM post WHERE AVAILABLE = 1 ORDER BY POST_NO DESC LIMIT 10 OFFSET ?");
	preparedStatement2.setInt(1, pageNumber * 10);
	resultSet = preparedStatement2.executeQuery();
	if(resultSet.next()){
		nextPage  = true;
	}else{
		nextPage = false;
	}

	
	request.setCharacterEncoding("utf-8");
	String SID = (String)session.getAttribute("login");
	
	
	
	
	                                           // date_format(POSTINGDATE,'%Y-%m-%d') as POSTINGDATE  으로 간단하게 뽑을 수도있다.
	preparedStatement = connection.prepareStatement("SELECT POST_NO, TITLE, SID,  POSTINGDATE, CONTENT, AVAILABLE " + 
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
		a,a:hover{
			color : #000000;
			text-decoration : none;'
		}
	</style>
	
	<title>게시판메인페이지</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../included/top.jsp">
	<jsp:param value="board" name="type"/>
</jsp:include>

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
					<td><a href="../from/fromPostPage.jsp?postNo=<%=postList.get(i).getPostNo() %>"><%= postList.get(i).getTitle() %></a></td>
					<td><%= writer%></td>
					<td><%= postList.get(i).getPostingdate().substring(0,11) + postList.get(i).getPostingdate().substring(11,13) +"시" + postList.get(i).getPostingdate().substring(14,16) +"분" %></td>
					</tr>
					<%
						}
					
						connectDB.release();
					%>
				
			</tbody>
		</table>
		</div>
		<%
			if(pageNumber != 1){
		%>
				<a href="../from/fromOtherPage.jsp?pageNumber=<%=pageNumber  - 1%>"  class="btn btn-secondary" style="margin-left: 20px">◀</a>
		<%
			}if(nextPage){
		%>
				<a href="../from/fromOtherPage.jsp?pageNumber=<%=pageNumber  + 1%>"  class="btn btn-secondary" style="margin-left: 20px">▶</a>
		<%
			}
		%>
		<div style="float : right">
			<a href="<%=request.getContextPath() %>/from/fromPostingPage.jsp" class="btn btn-primary pull-right"  >글쓰기</a>
		</div>
		
</div>

</body>
</html>