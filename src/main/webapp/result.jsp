<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>입력 결과</title>
</head>
<body>
	<%
		// request 객체로부터 파라미터를 가져옴.
		try{
			
			String userID = request.getParameter("userID");
			String userPassword = request.getParameter("userPassword");
			String userName = request.getParameter("userName");
			String redirect = null;
			String manager_name = "manager";
			String engineer_name = "engineer";
			
			
			if (userName.equals(manager_name)){
				session.setAttribute("userID", userID);
				session.setAttribute("userPassword", userPassword);
				session.setAttribute("userName", userName);
				redirect = "manager.jsp";
			}
			
			else if (userName.equals(engineer_name)){
				session.setAttribute("userID", userID);
				session.setAttribute("userPassword", userPassword);
				session.setAttribute("userName", userName);
				redirect = "engineer.jsp";
			}
			
			else {
				%>
				<script>
				alert("다시 입력해주세요");
				location.href = "form.jsp"
				</script>
				<%
			}
			
			String insert = request.getParameter("register");
			
			if (insert != null && insert.equals("on")) {
				session.setAttribute("userID", userID);
				session.setAttribute("userPassword", userPassword);
				session.setAttribute("userName", userName);
				redirect = "register.jsp";
			}
			
			if (redirect != null)
				response.sendRedirect(redirect);
	%>
	
	<%
		} catch (NumberFormatException e) {
	%>
	
	<h1> 이런 !</h1>
	<p>
		올바른 정보를 입력해주세요...:(
		<%
		}
		%>


</p>
</body>
</html>