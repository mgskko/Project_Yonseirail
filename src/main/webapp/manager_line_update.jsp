<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연세 철도 주식회사</title>
</head>
<body>
<div style="border:0 padding-top:2; text-align:center;">

<%

		// request 객체로부터 파라미터를 가져옴.
		try{
			int ID = Integer.parseInt(request.getParameter("ID"));
			
			String userID = (String) session.getAttribute("userID");
			String userPassword = (String) session.getAttribute("userPassword");
			String userName = (String) session.getAttribute("userName");
			
				%>
			<div>
			<h1>수정중입니다</h1>
		<p>
			환영합니다!
			<%=userID %>님
		</p>
		
	</div>	
			
		<form action = "manager_line_update_ok.jsp" method ="get">
		<table border="1" bordercolor="blue" width ="500" height="300" align = "center" >
    <tr bgcolor="blue" align ="center">
	<p><td colspan = "3" span style="color:white">Line 입력</td></p>
    </tr>
    <tr align = "center" bgcolor="skybule">
	<td>항목</td>
	<td>입력</td>
    </tr>
    <tr>
	<td>ID</td>
	<td><input name = "ID" value="<%=ID %>" readonly/></td>
    </tr>
    <tr>
	<td>Name</td>
	<td><input name = "Name" type="text" /></td>
    </tr>
    <tr>
	<td>BuiltYear</td>
	<td><input name = "BuiltYear" type="number"/></td>
    </tr>
    <tr>
	<td>Capacity</td>
	<td><input name = "Capacity" type="number"/></td>
    </tr>
    <tr >
	<td colspan = "3" span style="color:white"><button type="submit">전송</button></td>
    </tr>
</table>
	
	
</form>
<br>
  <form action = "manager_search.jsp" method ="get">
         			<button type="submit">이전 페이지로 돌아가기</button>
         	</form>
</div>

	<%
		} catch (NumberFormatException e) {
	%>
	<%
		}
		%>

</body>
</html>




