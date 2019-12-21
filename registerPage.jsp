<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<title>회원가입 페이지</title>
</head>
<body>
	  <h4 align="center" >회원가입</h4>
	 <form method ="post"  action="${pageContext.request.contextPath}/register"  onsubmit="return clickEvent()">
	 		<table border="1" align="center" width="30%">
	 				<tr>
	 					<td colspan="2">
	 						  <input type="text"  name="name" placeholder="이름"  id="name"  required/>
						</td>
	 				</tr>
	 					
	 				<tr>
	 					<td colspan="2">
	 						<input type="number"  name="sid" placeholder="학번"  id="sid"  required/>
	 					</td>
	 				</tr>
	 				
	 				<tr>
	 					<td>
	 						<input type="password"  name="password"  id="userPassword" placeholder="비밀번호"  required/>
	 					</td>
	 					<td>
	 						<input type="password" id="checkPassword" placeholder="비밀번호 확인"   required/>
	 					</td>
	 				</tr>
	 				
	 				<tr>
	 					<td colspan="2">
	 						<input type="number"  name="grade"  id="grade" placeholder="학년"   required/>
	 					</td>
	 				</tr>
	 				
	 				<tr>
	 					<td colspan="2">
	 						<input type="text"  name="subject"  id="subject" placeholder="학과"   required/>
	 					</td>
	 				</tr>
	          		
	          		<tr>
	 					<td colspan="2" align="center" >
	 						<input type="submit" value="회원가입"/>
	 					</td>
	 				</tr> 	         	
 	        </table>
     </form>
</body>
<script type="text/javascript">
	
	
	$("#btn_register").click(function clickEvent(){
		var userPassword = $("#userPassword").val();
		var checkPassword = $("#checkPassword").val();
		if(userPassword != checkPassword){
			alert("비밀번호를 다시 확인해주세요.");
			return false;
		}else if($("#name").val() == ""){
			alert("이름을 입력해주세요.");
			return false;
		}else if($("#sid").val() == ""){
			alert("학번을 입력해주세요.");
			return false;
		}else if($("#userPassword").val() == ""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}else if($("#grade").val() == ""){
			alert("학년을 입력해주세요.");
			return false;
		}else if($("#subject").val() == ""){
			alert("학과를 입력해주세요.");
			return false;
		}
	});
</script>
</html>