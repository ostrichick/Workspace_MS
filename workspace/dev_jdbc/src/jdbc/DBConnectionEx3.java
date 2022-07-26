package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBConnectionEx3 {

	public static void main(String[] args) {

		Connection conn = DBConnection.getConnection();
		String sql = "insert into dept values(50,'기획부','전주 덕진구')";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			System.out.println("데이터 입력 성공");
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("데이터 입력 중 예외 발생");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("기타 오류");
		}
	}
}
