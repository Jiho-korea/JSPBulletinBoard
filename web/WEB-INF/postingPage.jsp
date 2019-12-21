<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jspBulletinBoard.vo.Student"%>
<jsp:useBean id="student" class="jspBulletinBoard.vo.Student" scope="session"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판작성페이지</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="included/top.jsp">
	<jsp:param value="board" name="type"/>
</jsp:include>
<br>
	<form method="post" action="${pageContext.request.contextPath}/from/posting">
		<table style="text-align: center; border: 1px solid  #dddddd" align="center" width="50%">
			<thead>
				<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text"  placeholder="글 제목" name="title" maxlength="30" style="width: 100%" required  autofocus></td>
				</tr>
				<tr>
					<td><textarea placeholder="글 내용" name="content" maxlength="2048" style="width: 100% ;height: 350px;" required></textarea></td>
				</tr>
			</tbody>
		</table>
		<div align="center">
			<input type="submit"   value="글쓰기"/>
		</div>
	</form>
</body>
</html>