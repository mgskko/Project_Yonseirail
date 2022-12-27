package yonseirail;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Test{
	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet result = null;
		
		try {
			String jdbcDriver = "jdbc:mariadb://localhost:3306/rail";
			String dbUser = "root";
			String dbPass = "7240";
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.createStatement();
			
			String query = "Select * from trains;";
			String update_query = "update instructor set salary = salary * 1.01 where salary < 70000;";
			
			stmt.executeQuery(update_query);
			result = stmt.executeQuery(query);
			
			while(result.next()) {
				int id = result.getInt("ID");
				String name = result.getString(2);
				String dept_name = result.getString("dept_name");
				int salary = result.getInt(4);
				
				System.out.println(id + "/" + name + "/" + dept_name + "/" +salary);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				result.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}