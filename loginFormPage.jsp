<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"  session="true"%>

<%
	String id = (String)session.getAttribute("login1");
%>
		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width , initial-scale=1">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" >
<link href="signin.css" rel="stylesheet">
<style>
	#main{
		width: 30%;
		margin-top:50px;
	
	}
</style>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<title>JSP 게시판</title>
</head>
<body class="text-center" >
	<div class="container"   id="main">
		<div class="jumbotron">
			<form action="${pageContext.request.contextPath}/login" class="form-signin" method="post" >
  				<h1 class="h3 mb-3 font-weight-bold">Bulletin Board</h1>
  			<%if(id == null){ %>
  				<input type="number" name="sid" class="form-control" placeholder="학번"  required autofocus="" style="margin-top:50px">
  			<%}else{ %>
  				<input type="number" name="sid" class="form-control" placeholder="학번"   value="<%= id %>"   required autofocus="" style="margin-top:50px">
  			<%} %>
  				<input type="password" name="password" class="form-control" placeholder="비밀번호"  required >
  				<div class="checkbox mb-3">
     				 <input type="checkbox" name="memory" value="memory"> 아이디 기억하기
  				</div>
  				<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
  				<a href="${pageContext.request.contextPath}/registerPage.jsp"  >회원가입</a>
  				<p class="mt-5 mb-3 text-muted" >© 21660003 강지호</p>
			</form>
		</div>
	</div>
		
</body>
</html>