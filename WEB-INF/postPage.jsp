<%@page import="jspBulletinBoard.dao.StudentDAO"%>
<%@page import="jspBulletinBoard.dao.PostDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="jspBulletinBoard.vo.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jspBulletinBoard.vo.Student"%>
<%
	String postNo = request.getParameter("postNo");

	if(postNo == null || postNo.equals("")){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert(\"글번호가 잘못 되었습니다.\");");
		script.println("location.href = '../from/fromBoardPage.jsp'");
		script.println("</script>");
	}

	
	request.setCharacterEncoding("utf-8");
	String SID = (String)session.getAttribute("login");

	Post postParam = new Post();
	postParam.setPostNo(Integer.parseInt(postNo));
	
	PostDAO postDAO = new PostDAO();
	Post post = postDAO.getPostInfo(postParam);
	
	StudentDAO studentDAO = new StudentDAO();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 페이지</title>
</head>
<body>
<jsp:include page="included/top.jsp">
	<jsp:param value="board" name="type"/>
</jsp:include>

<div class="container" style="margin-top:60px;">
	<div class="row" >
		<table class="table table-striped" style="text-align: center; border: 1px solid  #dddddd; word-wrap:break-word; word-break:break-all;">
			<thead>
				<tr>
					<th colspan="3" style="background-color: #dddddd; text-align: center">
						<%= post.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %> 
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 20%">
						작성자
					</td>
					<td colspan="2">
						<%= studentDAO.getWriter(post.getSid()).getName()%>
					</td>
				</tr>
				<tr>
					<td>
						작성일자
					</td>
					<td colspan="2">
						<%= post.getPostingdate().substring(0,11) + post.getPostingdate().substring(11,13) +"시" + post.getPostingdate().substring(14,16) +"분"%>
					</td>
				</tr>
				<tr>
					<td>
						내용
					</td>
					<td colspan="2" style="height:200px ;text-align: left;">
						<div>
							<%= post.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%>
						</div>
					</td>
				</tr>
				
			
				
				
			</tbody>
		</table>
		</div>
		<div style="float : left">
			<a href="../from/fromBoardPage.jsp" class="btn btn-primary"  >목록</a>
		
		<%if(SID.equals(post.getSid()+"")){ %>
			<a href="../from/fromUpdatePostPage.jsp?postNo=<%=post.getPostNo() %>" class="btn btn-primary"  >수정</a>
			<a href="../from/fromDeletePostPage.jsp?postNo=<%=post.getPostNo() %>" class="btn btn-primary"  onclick="return confirm('정말로 삭제하시겠습니까?')">삭제</a>
			
		<%}%>
		</div>
</div>
</body>
</html>