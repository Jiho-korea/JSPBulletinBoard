<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jspBulletinBoard.vo.Student"%>
<%@page import="jspBulletinBoard.vo.Post" %>
<%@page import="jspBulletinBoard.dao.PostDAO"%>
<jsp:useBean id="student" class="jspBulletinBoard.vo.Student" scope="session"/>
<%
	Post post = (Post)request.getAttribute("post");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판작성페이지</title>
</head>
<body>
<jsp:include page="included/top.jsp">
	<jsp:param value="board" name="type"/>
</jsp:include>
<br>
	<form method="post" action="../from/update?postNo=<%= post.getPostNo()%>">
		<table align="center" style="text-align: center; border: 1px solid  #dddddd" width="50%">
			<thead>
				<tr>
					<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시글 수정</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" placeholder="글 제목" name="title" maxlength="30"  style="width:100%" value="<%=post.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>").replaceAll("\"","&quot;") %>"  required  autofocus></td>
				</tr>
				<tr>
					<td><textarea placeholder="글 내용" name="content" maxlength="2048" style="width:100%;height: 350px;"  required><%=post.getContent() %></textarea></td>
				</tr>
				<tr>
					<td>
						<input type="submit"  value="글수정"/>
					</td>
				</tr>
			</tbody>
		</table>
		
	</form>
</body>
</html>