<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	String dbName = "rail";
	String jdbcDriver = "jdbc:mariadb://localhost:3306/" + dbName;
	String dbUser = "root";
	String dbPass = "7240";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
		// request 객체로부터 파라미터를 가져옴.
		try{
			
			String insert_value_single = "select id from Headquarter ";
			
			String driver = "org.mariadb.jdbc.Driver";
			Class.forName(driver);
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			pstmt = conn.prepareStatement(insert_value_single);	
			rs = pstmt.executeQuery();
			%><select id="Df">
			<%
			 while(rs.next()){
			%>
		
		<option><%=rs.getInt(1)%></option>
	<%	} %>
		</select>
	<%

			 
        } catch(Exception e){
            e.printStackTrace();
            %>
        
		
		

         	<%
        }
		finally{ //모든 자원 해제
            try{
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            }catch(Exception e2){
                e2.printStackTrace();
            }
        %>
           
            <%	
        }
%>
</body>
</html>