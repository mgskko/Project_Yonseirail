<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
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
	String dbName = "rail";
	String jdbcDriver = "jdbc:mariadb://localhost:3306/" + dbName;
	String dbUser = "root";
	String dbPass = "7240";
	String query = "Select * from instructor";
	String update_query = "";
	
	Connection conn = null;
	Statement stmt = null;
	
	String userID = (String) session.getAttribute("userID");
	String userPassword = (String)session.getAttribute("userPassword");
	String userName = (String)session.getAttribute("userName");
	
	String insert_value_single = "INSERT INTO user(userID, userPassword, userName) values('" + userID + "','" + userPassword + "','" + userName + "');";
	

	try {
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		stmt.executeUpdate(insert_value_single);
	%>
		<h1>성공</h1>
		<p>
		성공적으로 데이터베이스 <%=dbName%>에 등록하였습니다.
		</p class ="lead">
		수행한 SQL Statement :
		<%=insert_value_single %>
		
		<%
			System.out.println("Success");
	}catch (SQLException se) {
		se.printStackTrace();
	} finally {
		try {
			stmt.close();
			conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
		%>
	

</body>
</html>