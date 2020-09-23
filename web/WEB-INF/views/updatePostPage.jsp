<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width , initial-scale=1">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<title>게시글수정페이지</title>

</head>
<body>
	<c:import url="included/top.jsp">
		<c:param value="board" name="type" />
	</c:import>


	<div class="container" style="margin-top: 60px">
		<div class="row-col">
			<form method="post"
				action="../from/update?postNo=${post.postNo}">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시글
								수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="title" maxlength="30"
								value="${fn:replace(fn:replace(fn:replace(fn:replace(fn:replace(post.title, ' ', '&nbsp;'), '<', '&lt;'), '>', '&gt;'), '\\n', ''), '\"', '&quot;')}"
								required autofocus></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="content" maxlength="2048" style="height: 350px;" required>${post.content}</textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right"
					style="margin-left: 91%" value="글수정" />
			</form>

		</div>
	</div>

</body>
</html>