package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnectionEx2 {

	public static void main(String[] args) {
		// DB 작업을 하려면
		// 1. 연결 객체가 필요함 (Connection)
		// -- JDBC 드라이버가 로딩된 후 DriverManager 클래스의 getConnection() 메소드로 생성
		Connection conn = DBConnection.getConnection();

		// 2. SQL작업을 할 수 있는 Statement 객체가 필요함(일반적으로 PreparedStatement 객체 사용)
		// -- Connection 객체에서 prepareStatement() 메소드를 통해서 얻음

		String sql = "select employee_id, first_name from employees";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			// 3. PreparedStatement 객체를 실행시킴 & 실행결과에 대한 처리
			// executeQuery() : select문에 사용
			// executeUpdate() : insert,update,delete문에 사용
			// SQL문의 실행결과를 ResultSet객체가 CB로부터 받아서 저장
			ResultSet rs = pstmt.executeQuery();
			// ResultSet객체가 가진 메소드 next()를 반복문을 이용해서 데이터에 접근
			while (rs.next()) {
				System.out.println("사번: " + rs.getInt("employee_id") + ", 이름: " + rs.getString(2));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 오류");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("기타 오류");
		}
	}
}
