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
<link href="css/bootstrap.min.css" rel="stylesheet" >
<link href="signin.css" rel="stylesheet">
<style>
	#main{
		width: 30%;
		margin-top:50px;
	
	}
</style>
<title>JSP 게시판</title>
</head>
<body class="text-center" >
	<div class="container"   id="main">
		<div class="jumbotron">
			<form action="<%= request.getContextPath() %>/action/loginAction.jsp" class="form-signin" method="post" >
  				<h1 class="h3 mb-3 font-weight-bold">게시판</h1>
  			<%if(id == null){ %>
  				<input type="number" name="SID" class="form-control" placeholder="학번"  required oninvalid="this.setCustomValidity('아이디를 입력해주세요')"  autofocus="" style="margin-top:50px">
  			<%}else{ %>
  				<input type="number" name="SID" class="form-control" placeholder="학번"   value="<%= id %>"   required oninvalid="this.setCustomValidity('아이디를 입력해주세요')"  autofocus="" style="margin-top:50px">
  			<%} %>
  				<input type="password" name="userPassword" class="form-control" placeholder="비밀번호"  required oninvalid="this.setCustomValidity('비밀번호를 입력해주세요')" >
  				<div class="checkbox mb-3">
     				 <input type="checkbox" name="memory" value="memory"> 아이디 기억하기
  				</div>
  				<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
  				<a href="<%= request.getContextPath() %>/registerPage.jsp"  >회원가입</a>
  				<p class="mt-5 mb-3 text-muted" >© 21660003 강지호</p>
			</form>
		</div>
	</div>
	
		
		<script src="https://code.jquery.com/jquery-3.1.1.min.js">
		</script>
		<script src="js/bootstrap.js">
		</script>
</body>
</html>