<%@page import="jspBulletinBoard.dao.StudentDAO"%>
<%@page import="jspBulletinBoard.dao.PostDAO"%>
<%@page import="jspBulletinBoard.vo.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jspBulletinBoard.vo.Student"%>
<jsp:useBean id="student" class="jspBulletinBoard.vo.Student" scope="session"/>
<%		
	ArrayList<Post> postList = (ArrayList<Post>)request.getAttribute("postList");
	int pageNumber = (Integer)request.getAttribute("pageNumber");
	boolean nextPage = (Boolean)request.getAttribute("nextPage");
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
					<%for(int i = 0; i<postList.size(); i++){%>
					<tr>
					<td><%= postList.get(i).getPostNo() %></td>
					<td><a href="../from/post?postNo=<%=postList.get(i).getPostNo() %>"><%= postList.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
					<td><%= StudentDAO.getWriter(postList.get(i).getSid()).getName()%></td>
					<td><%= postList.get(i).getPostingdate().substring(0,11) + postList.get(i).getPostingdate().substring(11,13) +"시" + postList.get(i).getPostingdate().substring(14,16) +"분" %></td>
					</tr>
					<%}%>
			</tbody>
		</table>
		</div>
		<%
			if(pageNumber != 1){%>
				<a href="${pageContext.request.contextPath}/from/board?pageNumber=<%=pageNumber  - 1%>"  class="btn btn-secondary" style="margin-left: 20px">◀</a>
		<%}if(nextPage){%>
				<a href="${pageContext.request.contextPath}/from/board?pageNumber=<%=pageNumber  + 1%>"  class="btn btn-secondary" style="margin-left: 20px">▶</a>
		<%}%>
		<div style="float : right">
			<a href="${pageContext.request.contextPath}/from/postingpage" class="btn btn-primary pull-right"  >글쓰기</a>
		</div>
		
</div>

</body>
</html>