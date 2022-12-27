<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>연세 철도 주식회사</title>
</head>
<body>
<%
	String dbName = "rail";
	String jdbcDriver = "jdbc:mariadb://localhost:3306/" + dbName;
	String dbUser = "root";
	String dbPass = "7240";
	String query = "Select * from instructor";
	String update_query = "";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		int ID = Integer.parseInt(request.getParameter("ID"));
		String userID = (String) session.getAttribute("userID");
		String userPassword = (String) session.getAttribute("userPassword");
		String userName = (String) session.getAttribute("userName");
		
		String sql = "delete from operation where ID="+ ID + "";
		
		String driver = "org.mariadb.jdbc.Driver";
			Class.forName(driver);
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			%>
			<h1>성공</h1>
			<p>
			성공적으로 데이터베이스 <%=dbName%>에 삭제하였습니다.
			</p class ="lead">
			수행한 SQL Statement :
			<%=sql %>
			<form action = "engineer.jsp" method ="get">
			<button type="submit">돌아가기</button>
	</form>
	<%

        } catch(Exception e){
            e.printStackTrace();
            %>
        
		
		  <div align="center">
		<h1>다시 입력해주세요!</h1>
         <form action = "engineer_operation_info.jsp" method ="get">
         			<button type="submit">돌아가기</button>
         	</form>
         	</div>
		
         	<%
        }
		finally{ //모든 자원 해제
            try{
                if(rs != null) rs.close();
                if(stmt != null) stmt.close();
                if(conn != null) conn.close();
                if(stmt != null) stmt.close();
            }catch(Exception e2){
                e2.printStackTrace();
            }
        %>
           
            <%	
        }
%>
	</form>
</body>
</html>