<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>
<body>
	<h1>boardList</h1>
	<a href="${pageContext.request.contextPath}/addboard">추가</a>
	<table border="1">
		<tr>
			<th>board_id</th>
			<th>board_title</th>
			
			
		</tr>
		<c:forEach var="b" items="${boardList}">
			<tr>
				<td>${b.boardId}</td>
				<td><a href="${pageContext.request.contextPath}/boardOne?boardId=${b.boardId}">${b.boardTitle}</a></td>
			</tr>
		</c:forEach>
	</table>
	<ul class="pagination">
		<c:if test="${currentPage==1}">
			<li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/boardList/1"> << </a> </li>
			<li class="page-item disabled"> <a class="page-link" href="${pageContext.request.contextPath}/boardList/${currentPage-1}"> < </a></li>
		</c:if>
			<c:if test="${currentPage>1}">
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/boardList/1"> << </a></li>
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/boardList/${currentPage-1}"> < </a></li>
		</c:if>
		<c:forEach var="p" begin="${firstShow}" end="${lastShow}">
			<c:if test="${p<=lastPage }">
				<c:if test="${p==currentPage}">
					<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/boardList/${p}">${p}</a></li>
				</c:if>
				<c:if test="${p!=currentPage}">
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/boardList/${p}">${p}</a></li>
				</c:if>
			</c:if>
		</c:forEach>
		<c:if test="${currentPage<lastPage}">
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/boardList/${currentPage+1}"> > </a></li>
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/boardList/${lastPage}"> >> </a></li>
		</c:if>
		<c:if test="${currentPage==lastPage }">
			<li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/boardList/${currentPage+1}"> > </a></li>
			<li class="page-item disabled"> <a class="page-link" href="${pageContext.request.contextPath}/boardList/${lastPage}"> >> </a></li>
		</c:if>
		
	</ul>
</body>
</html>