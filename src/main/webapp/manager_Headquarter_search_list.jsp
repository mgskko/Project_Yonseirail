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
<h1>Headquarter 테이블</h1>

    <table width="100%" border="1">
        <tr>
            <td>ID</td>
            <td>Name</td>
            <td>Planet</td>
            <td>Continent</td>
            <td>ManagerName</td>
            <td>Budget</td>
            <td>삭제</td>
            <td>수정</td>
        </tr>
        
       <%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    String driver = "org.mariadb.jdbc.Driver";
	Class.forName(driver);
    String Headquarter = request.getParameter("Headquarter");
    String search = request.getParameter("search");
    System.out.println(Headquarter + "<-- sk m_search_list.jsp");
    System.out.println(search + "<-- sv m_search_list.jsp");
    
    try{
    	String dbName = "rail";
    	String jdbcDriver = "jdbc:mariadb://localhost:3306/" + dbName;
    	String dbUser = "root";
    	String dbPass = "7240";
    	
    	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
    	
        if(Headquarter == null && search == null){
            pstmt = conn.prepareStatement("select * from Headquarter");
            
        }else if(Headquarter != null && search.equals("")){
            pstmt = conn.prepareStatement("select * from Headquarter");
            
        }else if(Headquarter != null & search != null){
            pstmt = conn.prepareStatement("select * from Headquarter where "+Headquarter+"=?");
            pstmt.setString(1, search); 
        }
        rs = pstmt.executeQuery();
        while(rs.next()){
   %>
    <tr>
            <td><%= rs.getInt("ID")%></td>
            <td><%= rs.getString("Name")%></td>
            <td><%= rs.getString("Planet")%></td>
            <td><%= rs.getString("Continent")%></td>
            <td><%= rs.getString("ManagerName")%></td>
            <td><%= rs.getInt("Budget")%></td>
            <td><a href="manager_Headquarter_delete.jsp?ID=<%=rs.getInt("ID")%>" >삭제</a></td>
			<td><a href="manager_Headquarter_update.jsp?ID=<%=rs.getInt("ID")%>" >수정</a></td>
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
     <form action = "manager_Headquarter_search.jsp" method ="get">
         			<button type="submit">이전 페이지로 돌아가기</button>
         	</form>
         	</div>
</body>
</html>