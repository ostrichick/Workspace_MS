package servletProject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import servletProject.dto.User;
import servletProject.util.DBConnector;
import servletProject.util.PagingUtil;

public class UserDAO {
//관심사별로 클래스 생성, 기능별로 메소드 생성. DB접속 관련 작업만 
	private Connection conn = null;
	private PreparedStatement psmt = null;
	private ResultSet rs = null;

	public int total() throws Exception {
		int result = 0;
		DBConnector dbConn = new DBConnector();
		try {
			conn = dbConn.getConnection();
			String sql = "select count(*) from usertb";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1); // 결과값 중 1번재 컬럼 값 가져오기
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbConn.connClose();
			if (psmt != null) {
				psmt.close();
			}
		}
		return result;

	}

	public int insertUser(User user) throws Exception {
		int result = 0;
		DBConnector dbConn = new DBConnector();
		try {
			conn = dbConn.getConnection();
			String sql = "insert into usertb(uidx, id, name, password, addr) values (uidx_seq.nextval, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user.getId());
			psmt.setString(2, user.getName());
			psmt.setString(3, user.getPassword());
			psmt.setString(4, user.getAddr());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			result = 0;
			e.printStackTrace();
		} finally {
			dbConn.connClose();
			if (psmt != null) {
				psmt.close();
			}
		}
		return result;
	}

	public User loginAction(User user) throws Exception {
		DBConnector dbConn = new DBConnector();
		User result = null;
		try {
			conn = dbConn.getConnection();
			String sql = "select * from usertb where id = ? and password = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user.getId());
			psmt.setString(2, user.getPassword());
			rs = psmt.executeQuery();
			if (rs.next()) {
				result = new User();
				result.setId(rs.getString("id"));
				result.setName(rs.getString("name"));
				result.setUidx(rs.getInt("uidx"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbConn.connClose();
			if (psmt != null) {
				psmt.close();
			}
			if (rs != null) {
				rs.close();
			}
		}
		return result;
	}

	public ArrayList<User> userList(PagingUtil pagingUtil) throws Exception {
		DBConnector dbConn = new DBConnector();
		ArrayList<User> ulist = new ArrayList<>();
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT c.* " + "	FROM (SELECT a.*, ROWNUM r " + "		from (select * from usertb u "
					+ "					ORDER BY u.uidx ) a " + "				WHERE ROWNUM <= ?) c "
					+ "	WHERE c.r >= ? ";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, pagingUtil.getEnd());
			psmt.setInt(2, pagingUtil.getStart());
			rs = psmt.executeQuery();
			while (rs.next()) {
				User userRs = new User();
				userRs.setId(rs.getString("id"));
				userRs.setName(rs.getString("name"));
				userRs.setUidx(rs.getInt("uidx"));
				userRs.setAddr(rs.getString("addr"));
				ulist.add(userRs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbConn.connClose();
			if (psmt != null) {
				psmt.close();
			}
			if (rs != null) {
				rs.close();
			}
		}
		return ulist;
	}
}
