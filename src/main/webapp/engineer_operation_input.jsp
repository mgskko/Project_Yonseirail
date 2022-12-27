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

Connection conn_engineer = null;
Connection conn_TrainCode = null;
Connection conn_Train = null;

PreparedStatement pstmt_TrainCode = null;
PreparedStatement pstmt_Train = null;

ResultSet rs_TrainCode = null;
ResultSet rs_Train = null;
		// request 객체로부터 파라미터를 가져옴.
		try{
			
			
			String userID = (String) session.getAttribute("userID");
			String userPassword = (String) session.getAttribute("userPassword");
			String userName = (String) session.getAttribute("userName");
			
			String insert_value_rs_TrainCode = "select id from TrainCode ";
			String insert_value_rs_Train = "select id from Train ";
			
			String driver = "org.mariadb.jdbc.Driver";
			Class.forName(driver);
			
			conn_TrainCode = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			conn_Train = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			pstmt_TrainCode = conn_TrainCode.prepareStatement(insert_value_rs_TrainCode);
			pstmt_Train = conn_Train.prepareStatement(insert_value_rs_Train);
			
			rs_TrainCode = pstmt_TrainCode.executeQuery();
			rs_Train = pstmt_Train.executeQuery();
			
				%>
			<div>
		<p>
			환영합니다!
			<%=userID %>님
		</p>
		
	</div>	
<form action = "engineer_operation_input_ok.jsp" method ="get">
<table border="1" bordercolor="blue" width ="500" height="300" align = "center" >
    <tr bgcolor="blue" align ="center">
	<p><td colspan = "3" span style="color:white">operation 입력</td></p>
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
	<td>Status</td>
	<td><input name = "Status" type="text" /></td>
    </tr>
    <tr>
	<td>DeptStatus</td>
	<td><input name = "DeptStatus" type="text"/></td>
    </tr>
    <tr>
	<td>ArvStatus</td>
	<td><input name = "ArvStatus" type="text"/></td>
    </tr>
    <tr>
	<td>UpdateTime</td>
	<td><input name = "UpdateTime" type="text"/></td>
    </tr>
    <tr>
	<td>Engineer_ID</td>
	<td><input name = "Engineer_ID" value="<%= userID%>" readonly/></td>
    </tr>
    <tr>
	<td>TrainCode_ID</td>
	<td>
	<select name="TrainCode_ID">
			<%
			 while(rs_TrainCode.next()){
			%>
	<option><%=rs_TrainCode.getInt(1)%></option>
	<%	} %>
		</select>
	</td>
    </tr>
    <tr>
    <td>Train_ID</td>
	<td>
	<select name="Train_ID">
			<%
			 while(rs_Train.next()){
			%>
	<option><%=rs_Train.getInt(1)%></option>
	<%	} %>
		</select>
	</td>
    </tr>
    <tr >
	<td colspan = "3" style="color:white"><button type="submit">전송</button></td>
    </tr>
    </form>
    <td><form action = "engineer_operation.jsp" method ="get">
         			<button type="submit">이전 페이지로 돌아가기</button>
         	</form></td>
     <td><form action = "engineer.jsp" method ="get">
         			<button type="submit">engineer 페이지로 돌아가기</button>
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
                if(rs_Train != null) rs_Train.close();
                if(rs_TrainCode != null) rs_TrainCode.close();
                if(conn_TrainCode != null) conn_TrainCode.close();
                if(conn_Train != null) conn_Train.close();
                if(pstmt_Train != null) pstmt_Train.close();
                if(pstmt_TrainCode != null) pstmt_TrainCode.close();
            }catch(Exception e2){
                e2.printStackTrace();
            }
        %>
           
            <%	
        }
%>
</body>
</html>




