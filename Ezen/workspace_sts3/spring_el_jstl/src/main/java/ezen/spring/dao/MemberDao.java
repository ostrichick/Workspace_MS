package ezen.spring.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;

import ezen.spring.vo.MemberVo;

@Repository // 클래스를 만들때마다 항상 무슨 어노테이션 붙일지 생각, 서블릿컨텍스트xml에 등록
public class MemberDao {
	private DriverManagerDataSource dataSource; // db연결객체

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
		}
		return result;
	}

	public Map<String, String> loginProcess(String member_id, String member_pw) { // 따라한 예제
		Map<String, String> resultMap = null; // null이면 로그인 실패
		try {
			Connection conn = dataSource.getConnection();
			String sql = "select * from member_tbl where member_id=? and member_pw=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			pstmt.setString(2, member_pw);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				resultMap = new HashMap<String, String>();
				resultMap.put("member_name", rs.getString("member_name"));
				resultMap.put("member_grade", rs.getString("member_grade"));
				System.out.println("DAO : " + resultMap.get("member_name"));
				System.out.println("DAO : " + resultMap.get("member_grade"));
			}
			conn.close();
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return resultMap;
	}

//	public int loginProcess(String member_id, String member_pw) throws SQLException {
//		int result = 0; // 0:로그인 실패
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			conn = dataSource.getConnection();
//			String sql = "select count(*) from member_tbl where member_id=? and member_pw=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, member_id);
//			pstmt.setString(2, member_pw);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				result = 1; // 로그인 성공
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			conn.close();
//			pstmt.close();
//			rs.close();
//		}
//		return result;
//	}

	public MemberVo myPage(String member_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVo memberVo = new MemberVo();
		try {
			conn = dataSource.getConnection();
			String sql = "select * from member_tbl where member_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				memberVo.setMember_idx(rs.getInt("member_idx"));
				memberVo.setMember_id(rs.getString("member_id"));
				memberVo.setMember_name(rs.getString("member_name"));
				memberVo.setMember_handphone(rs.getString("member_handphone"));
				memberVo.setMember_gender(rs.getString("member_gender"));
				memberVo.setMember_grade(rs.getInt("member_grade"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
			pstmt.close();
			rs.close();
		}
		return memberVo;
	}

	public MemberVo edit(String member_id, String member_pw) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVo memberVo = new MemberVo();
		try {
			conn = dataSource.getConnection();
			String sql = "select * from member_tbl where member_id=? and member_pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			pstmt.setString(2, member_pw);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				memberVo.setMember_idx(rs.getInt("member_idx"));
				memberVo.setMember_id(rs.getString("member_id"));
				memberVo.setMember_name(rs.getString("member_name"));
				memberVo.setMember_handphone(rs.getString("member_handphone"));
				memberVo.setMember_gender(rs.getString("member_gender"));
				memberVo.setMember_grade(rs.getInt("member_grade"));
			}
		} catch (

		Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
			pstmt.close();
			rs.close();
		}
		return memberVo;
	}

	public int editProcess(String member_id, String member_pw, String member_name, String member_handphone)
			throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;

		System.out.println(member_id);
		System.out.println(member_pw);
		System.out.println(member_name);
		System.out.println(member_handphone);

		try {
			conn = dataSource.getConnection();
			String sql = "UPDATE member_tbl SET member_pw = ?, member_name = ?, member_handphone = ? WHERE member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_pw);
			pstmt.setString(2, member_name);
			pstmt.setString(3, member_handphone);
			pstmt.setString(4, member_id);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
			pstmt.close();
		}
		return result;
	}

	public int deactivate(String member_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			conn = dataSource.getConnection();
			String sql = "UPDATE member_tbl SET del_yn = 'Y' WHERE member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
			pstmt.close();
		}
		return result;
	}

	public ArrayList<MemberVo> admin() throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MemberVo> mList = new ArrayList<>();
		try {
			conn = dataSource.getConnection();
			String sql = "select * from member_tbl";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVo memberVo = new MemberVo();
				memberVo.setMember_idx(rs.getInt("member_idx"));
				memberVo.setMember_id(rs.getString("member_id"));
				memberVo.setMember_name(rs.getString("member_name"));
				memberVo.setMember_handphone(rs.getString("member_handphone"));
				memberVo.setMember_gender(rs.getString("member_gender"));
				memberVo.setMember_grade(rs.getInt("member_grade"));
				memberVo.setDel_yn(rs.getString("del_yn"));
				mList.add(memberVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (rs != null) {
				rs.close();
			}
		}
		return mList;
	}

	public int delMember(String member_idx) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			conn = dataSource.getConnection();
			String sql = "delete from member_tbl WHERE member_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_idx);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
		}
		return result;
	}

}
