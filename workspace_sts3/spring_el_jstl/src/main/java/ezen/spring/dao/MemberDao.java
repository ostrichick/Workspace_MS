package ezen.spring.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;

import ezen.spring.vo.MemberVo;

@Repository // 클래스를 만들때마다 항상 무슨 어노테이션 붙일지 생각, 서블릿컨텍스트xml에 등록
public class MemberDao {
	private DriverManagerDataSource dataSource; // db연결객체
	private HttpServletRequest request;

	@Autowired(required = false)
	public MemberDao(DriverManagerDataSource dataSource) {
		this.dataSource = dataSource;
	}

	public String connectionTest() {
		Connection conn;
		try {
			conn = dataSource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

		}
		String result = "연결 성공";
		return result;
	}

	public int join(MemberVo memberVo) throws SQLException {
		int result = 1;
		Connection conn = null;
		PreparedStatement pstmt = null;
//		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			String sql = "INSERT INTO member_tbl VALUES (member_sq.NEXTVAL, ?, ?, ?, ?, ?, default, DEFAULT, default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVo.getMember_id());
			pstmt.setString(2, memberVo.getMember_pw());
			pstmt.setString(3, memberVo.getMember_name());
			pstmt.setString(4, memberVo.getMember_handphone());
			pstmt.setString(5, memberVo.getMember_gender());
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		} finally {
			conn.close();
			pstmt.close();
//			rs.close();
		}
		return result;
	}

	public int login(String member_id, String member_pw) throws SQLException {
		int result = 1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			String sql = "select * from member_tbl where member_id=? and member_pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			pstmt.setString(2, member_pw);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				MemberVo memberVo = new MemberVo();
				memberVo.setMember_idx(rs.getInt("member_idx"));
				memberVo.setMember_id(rs.getString("member_id"));
				memberVo.setMember_name(rs.getString("member_name"));

				HttpSession session = request.getSession();
				session.setAttribute("login", memberVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		} finally {
			conn.close();
			pstmt.close();
//			rs.close();
		}
		return result;
	}

}
