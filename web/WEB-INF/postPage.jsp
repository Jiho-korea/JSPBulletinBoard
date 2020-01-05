<%@page import="jspBulletinBoard.vo.Comment"%>
<%@page import="java.util.List"%>
<%@page import="jspBulletinBoard.dao.StudentDAO"%>
<%@page import="jspBulletinBoard.dao.PostDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="jspBulletinBoard.vo.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jspBulletinBoard.vo.Student"%>
<%
	Post post = (Post)request.getAttribute("post");
	Student student = (Student)session.getAttribute("student");
	List<Comment> comments = post.getComments();
	
	Comment updateComment = (Comment)request.getAttribute("comment");
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
<br>
	<table align="center" border="1" width="50%"  style="text-align: center; border: 1px solid  #dddddd; word-wrap:break-word; word-break:break-all;">
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
	<br>
	<div align="center">
		<a href="../from/board"  ><input type="button" value="목록"/></a>
		
		<%if(student.getSid() == post.getSid()){ %>
			<a href="../from/updatepage?postNo=<%=post.getPostNo() %>"  ><input type="button" value="수정"/></a>
			<a href="../from/delete?postNo=<%=post.getPostNo() %>"  onclick="return confirm('정말로 삭제하시겠습니까?')"><input type="button" value="삭제"/></a>
		<%}%>
		
	</div>
<br><br>
<form action="${pageContext.request.contextPath}/from/comment?postNo=<%=post.getPostNo() %>"  method="post">
	<table border="1" align="center" width="50%">
		<tr>
			<td width="90%">
				<textarea rows="5" cols="90" name="commentContent"></textarea>
			</td>
			<td width="10%">
				<input type="submit" value="댓글작성"/>
			</td>
		</tr>
	</table>
</form>
<%if(!comments.isEmpty()){ %>
	<table border="1" align="center" width="50%">
	<%for(int i = 0; i < comments.size(); i++){ 
		Comment comment = comments.get(i);
	%>
		<tr>
			<td width="5%">
				<%= comment.getCommentNo()%>
			</td>
			<td width="15%">
				<%= StudentDAO.getWriter(comment.getSid()).getName()%>
			</td>
			<td width="80%">
				<%if(updateComment != null && updateComment.getCommentNo() == comment.getCommentNo()){ %>
					<form action="${pageContext.request.contextPath}/from/updatecomment?postNo=<%=post.getPostNo() %>&commentNo=<%=comment.getCommentNo()%>"  method="post">
						<textarea rows="5" cols="80" name="commentContent"><%= comment.getCommentContent()%></textarea>
						<input type="submit" value="수정"/>
						<a href="${pageContext.request.contextPath}/from/post?postNo=<%=post.getPostNo() %>"><input type="button" value="취소"/></a>
					</form>
				<%}else{ %>
					<%= comment.getCommentContent()%>
					<%if(student.getSid() == comment.getSid()){ %>
						<a href="${pageContext.request.contextPath}/from/post?postNo=<%=post.getPostNo() %>&commentNo=<%=comment.getCommentNo()%>"><input type="button" value="수정" /></a>
						<a href="${pageContext.request.contextPath}/from/deletecomment?commentNo=<%=comment.getCommentNo()%>&postNo=<%=post.getPostNo() %>"><input type="button" value="삭제" /></a>
					<%} %>
				<%} %>
			</td>
		</tr>
		<%} %>
	</table>
<%}%>


</body>
</html>