package boardStudy;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnector { // 디비와 통신할때 반복적으로 사용하는 명령어를 담은 클래스
	public static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	public static String dbName = "c##jsptest";
	public static String dbPass = "1234";
	public Connection conn = null;

	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, dbName, dbPass);
		return conn;
	}

	public void connClose() throws Exception {
		if (conn != null)
			conn.close();
	}
}