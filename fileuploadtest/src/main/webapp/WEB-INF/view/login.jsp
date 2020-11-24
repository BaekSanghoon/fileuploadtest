<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<form method="post" action ="${pageContext.request.contextPath}/login">
		<div>user_id : <input type="text" name="userId" value="${user.userId}"></div>
		<div>user_pw : <input type="password" name="userPw"></div>
		<div><button type="submit">로그인</button></div>
	</form>
</body>
</html>