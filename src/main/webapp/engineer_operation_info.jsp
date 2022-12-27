<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 검색 리스트</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<div style="border:0 padding-top:2; text-align:center;">
<h1>operation 테이블</h1>

    <table width="100%" border="1">
        <tr>
            <td>ID</td>
            <td>Status</td>
            <td>DeptStatus</td>
            <td>ArvStatus</td>
            <td>UpdateTime</td>
            <td>Engineer_ID</td>
            <td>TrainCode_ID</td>
            <td>Train_ID</td>
            <td>삭제</td>
            <td>수정</td>
        </tr>
        
       <%
   	Connection conn = null;
   	Statement stmt = null;
   	ResultSet rs = null;
    
	String dbName = "rail";
	String jdbcDriver = "jdbc:mariadb://localhost:3306/" + dbName;
	String dbUser = "root";
	String dbPass = "7240";
	String userID = (String) session.getAttribute("userID");
	String redirect = null;
	String query  = "Select * from operation where Engineer_ID ='" + userID + "';";
	String driver = "org.mariadb.jdbc.Driver";
	Class.forName(driver);
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt = conn.createStatement();
	rs = stmt.executeQuery(query);	
    
    try{
    		
        while(rs.next()){
   %>
   <tr>
			<td><%=rs.getInt(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
                <td><%=rs.getString(6)%></td>
                <td><%=rs.getInt(7)%></td>
                <td><%=rs.getInt(8)%></td>
                
                <td><a href="engineer_operation_delete.jsp?ID=<%=rs.getInt(1)%>" >삭제</a></td>
				<td><a href="engineer_operation_update.jsp?ID=<%=rs.getInt(1)%>" >수정</a></td>
		</tr>
    
     
        <%        
        }    
    
    }catch(SQLException ex) {
        ex.printStackTrace();
    
    } finally {
        // 6. 사용한 Statement 종료
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
        
        // 7. 커넥션 종료
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
   %>
    </table>
    </br>
     <form action = "engineer.jsp" method ="get">
         			<button type="submit">이전 페이지로 돌아가기</button>
         	</form>
         	</div>
</body>
</html>