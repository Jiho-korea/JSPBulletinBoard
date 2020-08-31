<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width , initial-scale=1">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<style>
#main {
	width: 40%;
	margin-top: 50px;
}
</style>
<script src="https://code.jquery.com/jquery-3.1.1.min.js" charset="utf-8"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>
<title>회원가입 페이지</title>
</head>
<body class="text-center">
	<div class="container" id="main">
		<div class="jumbotron">
			<h4 class="mb-4">회원가입</h4>
			<form class="form-signin" method="post"
				action="${pageContext.request.contextPath}/register"
				onsubmit="return clickEvent()">
				<input type="text" class="form-control" name="name" placeholder="이름"
					id="name" required /> <br class="mb-4"> <input type="number"
					class="form-control" name="sid" placeholder="학번" id="sid" required />

				<br class="mb-4">

				<div class="row">
					<div class="col-md-6 mb-3">

						<input type="password" class="form-control" name="password"
							id="userPassword" placeholder="비밀번호" required />
					</div>
					<div class="col-md-6 mb-3">
						<input type="password" class="form-control" id="checkPassword"
							placeholder="비밀번호 확인" required />

					</div>
				</div>

				<br class="mb-1"> <input type="number" class="form-control"
					name="grade" id="grade" placeholder="학년" required /> <br
					class="mb-4"> <input type="text" class="form-control"
					name="subject" id="subject" placeholder="학과" required /> <br
					class="mb-4">

				<hr class="mb-4">
				<button id="btn_register" class="btn btn-primary btn-lg btn-block"
					type="submit">회원가입</button>
			</form>
		</div>

	</div>


	<%--  ////////////////////////////////////////////////           
	<h4 align="center">회원가입</h4>
	<form method="post"
		action="${pageContext.request.contextPath}/register"
		onsubmit="return clickEvent()">
		<table border="1" align="center" width="30%">
			<tr>
				<td colspan="2"><input type="text" name="name" placeholder="이름"
					id="name" required /></td>
			</tr>

			<tr>
				<td colspan="2"><input type="number" name="sid"
					placeholder="학번" id="sid" required /></td>
			</tr>

			<tr>
				<td><input type="password" name="password" id="userPassword"
					placeholder="비밀번호" required /></td>
				<td><input type="password" id="checkPassword"
					placeholder="비밀번호 확인" required /></td>
			</tr>

			<tr>
				<td colspan="2"><input type="number" name="grade" id="grade"
					placeholder="학년" required /></td>
			</tr>

			<tr>
				<td colspan="2"><input type="text" name="subject" id="subject"
					placeholder="학과" required /></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="회원가입" /></td>
			</tr>
		</table>
	</form>
	 --%>
</body>
<script type="text/javascript" charset="utf-8">
	$("#btn_register").click(function clickEvent() {
		var userPassword = $("#userPassword").val();
		var checkPassword = $("#checkPassword").val();
		if (userPassword != checkPassword) {
			alert("비밀번호를 다시 확인해주세요.");
			return false;
		} else if ($("#name").val() == "") {
			alert("이름을 입력해주세요.");
			return false;
		} else if ($("#sid").val() == "") {
			alert("학번을 입력해주세요.");
			return false;
		} else if ($("#userPassword").val() == "") {
			alert("비밀번호를 입력해주세요.");
			return false;
		} else if ($("#grade").val() == "") {
			alert("학년을 입력해주세요.");
			return false;
		} else if ($("#subject").val() == "") {
			alert("학과를 입력해주세요.");
			return false;
		}
	});
</script>
</html>