<%@page import="jspBulletinBoard.dao.PostDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jspBulletinBoard.vo.Student"%>
<%@page import="jspBulletinBoard.vo.Post" %>
<jsp:useBean id="student" class="jspBulletinBoard.vo.Student" scope="session"/>
<%
	request.setCharacterEncoding("utf-8");
	String sid = (String)session.getAttribute("login");
	
	int postNo = 0;
	if(request.getParameter("postNo") != null){
		postNo = Integer.parseInt(request.getParameter("postNo"));
	}
	
	Post postParam = new Post();
	postParam.setPostNo(postNo);
	
	PostDAO postDAO = new PostDAO();
	Post post = new Post();
	
	if(postNo == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert(\"유효하지 않은 글입니다.\");");
		script.println("location.href = '../from/fromBoardPage.jsp'");
		script.println("</script>");
	}else {
		
		post = postDAO.getPostInfo(postParam);
		
		if(!sid.equals(post.getSid()+"")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(\"권한이 없습니다.\");");
			script.println("location.href = '../from/fromBoardPage.jsp'");
			script.println("</script>");
		}
	}
	
	int updateQuery = postDAO.deletePost(postParam);

	if(updateQuery ==1){
		response.sendRedirect("../from/fromBoardPage.jsp");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert(\"삭제에 실패하였습니다.\");");
		script.println("history.go(-1);");
		script.println("</script>");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>