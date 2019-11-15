<%@page import="jspBulletinBoard.dao.StudentDAO"%>
<%@page import="jspBulletinBoard.dao.PostDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="jspBulletinBoard.vo.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jspBulletinBoard.vo.Student"%>
<%
	Post post = (Post)request.getAttribute("post");
	String SID = (String)session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 페이지</title>
</head>
<body>
<jsp:include page="included/top.jsp">
	<jsp:param value="board" name="type"/>
</jsp:include>

<div class="container" style="margin-top:60px;">
	<div class="row" >
		<table class="table table-striped" style="text-align: center; border: 1px solid  #dddddd; word-wrap:break-word; word-break:break-all;">
			<thead>
				<tr>
					<th colspan="3" style="background-color: #dddddd; text-align: center">
						<%= post.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %> 
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 20%">
						작성자
					</td>
					<td colspan="2">
						<%= StudentDAO.getWriter(post.getSid()).getName()%>
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
			<a href="../from/board" class="btn btn-primary"  >목록</a>
		
		<%if(SID.equals(post.getSid()+"")){ %>
			<a href="../from/updatepage?postNo=<%=post.getPostNo() %>" class="btn btn-primary"  >수정</a>
			<a href="../from/delete?postNo=<%=post.getPostNo() %>" class="btn btn-primary"  onclick="return confirm('정말로 삭제하시겠습니까?')">삭제</a>
		<%}%>
		</div>
</div>
</body>
</html>