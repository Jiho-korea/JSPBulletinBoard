<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="jspBulletinBoard.vo.Student"%>
<jsp:useBean id="student" class="jspBulletinBoard.vo.Student"
	scope="session" />

<%
	int SID = (Integer)session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#main {
	width: 40%;
	margin-top: 50px;
}

a, a:hover {
	color: #000000;
	text-decoration: none;
	'
}
</style>
<title>메인페이지</title>

</head>
<body>
	<jsp:include page="included/top.jsp">
		<jsp:param value="main" name="type" />
	</jsp:include>

	<div class="container" style="margin-top: 60px">
		<div class="jumbotron">
			<div class="container">
				<h1>웹 사이트 소개</h1>
				<p>JSP, Servlet, MyBatis를 활용하여 만든 게시판 입니다.</p>
				<p>
					<a class="btn btn-primary btn-pull" href="#">Github</a>
				<p>
			</div>
		</div>
	</div>



	<%-- 
	<div class="container">
		<div id="carouselExampleSlidesOnly" class="carousel slide"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="${pageContext.request.contextPath}/images/1.jpg"
						class="d-block w-100" alt="...">
					<div class="carousel-caption">
						<h5>First slide label</h5>
						<p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/images/2.jpg"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/images/3.jpg"
						class="d-block w-100" alt="...">
				</div>
			</div>
		</div>
	</div>
--%>


</body>
</html>