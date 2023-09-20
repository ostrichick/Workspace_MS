package boardStudy;

import java.sql.*;

public class DBConnector {
	
	public static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	public static String name = "c##jsptest";
	public static String password = "1234";
	public Connection conn = null;
	
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,name,password);
		
		return conn;
	}
	
	public void connClose() throws Exception {
		if(conn != null) conn.close();
	}
	
	
}
