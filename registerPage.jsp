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
		width: 40%;
		margin-top:50px;
	
	}
</style>
<title>회원가입 페이지</title>
</head>
<body class="text-center" >
	<div class="container"   id="main">
	<div class="jumbotron">
	     <h4 class="mb-4">회원가입</h4>
	      <form class="form-signup"  novalidate="">
	            <input type="text" class="form-control" id="userName" placeholder="이름" value="" required="">
	            <div class="invalid-feedback">
 	             Valid last name is required.
 	          	</div>
				<br class="mb-4">
			
				
				<input type="text" class="form-control" id="SID" placeholder="학번" value="" required="">
	            <div class="invalid-feedback">
 	             Valid last name is required.
 	          	</div>
        
        		<br class="mb-4">
	
 	          	<div class="row">
          			<div class="col-md-6 mb-3">
       
            			<input type="text" class="form-control" id="userPassword" placeholder="비밀번호" value="" required="">
						<div class="invalid-feedback">Valid last name is required.</div>
					</div>
          			<div class="col-md-6 mb-3">
            			<input type="text" class="form-control" id="checkPassword" placeholder="비밀번호 확인" value="" required="">
            			<div class="invalid-feedback">
              			Valid last name is required.
            			</div>
          			</div>
        		</div>
 	    
  				<br class="mb-1">
				<input type="text" class="form-control" id="userName" placeholder="학년" value="" required="">
	            <div class="invalid-feedback">
 	             Valid last name is required.
 	          	</div>
 	          	
 	          	<br class="mb-4">
 	          
				<input type="text" class="form-control" id="userName" placeholder="학과" value="" required="">
	            <div class="invalid-feedback">
 	             Valid last name is required.
 	          	</div>
 	          	
 	          	<br class="mb-4">
 	          
        	<hr class="mb-4">
        	<button class="btn btn-primary btn-lg btn-block" type="submit">회원가입</button>
     	 	</form>
   		</div>
    
    </div>
</body>
</html>