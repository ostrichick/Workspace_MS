package model1pjt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model1pjt.dto.User;
import model1pjt.util.DBConnector;

public class UserDAO {

	private Connection conn= null;
	private PreparedStatement psmt = null;
	private ResultSet rs = null;
	
	public int insertUser(User user) throws Exception {
		int result = 0;
		DBConnector dbConn = new DBConnector();
		try {
			
			conn = dbConn.getConnection();
			
			String sql = "insert into usertb(uidx,id,name,password,addr)"
					   + "values(uidx_seq.nextval,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user.getId());
			psmt.setString(2, user.getName());
			psmt.setString(3, user.getPassword());
			psmt.setString(4, user.getAddr());
			
			result = psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbConn.connClose();
			if(psmt != null) psmt.close();
		}
		
		return result;
	}
	
	public User selectByLogin(User user) throws Exception {
		User result = null;
		
		DBConnector dbConn = new DBConnector();
		try {
			conn = dbConn.getConnection();
			
			String sql = "select * from usertb where id=? and password=?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user.getId());
			psmt.setString(2, user.getPassword());
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = new User();
				result.setId(rs.getString("id"));
				result.setName(rs.getString("name"));
				result.setUidx(rs.getInt("uidx"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbConn.connClose();
			if(psmt != null) psmt.close();
			if(rs != null) rs.close();
		}
		
		
		return result;
	}
	
	
}
