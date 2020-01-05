<%@page import="jspBulletinBoard.dao.StudentDAO"%>
<%@page import="jspBulletinBoard.dao.PostDAO"%>
<%@page import="jspBulletinBoard.vo.Post"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jspBulletinBoard.vo.Student"%>
<jsp:useBean id="student" class="jspBulletinBoard.vo.Student" scope="session"/>
<%		
	List<Object> postList = (List<Object>)request.getAttribute("postList"); // 서블릿에서 request영역에 저장해둔 게시글리스트,페이지번호,다음페이지번호를 얻어옴
	int pageNumber = (Integer)request.getAttribute("pageNumber");
	boolean nextPage = (Boolean)request.getAttribute("nextPage");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style>
		a,a:hover{
			color : #000000;
			text-decoration : none;'
		}
	</style>
	
	<title>게시판메인페이지</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="included/top.jsp">
	<jsp:param value="board" name="type"/>
</jsp:include>
 	<br><br>
	<table style="text-align: center; border: 1px solid  #dddddd" align="center">
		<thead>
			<tr>
				<th style="background-color: #eeeeee; text-align: center; width:15%">글번호</th>
				<th style="background-color: #eeeeee; text-align: center; width:55%">제목</th>
				<th style="background-color: #eeeeee; text-align: center; width:10%">작성자</th>
				<th style="background-color: #eeeeee; text-align: center; width:20%">작성일</th>
			</tr>
		</thead>
		<tbody> <!-- 게시글 목록에 따라 반복하여 게시글정보(글번호,제목,작성자,작성일)를 테이블에 뿌려줌-->
				<%for(int i = 0; i<postList.size(); i++){
					Post post = (Post)postList.get(i);
				%>
				<tr>
				<td><%= post.getPostNo() %></td>
				<td><a href="../from/post?postNo=<%=post.getPostNo() %>"><%= post.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
				<td><%= StudentDAO.getWriter(post.getSid()).getName()%></td>
				<td><%= post.getPostingdate().substring(0,11) + post.getPostingdate().substring(11,13) +"시" + post.getPostingdate().substring(14,16) +"분" %></td>
				</tr>
				<%}%>
		</tbody>
	</table>
	<div align="center">
	<%  // 이전버튼, 다음버튼이 있는지 없는지 검사 후(Servlet에서 던져준) BoardServlet를 다시호출한다 이떄 pageNumber 파라미터를 1감소,증가 시킨값을 넘겨주어 Servlet에서 다른 게시글 리스트를 만들도록한다.
		if(pageNumber != 1){%>
			<a href="${pageContext.request.contextPath}/from/board?pageNumber=<%=pageNumber  - 1%>"  style="margin-left: 20px">◀</a>
	<%}if(nextPage){%>
			<a href="${pageContext.request.contextPath}/from/board?pageNumber=<%=pageNumber  + 1%>" style="margin-left: 20px">▶</a>
	<%}%>
		<a href="${pageContext.request.contextPath}/from/postingpage" style="margin-left: 30%" ><input type="button" value="글쓰기"/></a>
	</div>
	<div align="center">
		<form action="${pageContext.request.contextPath}/from/board">
			<input type="text" name="title" placeholder="제목">
			<input type="submit" value="검색"/>
		</form>
	</div>
</body>
</html>