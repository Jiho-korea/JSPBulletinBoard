<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width , initial-scale=1">
	<link href="css/bootstrap.min.css" rel="stylesheet" >
	<style>
		#main{
			width: 40%;
			margin-top:50px;
	
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<title>회원가입 페이지</title>
</head>
<body class="text-center" >
	<div class="container"   id="main">
	<div class="jumbotron">
	     <h4 class="mb-4">회원가입</h4>
	      <form class="form-signin"  method ="post"  action="<%= request.getContextPath() %>/from/registerAction.jsp"  onsubmit="return clickEvent()">
	            <input type="text" class="form-control"  name="userName" placeholder="이름"  required oninvalid="this.setCustomValidity('이름을 입력해 주세요.')">
	       
				<br class="mb-4">
			
				
				<input type="number" class="form-control" name="SID" placeholder="학번"   required oninvalid="this.setCustomValidity('학번을 입력해 주세요.')">
        
        		<br class="mb-4">
	
 	          	<div class="row">
          			<div class="col-md-6 mb-3">
       
            			<input type="password" class="form-control"  name="userPassword"  id="userPassword" placeholder="비밀번호"  required oninvalid="this.setCustomValidity('비밀번호를 입력해 주세요.')">
					</div>
          			<div class="col-md-6 mb-3">
            			<input type="password" class="form-control" id="checkPassword" placeholder="비밀번호 확인"   required oninvalid="this.setCustomValidity('비밀번호를 한번 더 입력해 주세요.')">
            		
          			</div>
        		</div>
 	    
  				<br class="mb-1">
				<input type="number" class="form-control" name="grade" placeholder="학년"   required oninvalid="this.setCustomValidity('학년을 입력해 주세요.')">
	     
 	          	
 	          	<br class="mb-4">
 	          	
				<input type="text" class="form-control" name="subject" placeholder="학과"   required oninvalid="this.setCustomValidity('학과를 입력해 주세요.')">
 	          	
 	          	<br class="mb-4">
 	          
        	<hr class="mb-4">
        	<button id="btn_register" class="btn btn-primary btn-lg btn-block" type="submit">회원가입</button>
     	 	</form>
   		</div>
    
    </div>
</body>
<script type="text/javascript">
	
	
	$("#btn_register").click(function clickEvent(){
		var userPassword = $("#userPassword").val();
		var checkPassword = $("#checkPassword").val();
		if(userPassword != checkPassword){
			alert("비밀번호를 다시 확인해주세요.");
			return false;
		}else{
			return true;
		}
	});
</script>
</html>