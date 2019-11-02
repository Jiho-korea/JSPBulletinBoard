<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jspBulletinBoard.Student"%>
<%@ page import="jspBulletinBoard.ConnectDB" %>
<jsp:useBean id="student" class="jspBulletinBoard.Student" scope="session"/>
<%
	request.setCharacterEncoding("utf-8");
	String SID = (String)session.getAttribute("login");
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
		<form method="post" action="<%= request.getContextPath() %>/action/writeAction.jsp">
			<table class="table table-striped" style="text-align: center; border: 1px solid  #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="30" required  autofocus></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="content" maxlength="2048" style="height: 350px;" required></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit"  class="btn btn-primary pull-right"   style="margin-left:91%" value="글쓰기"/>
		</form>
		
	</div>
</div>
</body>
</html>