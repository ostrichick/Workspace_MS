package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnectionEx {

	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String USER = "hr";
	private static final String PW = "1234";

	@SuppressWarnings("unused")
	public static void main(String[] args) {
		Connection conn;
		try {
			Class.forName(DRIVER);
			System.out.println("드라이버 로딩 성공");
			conn = DriverManager.getConnection(URL, USER, PW);
			System.out.println("DB연결 성공");
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
