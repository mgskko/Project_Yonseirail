<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연세 철도 주식회사</title>
</head>
<body>
	<div align="center" >
		<h1>로그인</h1>
	
	<form action = "result.jsp" method ="get">
	<div>
		ID : <INPUT type="text" name="userID"size="15" /><BR>
		PW : <INPUT type="password" name="userPassword" size="15" /><BR>
		NAME : <INPUT type="text" name="userName"size="15" /><BR>
	</div>
	<div>
		<label>데이터베이스에 등록</label>
		<input type="checkbox" name="register">	
	</div>
	<button type="submit">전송</button>
	</form>
	</div>
</body>
</html>