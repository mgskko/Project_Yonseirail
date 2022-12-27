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
	Statement stmt = null;
	ResultSet rs = null;
	
		// request 객체로부터 파라미터를 가져옴.
		try{
			int ID = Integer.parseInt(request.getParameter("ID"));
			String Status = request.getParameter("Status");
			String DeptStatus = request.getParameter("DeptStatus");
			String ArvStatus = request.getParameter("ArvStatus");
			String UpdateTime = request.getParameter("UpdateTime");
			String Engineer_ID = request.getParameter("Engineer_ID");
			int TrainCode_ID = Integer.parseInt(request.getParameter("TrainCode_ID"));
			int Train_ID = Integer.parseInt(request.getParameter("Train_ID"));
			
			System.out.println(ID + "<-- sv m_search_list.jsp");
			String insert_value_single = "INSERT INTO operation(ID, Status, DeptStatus,ArvStatus,UpdateTime,Engineer_ID,TrainCode_ID,Train_ID) values(" 
			+ ID + ",'" + Status + "','" + DeptStatus + "','"
			+ ArvStatus + "','" + UpdateTime + "','" + Engineer_ID + "'," 
			+ TrainCode_ID + "," + Train_ID + ");";
			
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
			<form action = "engineer.jsp" method ="get">
			<button type="submit">돌아가기</button>
	</form>
	<%

        } catch(Exception e){
            e.printStackTrace();
            %>
        
		
		
		 <h1>다시dd 입력해</h1>
         <form action = "engineer_operation.jsp" method ="get">
         			<button type="submit">돌아가기</button>
         	</form>
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
	</form>
</body>
</html>