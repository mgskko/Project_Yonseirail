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
		<table border="1" bordercolor="blue" width ="500" height="300" align = "center" >
    <tr bgcolor="blue" align ="center">
	<p><td colspan = "3" span style="color:white">테이블을 선택하세요</td></p>
    </tr>
	<tr><td>
<form action="manager_Headquarter.jsp" method="get">
    	<button type="submit">Headquarter</button>
</form>
</td></tr>
<tr><td>
<form action="manager_Station.jsp" method="get">
    	<button type="submit">Station</button>
</form>
</td></tr>
<tr><td>
<form action="manager_Line.jsp" method="get">
    	<button type="submit">Line</button>
</form>
</td></tr>
<tr><td>
<form action="manager_TrainCode.jsp" method="get">
    	<button type="submit">TrainCode</button>
</form>
</td></tr>
<tr><td>
<form action="manager_Train.jsp" method="get">
    	<button type="submit">Train</button>
</form>
</td></tr>
<tr><td>
<form action="manager_Vehicle.jsp" method="get">
    	<button type="submit">Vehicle</button>
</form>
</td></tr>
<tr><td>
<form action="manager_Engineer.jsp" method="get">
    	<button type="submit">Engineer</button>
</form>
</td></tr>
<tr ><td align = "center" bgcolor="skybule">
<form action="manager.jsp" method="get">
    	<button type="submit">이전 페이지로 이동</button>
</form>
</td></tr>

</table>
</div>
</body>
</html>