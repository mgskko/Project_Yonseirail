<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연세 철도 주식회사</title>
</head>
<body>
<div align="center">
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
<div>
		<h1>기능을 선택하세요</h1>
	</div>
	<form action="manager_input.jsp" method="get">
    	<button type="submit">입력</button>
</form><br>
<form action="manager_search.jsp" method="get">
    	<button type="submit">검색, 삭제, 수정</button>
</form><br>
<form action="manager_view.jsp" method="get">
    	<button type="submit">각종 통계</button>
</form><br>
	<form action="form.jsp" method="get">
	    	<button type="submit">로그인으로 가기</button>
	</form>
</div>
</body>
</html>