<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>연세 철도 주식회사</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<div style="border:0 padding-top:2; text-align:center;">
<h1>TrainCode 테이블</h1>
    <table width="100%" border="1">
        <tr>
            <td>ID</td>
            <td>Type</td>
            <td>Model</td>
            <td>YEAR</td>
            <td>Status</td>
            <td>Train_ID</td>
            <td>삭제</td>
            <td>수정</td>
        </tr>
        
       <%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    String driver = "org.mariadb.jdbc.Driver";
	Class.forName(driver);
    String vehicle = request.getParameter("vehicle");
    String search = request.getParameter("search");
    System.out.println(vehicle + "<-- sk m_search_list.jsp");
    System.out.println(search + "<-- sv m_search_list.jsp");
    
    try{
    	String dbName = "rail";
    	String jdbcDriver = "jdbc:mariadb://localhost:3306/" + dbName;
    	String dbUser = "root";
    	String dbPass = "7240";
    	
    	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
    	
        if(vehicle == null && search == null){
            pstmt = conn.prepareStatement("select * from vehicle");
            
        }else if(vehicle != null && search.equals("")){
            pstmt = conn.prepareStatement("select * from vehicle");
            
        }else if(vehicle != null & search != null){
            pstmt = conn.prepareStatement("select * from vehicle where "+vehicle+"=?");
            pstmt.setString(1, search); 
        }
        rs = pstmt.executeQuery();
        while(rs.next()){
   %>
    <tr>
            <td><%= rs.getInt("ID")%></td>
            <td><%= rs.getString("Type")%></td>
            <td><%= rs.getString("Model")%></td>
            <td><%= rs.getInt("YEAR")%></td>
            <td><%= rs.getString("Status")%></td>
            <td><%= rs.getInt("Train_ID")%></td>
            <td><a href="manager_vehicle_delete.jsp?ID=<%=rs.getInt("ID")%>" >삭제</a></td>
			<td><a href="manager_vehicle_update.jsp?ID=<%=rs.getInt("ID")%>" >수정</a></td>
        </tr>
     
        <%        
        }    
    
    }catch(SQLException ex) {
        ex.printStackTrace();
    
    } finally {
        // 6. 사용한 Statement 종료
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        
        // 7. 커넥션 종료
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
   %>
    </table>
     </br>
     <form action = "manager_Vehicle_search.jsp" method ="get">
         			<button type="submit">이전 페이지로 돌아가기</button>
         	</form>
         	</div>
</body>
</html>