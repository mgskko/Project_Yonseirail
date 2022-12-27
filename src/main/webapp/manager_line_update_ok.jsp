<%@ page import="java.sql.*" %>
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
<%	request.setCharacterEncoding("UTF-8");
	String dbName = "rail";
	String jdbcDriver = "jdbc:mariadb://localhost:3306/" + dbName;
	String dbUser = "root";
	String dbPass = "7240";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
		// request 객체로부터 파라미터를 가져옴.
		try{
			int ID = Integer.parseInt(request.getParameter("ID"));
			String Name = request.getParameter("Name");
			int BuiltYear = Integer.parseInt(request.getParameter("BuiltYear"));
			int Capacity = Integer.parseInt(request.getParameter("Capacity"));
			
			String sql = "UPDATE Line SET Name = '" + Name + "', BuiltYear= " + BuiltYear + ", Capacity= " + Capacity + " WHERE ID = " + ID + "";
			
					
			String driver = "org.mariadb.jdbc.Driver";
			Class.forName(driver);
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			%>
			<h1>성공</h1>
			<p>
			성공적으로 데이터베이스 <%=dbName%>에 등록하였습니다.
			</p>
			수행한 SQL Statement :
			<%=sql %>
			<form action = "manager.jsp" method ="get">
			<button type="submit">처음으로 이동</button>
	</form>
	<form action = "manager_line_update.jsp" method ="get">
         			<button type="submit">이전 페이지로 이동</button>
         	</form>
	<%

        } catch(Exception e){
            e.printStackTrace();
            %>
        <div align="center">
		<h1>다시 입력해주세요!</h1>
         <form action = "manager_line_update.jsp" method ="get">
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
            }catch(Exception e2){
                e2.printStackTrace();
            }
        %>
           
            <%	
        }
%>
</body>
</html>