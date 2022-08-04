package ezen.spring.member;

import java.sql.Connection;
import java.sql.PreparedStatement;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;

@Component
public class Join {
	Connection conn; // dataSource.getConnection();
	PreparedStatement psmt;

	@GetMapping("join")
	public void join(String member_id, String member_pw, String member_name, String member_handphone,
			String member_gender) {
		try {
			String sql = "INSERT INTO member_tbl VALUES (member_sq.NEXTVAL, ?, ?, ?, ?, ?, default, DEFAULT, default)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, member_id);
			psmt.setString(2, member_pw);
			psmt.setString(3, member_name);
			psmt.setString(4, member_handphone);
			psmt.setString(5, member_gender);
			int result = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
			psmt.close();
		}
	}
}
