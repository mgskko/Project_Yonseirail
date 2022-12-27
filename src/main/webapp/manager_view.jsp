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
			int ID = Integer.parseInt(request.getParameter("ID"));
			String userID = (String) session.getAttribute("userID");
			String userPassword = (String) session.getAttribute("userPassword");
			String userName = (String) session.getAttribute("userName");
			
			String insert_value_single = "select id from Headquarter ";
			
			String driver = "org.mariadb.jdbc.Driver";
			Class.forName(driver);
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			pstmt = conn.prepareStatement(insert_value_single);	
			rs = pstmt.executeQuery();
				%>
			<div>
			<h1>수정중입니다</h1>
		<p>
			환영합니다!
			<%=userID %>님
		</p>
		
	</div>	
			
<table border="1" bordercolor="blue" width ="500" height="300" align = "center" >
    <tr bgcolor="blue" align ="center">
	<p><td colspan = "3" style="color:white">Station 입력</td></p>
    </tr>
    <tr align = "center" bgcolor="skybule">
	<td>항목</td>
	<td>항목별 통계</td>
    </tr>
    <tr>
	<td>ID</td>
	<td><input name = "ID" value="<%= ID%>" readonly/></td>
    </tr>
    <tr>
	<td>Name</td>
	<td><input name = "Name" type="text" /></td>
    </tr>
    <tr>
	<td>Address</td>
	<td><input name = "Address" type="text"/>
    </tr>
    <tr>
	<td>Tel</td>
	<td><input name = "Tel" type="text"/>
    </tr>
    <tr>
	<td>ManagerName</td>
	<td><input name = "ManagerName" type="text"/></td>
    </tr>
    <tr>
	<td>Budget</td>
	<td><input name = "Budget" type="number" min="1" max="10000000000" value="10000" /></td>
    </tr>
    <tr>
	<td>Headquarter_ID</td>
	<td>
	<select name="Headquarter_ID">
			<%
			 while(rs.next()){
			%>
	<option ><%=rs.getInt(1)%></option>
	<%	} %>
		</select>
	</td>
    </tr>
    <tr >
	<td colspan = "3" style="color:white"><button type="submit">전송</button></td>
    </tr>
    
    <td><form action = "manager_search.jsp" method ="get">
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




