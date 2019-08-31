<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String bool = request.getParameter("memory");    
	String SID = request.getParameter("SID");    
	String userPassword = request.getParameter("userPassword");    
	if(userPassword.equals("password")){
		session.setAttribute("login", SID);
		if(bool != null&&(bool.equals("memory"))){
				session.setAttribute("login1", SID);
		}else{
				session.removeAttribute("login1");
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지로 이동</title>
</head>
<body>
	<jsp:forward page="/WEB-INF/mainPage.jsp"/>
	<%
	}else{ %>
		<script>
			alert("로그인 실패! ID, password 를 확인 해주세요.");
			history.go(-1);
		</script>
	<%
	}
	%>
</body>
</html>