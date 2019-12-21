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
<title>JSP 게시판</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/login"  method="post" >
		<table border="1" align="center" width="30%">
				<tr>
					<td colspan="2" align="center">
						<h1>게시판</h1>
					</td>
				</tr>
				<tr>
					<td align="center">
						학번
					</td>
					<td align="center">
						<%if(id == null){ %>
  							<input type="number" name="sid"  placeholder="학번"  required autofocus>
  						<%}else{ %>
  							<input type="number" name="sid"  placeholder="학번"   value="<%= id %>"   required autofocus >
  						<%} %>
					</td>
				</tr>
				<tr>
					<td align="center">
						비밀번호
					</td>
					<td align="center">
						<input type="password" name="password"  placeholder="비밀번호"  required >
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
     					 <input type="checkbox" name="memory" value="memory"> <b>아이디저장</b>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
     					 <input type="submit" value="로그인"/>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
     					<a href="${pageContext.request.contextPath}/registerPage.jsp" ><input type="button" value="회원가입"/></a>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<p>© 21660003 강지호</p>
					</td>
				</tr>		
		</table>
	</form>
</body>
</html>