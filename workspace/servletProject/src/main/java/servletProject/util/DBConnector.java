package servletProject.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnector { // 디비와 통신할때 반복적으로 사용하는 명령어를 담은 클래스
	public static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	public static String dbName = "c##jsptest";
	public static String dbPass = "1234";
	public Connection conn = null; // 인스턴스 멤버여야 객체를 여러개 생성되도 각각 연결을 만들수있음. (스태틱 X)

	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver"); // ojdbc.jar 중 이 드라이버를 사용할 것이라 지정
		conn = DriverManager.getConnection(url, dbName, dbPass); // 실제로 연결하여 객체 반환
		return conn;
	}

	public void connClose() throws Exception {
		if (conn != null)
			conn.close();
	}
}