<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>���� ö�� �ֽ�ȸ��</title>
</head>
<body>
<div style="border:0 padding-top:2; text-align:center;">

<%

		// request ��ü�κ��� �Ķ���͸� ������.
		try{
			String userID = (String) session.getAttribute("userID");
			String userPassword = (String) session.getAttribute("userPassword");
			String userName = (String) session.getAttribute("userName");
			
				%>
			<div>
		<p>
			ȯ���մϴ�!
			<%=userID %>��
		</p>
		
	</div>	
				<%
		} catch (NumberFormatException e) {
	%>
	<%
		}
		%>
		<form action = "manager_Train_input.jsp" method ="get">
		<table border="1" bordercolor="blue" width ="500" height="300" align = "center" >
    <tr bgcolor="blue" align ="center">
	<p><td colspan = "3" span style="color:white">Train �Է�</td></p>
    </tr>
    <tr align = "center" bgcolor="skybule">
	<td>�׸�</td>
	<td>�Է�</td>
    </tr>
    <tr>
	<td>ID</td>
	<td><input name = "ID" type="number" /></td>
    </tr>
    <tr>
	<td>Type</td>
	<td><input name = "Type" type="text" /></td>
    </tr>
    <tr>
	<td>State</td>
	<td><input name = "State" type="text"/></td>
    </tr>
    <tr >
	<td colspan = "3" span style="color:white"><button type="submit">����</button></td>
    </tr>
</table>
	
	
</form>
<br>
 <form action = "manager_input.jsp" method ="get">
         			<button type="submit">���� �������� ���ư���</button>
         	</form>
</div>
 	
</body>
</html>




