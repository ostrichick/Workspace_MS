package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBConnectionEx4 {

	public static void main(String[] args) {

		Connection conn = DBConnection.getConnection();

		// 변수를 통해서 입력값이 세팅될 경우
		// SQL문에서 변수가 들어갈 자리를 ?로 표시함
		// SQL문에 입력될 변수를 임의로 정의
		int dept_id = 60;
		String dept_name = "해외영업부";
		String dept_addr = "전주 완산구";
		String sql = "insert into dept values(?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			// SQL문을 실행하기 전에 SQL문의 ?에 변수를 대입시켜줌
			pstmt.setInt(1, dept_id); // 1: 첫번째?
			pstmt.setString(2, dept_name);
			pstmt.setString(3, dept_addr);

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
