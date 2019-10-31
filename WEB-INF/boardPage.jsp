<%@page import="jspBulletinBoard.PostDAO"%>
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
<%@ include file="included/getWriter.jspf" %>
<jsp:useBean id="student" class="jspBulletinBoard.Student" scope="session"/>
<%		
	int pageNumber = 1;
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	boolean nextPage = false;
	
	PostDAO postDAO =new PostDAO();
	nextPage = postDAO.nextPage(pageNumber);

	
	request.setCharacterEncoding("utf-8");
	String SID = (String)session.getAttribute("login");
	
	ArrayList<Post> postList = postDAO.postList(pageNumber);

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
<jsp:include page="included/top.jsp">
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
					<td><a href="../from/fromPostPage.jsp?postNo=<%=postList.get(i).getPostNo() %>"><%= postList.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
					<td><%= writer%></td>
					<td><%= postList.get(i).getPostingdate().substring(0,11) + postList.get(i).getPostingdate().substring(11,13) +"시" + postList.get(i).getPostingdate().substring(14,16) +"분" %></td>
					</tr>
					<%
						}
					
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