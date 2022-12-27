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
String dbName = "rail";
String jdbcDriver = "jdbc:mariadb://localhost:3306/" + dbName;
String dbUser = "root";
String dbPass = "7240";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
		// request 객체로부터 파라미터를 가져옴.
		try{
			
			String userID = (String) session.getAttribute("userID");
			String userPassword = (String) session.getAttribute("userPassword");
			String userName = (String) session.getAttribute("userName");
			
			String insert_value_single = "select id from line ";
			
			String driver = "org.mariadb.jdbc.Driver";
			Class.forName(driver);
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			pstmt = conn.prepareStatement(insert_value_single);	
			rs = pstmt.executeQuery();
			
				%>
			<div>
		<p>
			환영합니다!
			<%=userID %>님
		</p>
		
	</div>	
				
		<form action = "manager_TrainCode_input.jsp" method ="get">
		<table border="1" bordercolor="blue" width ="500" height="300" align = "center" >
    <tr bgcolor="blue" align ="center">
	<p><td colspan = "3" span style="color:white">TrainCode 입력</td></p>
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
	<td>Code</td>
	<td><input name = "Code" type="text" /></td>
    </tr>
    <tr>
	<td>DAY</td>
	<td><input name = "DAY" type="text"/></td>
    </tr>
    <tr>
	<td>StartStation</td>
	<td><input name = "StartStation" type="text"/></td>
    </tr>
    <tr>
	<td>StartTime</td>
	<td><input name = "StartTime" type="text"/></td>
    </tr>
     <tr>
	<td>EndStation</td>
	<td><input name = "EndStation" type="text"/></td>
    </tr>
    <tr>
	<td>EndTime</td>
	<td><input name = "EndTime" type="text"/></td>
    </tr>
    <tr>
	<td>Line_ID</td>
	<td>
	<select name="Line_ID">
			<%
			 while(rs.next()){
			%>
	<option><%=rs.getInt(1)%></option>
	<%	} %>
		</select>
	</td>
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
	<%

        } catch(Exception e){
            e.printStackTrace();
            %>
         	
         	</div>
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




