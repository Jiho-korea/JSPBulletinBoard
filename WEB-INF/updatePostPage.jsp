<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jspBulletinBoard.vo.Student"%>
<%@page import="jspBulletinBoard.vo.Post" %>
<%@page import="jspBulletinBoard.dao.PostDAO"%>
<jsp:useBean id="student" class="jspBulletinBoard.vo.Student" scope="session"/>
<%
	request.setCharacterEncoding("utf-8");
	String sid = (String)session.getAttribute("login");
	
	int postNo = 0;
	if(request.getParameter("postNo") != null){
		postNo = Integer.parseInt(request.getParameter("postNo"));
	}
	
	Post postParam = new Post();
	postParam.setPostNo(postNo);
	
	PostDAO postDAO = new PostDAO();
	Post post = new Post();
	
	if(postNo == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert(\"유효하지 않은 글입니다..\");");
		script.println("location.href = '../from/fromBoardPage.jsp'");
		script.println("</script>");
	}else {
		
		post = postDAO.getPostInfo(postParam);
		
		if(!sid.equals(post.getSid()+"")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"권한이 없습니다.\");");
			script.println("location.href = '../from/fromBoardPage.jsp'");
			script.println("</script>");
		}
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
	
	<title>게시판작성페이지</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="included/top.jsp">
	<jsp:param value="board" name="type"/>
</jsp:include>

<div class="container" style="margin-top:60px">
	<div class="row-col" >
		<form method="post" action="../action/updateAction.jsp?postNo=<%= postNo%>">
			<table class="table table-striped" style="text-align: center; border: 1px solid  #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시글 수정</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="30"  value="<%=post.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>").replaceAll("\"","&quot;") %>"  required  autofocus></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="content" maxlength="2048" style="height: 350px;"  required><%=post.getContent() %></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit"  class="btn btn-primary pull-right"   style="margin-left:91%" value="글수정"/>
		</form>
		
	</div>
</div>
</body>
</html>