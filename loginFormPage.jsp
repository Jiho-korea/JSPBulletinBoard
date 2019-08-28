<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width , initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet" >
<link href="signin.css" rel="stylesheet">
<style>
	#main{
		width: 500px;
		margin-top:20px;
	
	}
</style>
<title>JSP 게시판</title>
</head>
<body class="text-center" >

	<div class="container"  id="main">
		<form class="form-signin">
  			<h1 class="h3 mb-3 font-weight-bold">게시판</h1>
  			<input type="text" name="userID" class="form-control" placeholder="학번" required="" autofocus="" style="margin-top:50px">
  			<input type="password" name="userPassword" class="form-control" placeholder="비밀번호" required="">
  			<div class="checkbox mb-3">
     			 <input type="checkbox" name="memory" value="remember-me"> 아이디 기억하기
  			</div>
  			<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
  			<p>회원가입</p>
  			<p class="mt-5 mb-3 text-muted">© 21660003 강지호</p>
		</form>
	</div>
		
		<script src="https://code.jquery.com/jquery-3.1.1.min.js">
		</script>
		<script src="js/bootstrap.js">
		</script>
</body>
</html>