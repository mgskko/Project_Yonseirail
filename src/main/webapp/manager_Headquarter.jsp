<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			String userID = (String) session.getAttribute("userID");
			String userPassword = (String) session.getAttribute("userPassword");
			String userName = (String) session.getAttribute("userName");
			
				%>
			<div>
		<p>
			환영합니다!
			<%=userID %>님
		</p>
		
	</div>	
				<%
		} catch (NumberFormatException e) {
	%>
	<%
		}
		%>
		<form action = "manager_Headquarter_input.jsp" method ="get">
		<table border="1" bordercolor="blue" width ="500" height="300" align = "center" >
    <tr bgcolor="blue" align ="center">
	<p><td colspan = "3" span style="color:white">Headquarter 입력</td></p>
    </tr>
    <tr align = "center" bgcolor="skybule">
	<td>항목</td>
	<td>입력</td>
    </tr>
    <tr>
	<td>ID</td>
	<td><input name = "ID" type="number" /></td>
    </tr>
    <tr>
	<td>Name</td>
	<td><input name = "Name" type="text" /></td>
    </tr>
    <tr>
	<td>Planet</td>
	<td><input name = "Planet" type="text"/></td>
    </tr>
    <tr>
	<td>Continent</td>
	<td><input name = "Continent" type="text"/></td>
    </tr>
    <tr>
	<td>ManagerName</td>
	<td><input name = "ManagerName" type="text"/></td>
    </tr>
    <tr>
	<td>Budget</td>
	<td><input name = "Budget" type="number" min="1" max="10000000000" value="10000" /></td>
    </tr>
    <tr >
	<td colspan = "3" style="color:white"><button type="submit">전송</button></td>
    </tr>
    </form>
    <td><form action = "manager_input.jsp" method ="get">
         			<button type="submit">이전 페이지로 돌아가기</button>
         	</form></td>
     <td><form action = "manager.jsp" method ="get">
         			<button type="submit">manager 페이지로 돌아가기</button>
         	</form></td>
</table>
	
	 	
</div>
</body>
</html>




