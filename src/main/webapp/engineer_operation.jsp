<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
			<%=userID %> 님
		</p>
		
	</div>	
				
				<%
		} catch (NumberFormatException e) {
	%>
	<%
		}
		%>
<h1>테이블에 입력 하기</h1>
<form action="engineer_operation_input.jsp" method="get">
    	<button type="submit">operation</button>
</form><br>
<form action="engineer.jsp" method="get">
    	<button type="submit">처음으로 이동</button>
</form>
</body>
</html>