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
<h4>헤드 리스트</h4>
    <table width="100%" border="1">
        <tr>
            <td>ID</td>
            <td>Name</td>
            <td>Address</td>
            <td>Tel</td>
            <td>ManagerName</td>
            <td>Budget</td>
            <td>Headquarter_ID</td>
            <td>삭제</td>
            <td>수정</td>
        </tr>
        
       <%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    String driver = "org.mariadb.jdbc.Driver";
	Class.forName(driver);
    String Station = request.getParameter("Station");
    String search = request.getParameter("search");
    System.out.println(Station + "<-- sk m_search_list.jsp");
    System.out.println(search + "<-- sv m_search_list.jsp");
    
    try{
    	String dbName = "rail";
    	String jdbcDriver = "jdbc:mariadb://localhost:3306/" + dbName;
    	String dbUser = "root";
    	String dbPass = "7240";
    	
    	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
    	
        if(Station == null && search == null){
            pstmt = conn.prepareStatement("select * from Station");
            
        }else if(Station != null && search.equals("")){
            pstmt = conn.prepareStatement("select * from Station");
            
        }else if(Station != null & search != null){
            pstmt = conn.prepareStatement("select * from Station where "+Station+"=?");
            pstmt.setString(1, search); 
        }
        rs = pstmt.executeQuery();
        while(rs.next()){
   %>
    <tr>
            <td><%= rs.getInt("ID")%></td>
            <td><%= rs.getString("Name")%></td>
            <td><%= rs.getString("Address")%></td>
            <td><%= rs.getString("Tel")%></td>
            <td><%= rs.getString("ManagerName")%></td>
            <td><%= rs.getInt("Budget")%></td>
            <td><%= rs.getInt("Headquarter_ID")%></td>
            <td><a href="manager_Station_delete.jsp?ID=<%=rs.getInt("ID")%>" >삭제</a></td>
			<td><a href="manager_Station_update.jsp?ID=<%=rs.getInt("ID")%>" >수정</a></td>
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
</body>
</html>