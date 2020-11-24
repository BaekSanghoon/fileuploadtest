<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>boardOne</h1>
	<a href="${pageContext.request.contextPath}/boardList/1">목록</a>
	<a href="${pageContext.request.contextPath}/updateBoard?boardId=${boardOne.boardId}">수정</a>
	<a href="${pageContext.request.contextPath}/removeBoard?boardId=${boardOne.boardId}">삭제</a>
				
	<table border="1">
		<tr>
			<td>boardId</td>
			<td>${boardOne.boardId}</td>
		</tr>
		<tr>
			<td>boardTitle</td>
			<td>${boardOne.boardTitle}</td>
		</tr>
		<tr>
			<td>boardContent</td>
			<td>${boardOne.boardContent}</td>
		</tr>
		<tr>
			<td>boardfile</td>
			<td>
				<c:forEach var="bf" items="${boardOne.boardfiles}">
					<c:if test="${bf.boardfileName!=null}">
						<div>
							<a href="${pageContext.request.contextPath}/upload/${bf.boardfileName}">${bf.boardfileName}</a>
						</div>
					</c:if>	
					<c:if test="${bf.boardfileName==null}">
						<div>첨부파일이 없습니다.</div>
					</c:if>
				</c:forEach>
			</td>
		</tr>
	</table>
		<h3>댓글 목록</h3>
		<table border="1">
				<c:forEach var="c" items="${boardOne.commentList }">
					<c:if test="${c.commentContent!=null}">
					<div>${c.commentContent }
					 <a href="deleteCommnetOne?boardId=${c.boardId }&commentId=${c.commentId}">x</a>
					 </div>
					</c:if>
				</c:forEach>
		</table>
		<form method="post" action="${pageContext.request.contextPath }/addComment">
			<input type="hidden" name="boardId" value="${boardOne.boardId}">
			<textarea name="commentContent" rows="3" cols="50"></textarea>
			<button type="submit">댓글 추가</button>
		</form>
	
	
</body>
</html>