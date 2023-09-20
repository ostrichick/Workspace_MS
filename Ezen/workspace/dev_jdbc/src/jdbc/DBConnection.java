package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String USER = "hr";
	private static final String PW = "1234";
	static {
		try {
			Class.forName(DRIVER);
			System.out.println("드라이버 로딩 성공");
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public static Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, USER, PW);
		} catch (SQLException e) {
			System.out.println("DB 연결 중 예외 발생");
		}
		System.out.println("DB 연결 성공");
		return conn;
	}
}