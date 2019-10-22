<%@page import="jspBulletinBoard.Post"%>
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
<%
	String postNo = request.getParameter("postNo");

	Connection connection = null;
	PreparedStatement preparedStatement = null; 
	ResultSet resultSet = null;
	
	
	ConnectDB connectDB = new ConnectDB();
	connection = connectDB.connect();     
	
	
	request.setCharacterEncoding("utf-8");
	String SID = (String)session.getAttribute("login");
	
	
	
	
	                                           // date_format(POSTINGDATE,'%Y-%m-%d') as POSTINGDATE  으로 간단하게 뽑을 수도있다.
	preparedStatement = connection.prepareStatement("SELECT POST_NO,TITLE, SID, POSTINGDATE, CONTENT, AVAILABLE " + 
													"FROM post WHERE AVAILABLE = 1 AND POST_NO = ?");
	preparedStatement.setInt(1, Integer.parseInt(postNo));
	
	resultSet = preparedStatement.executeQuery();
	Post post = new Post();
	while(resultSet.next()){
		//POST_NO,TITLE,SID,POSTINGDATE,CONTENT,AVAILABLE
		
		post.setPostNo(resultSet.getInt("POST_NO"));
		post.setTitle(resultSet.getString("TITLE"));
		post.setSid(resultSet.getInt("SID"));
		post.setPostingdate(resultSet.getString("POSTINGDATE"));
		post.setContent(resultSet.getString("CONTENT"));
		post.setAvailable(resultSet.getInt("AVAILABLE"));
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../included/top.jsp">
	<jsp:param value="board" name="type"/>
</jsp:include>

<div class="container" style="margin-top:60px;">
	<div class="row" >
		<table class="table table-striped" style="text-align: center; border: 1px solid  #dddddd; word-wrap:break-word; word-break:break-all;">
			<thead>
				<tr>
					<th colspan="3" style="background-color: #dddddd; text-align: center">
						<%= post.getTitle() %> 
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 20%">
						작성자
					</td>
					<td colspan="2">
						<%= getWriter(post.getSid())%>
					</td>
				</tr>
				<tr>
					<td>
						작성일자
					</td>
					<td colspan="2">
						<%= post.getPostingdate().substring(0,11) + post.getPostingdate().substring(11,13) +"시" + post.getPostingdate().substring(14,16) +"분"%>
					</td>
				</tr>
				<tr>
					<td>
						내용
					</td>
					<td colspan="2" style="height:200px ;text-align: left;">
						<div>
							<%= post.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%>
						</div>
					</td>
				</tr>
				
			
				
				
			</tbody>
		</table>
		</div>
		<div style="float : left">
			<a href="../from/fromBoardPage.jsp" class="btn btn-primary"  >목록</a>
		
		<%if(SID.equals(post.getSid()+"")){ %>
			<a href="../from/fromUpdatePost.jsp" class="btn btn-primary"  >수정</a>
			<a href="../from/fromDeletePost.jsp" class="btn btn-primary"  >삭제</a>
			
		<%}%>
		</div>
</div>
</body>
</html>