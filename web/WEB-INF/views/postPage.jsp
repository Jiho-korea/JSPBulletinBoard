<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="jspBulletinBoard.vo.Comment"%>
<%@page import="java.util.List"%>
<%@page import="jspBulletinBoard.dao.StudentDAO"%>
<%@page import="jspBulletinBoard.dao.PostDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="jspBulletinBoard.vo.Post"%>

<%@page import="jspBulletinBoard.vo.Student"%>
<%
	Post post = (Post) request.getAttribute("post");
	Student student = (Student) session.getAttribute("student");
	List<Comment> comments = post.getComments();

	Comment updateComment = (Comment) request.getAttribute("comment");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width , initial-scale=1">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<title>게시글 페이지</title>
</head>
<body>
	<c:import url="included/top.jsp">
		<c:param value="board" name="type" />
	</c:import>

	<div class="container" style="margin-top: 60px">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd; word-wrap: break-word; word-break: break-all;">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #dddddd; text-align: center"><%=post.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
					.replaceAll("\n", "<br>")%></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%">작성자</td>
						<td colspan="2"><%=StudentDAO.getWriter(post.getSid()).getName()%></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%=post.getPostingdate().substring(0, 11) + post.getPostingdate().substring(11, 13) + "시"
					+ post.getPostingdate().substring(14, 16) + "분"%></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="height: 200px; text-align: left">
							<div>
								<%=post.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
					.replaceAll("\n", "<br>")%>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div style="float: right">


			<%
				if (student.getSid() == post.getSid()) {
			%>
			<a href="../from/updatepage?postNo=<%=post.getPostNo()%>"
				class="btn btn-primary">수정</a> <a
				href="../from/delete?postNo=<%=post.getPostNo()%>"
				class="btn btn-primary" onclick="return confirm('정말로 삭제하시겠습니까?')">삭제</a>

			<%
				}
			%>
			<a href="../from/board" class="btn btn-primary">목록</a>
		</div>

		<br> <br>
		<form
			action="${pageContext.request.contextPath}/from/comment?postNo=<%=post.getPostNo() %>"
			method="post">



			<div class="form-group">
				<div class="input-group mb-3">
					<textarea rows="3" cols="90" class="form-control" rows="3"
						name="commentContent" aria-describedby="button-addon2"></textarea>
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="submit"
							id="button-addon2">댓글작성</button>
					</div>
				</div>
			</div>


		</form>
	</div>




	<%
		if (!comments.isEmpty()) {
	%>
	<div class="container" style="margin-top: 60px">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<%
					for (int i = 0; i < comments.size(); i++) {
							Comment comment = comments.get(i);
				%>
				<tr>
					<!--<td width="5%"><%=comment.getCommentNo()%></td>  -->
					<td width="30%"><%=StudentDAO.getWriter(comment.getSid()).getName()%>
					</td>
					<td width="70%">
						<%
							if (updateComment != null && updateComment.getCommentNo() == comment.getCommentNo()) {
						%> <%-- 이곳 수정해야함 --%>

						<div class="form-group">
							<div class="input-group">
								<form
									action="${pageContext.request.contextPath}/from/updatecomment?postNo=<%=post.getPostNo() %>&commentNo=<%=comment.getCommentNo()%>"
									method="post">

		

									<textarea rows="3" cols="100" class="form-control"
										name="commentContent" aria-describedby="button-addon4"><%=comment.getCommentContent()%></textarea>


									<div class="input-group-append" style="float: right" id="button-addon4">
										<button class="btn btn-outline-secondary" type="submit">수정</button>
										<a
											href="${pageContext.request.contextPath}/from/post?postNo=<%=post.getPostNo() %>">
											<button class="btn btn-outline-secondary" type="button">취소</button>
										</a>
									</div>
								
								</form>


							</div>

						</div> <%-- --%> <%
 	} else {
 %> <%=comment.getCommentContent()%> <%
 	if (student.getSid() == comment.getSid()) {
 %> <a
						href="${pageContext.request.contextPath}/from/post?postNo=<%=post.getPostNo() %>&commentNo=<%=comment.getCommentNo()%>"><input
							type="button" class="btn btn-secondary btn-sm" value="수정" /></a> <a
						href="${pageContext.request.contextPath}/from/deletecomment?commentNo=<%=comment.getCommentNo()%>&postNo=<%=post.getPostNo() %>"><input
							type="button" class="btn btn-secondary btn-sm" value="삭제" /></a> <%
 	}
 %> <%
 	}
 %>
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>
	<%
		}
	%>


</body>
</html>