<%@page import="jspBulletinBoard.dao.StudentDAO"%>
<%@page import="jspBulletinBoard.dao.PostDAO"%>
<%@page import="jspBulletinBoard.vo.Post"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="jspBulletinBoard.vo.Student"%>
<jsp:useBean id="student" class="jspBulletinBoard.vo.Student"
	scope="session" />
<%
	List<Object> postList = (List<Object>) request.getAttribute("postList"); // 서블릿에서 request영역에 저장해둔 게시글리스트,페이지번호,다음페이지번호를 얻어옴
	int pageNumber = (Integer) request.getAttribute("pageNumber");
	boolean nextPage = (Boolean) request.getAttribute("nextPage");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width , initial-scale=1">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
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
<title>게시판메인페이지</title>
</head>

<body>
	<jsp:include page="included/top.jsp">
		<jsp:param value="board" name="type" />
	</jsp:include>



	<div class="container" style="margin-top: 60px">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th
							style="background-color: #eeeeee; text-align: center; width: 15%">글번호</th>
						<th
							style="background-color: #eeeeee; text-align: center; width: 55%">제목</th>
						<th
							style="background-color: #eeeeee; text-align: center; width: 10%">작성자</th>
						<th
							style="background-color: #eeeeee; text-align: center; width: 20%">작성일</th>
					</tr>
				</thead>
				<tbody>

					<!-- 게시글 목록에 따라 반복하여 게시글정보(글번호,제목,작성자,작성일)를 테이블에 뿌려줌-->
					<%
						for (int i = 0; i < postList.size(); i++) {
							Post post = (Post) postList.get(i);
					%>
					<tr>
						<td><%=post.getPostNo()%></td>
						<td><a href="../from/post?postNo=<%=post.getPostNo()%>"><%=post.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
						.replaceAll("\n", "<br>")%></a></td>
						<td><%=StudentDAO.getWriter(post.getSid()).getName()%></td>
						<td><%=post.getPostingdate().substring(0, 11) + post.getPostingdate().substring(11, 13) + "시"
						+ post.getPostingdate().substring(14, 16) + "분"%></td>
					</tr>
					<%
						}
					%>

				</tbody>
			</table>



		</div>
		<div style="float: left">
			<%
				if (pageNumber != 1) {
			%>
			<a
				href="${pageContext.request.contextPath}/from/board?pageNumber=<%=pageNumber  - 1%>"
				class="btn btn-secondary" style="margin-left: 20px">◀</a>
			<%
				}
				if (nextPage) {
			%>
			<a
				href="${pageContext.request.contextPath}/from/board?pageNumber=<%=pageNumber  + 1%>"
				class="btn btn-secondary" style="margin-left: 20px">▶</a>
			<%
				}
			%>
		</div>

		<div style="float: right">
			<a href="${pageContext.request.contextPath}/from/postingpage"
				class="btn btn-primary pull-right">글쓰기</a>
		</div>

		<div style="float: right" align="center">
			<form action="${pageContext.request.contextPath}/from/board"
				class="form-inline">
				<div class="form-group mx-sm-3 mb-2">
					<label for="title" class="sr-only">제목</label> <input type="text"
						name="title" id="title" class="form-control" placeholder="제목">

					<button type="submit" class="btn btn-primary pull-right">검색</button>
				</div>
				
				<!--<input type="text" name="title"  class="form-control" placeholder="제목">   -->
			

			</form>

		</div>
	</div>





</body>


</html>