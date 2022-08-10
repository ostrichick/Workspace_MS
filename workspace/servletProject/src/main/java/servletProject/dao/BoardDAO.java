package servletProject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import servletProject.dto.Board;
import servletProject.util.DBConnector;
import servletProject.util.PagingUtil;

public class BoardDAO {
	private Connection conn = null;
	private PreparedStatement psmt = null;
	private ResultSet rs = null;

	public ArrayList<Board> list() throws Exception {
		ArrayList<Board> blist = new ArrayList<>();
		DBConnector dbConn = new DBConnector();

		try {
			conn = dbConn.getConnection();

			String sql = "Select * from boardtb";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setBidx(rs.getInt("bidx"));
				board.setTitle(rs.getString("title"));
				board.setWdate(rs.getString("wdate"));
				board.setContent(rs.getString("content"));
				board.setHit(rs.getInt("hit"));
				blist.add(board);
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
		return blist;
	}

	public Board view() throws Exception {
		DBConnector dbConn = new DBConnector();
		Board board = new Board();

		try {
			conn = dbConn.getConnection();
			String sql = "select * from boardtb b inner join usertb u on b.uidx = u.uidx where bidx = ?";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if (rs.next()) {
				board.setBidx(rs.getInt("bidx"));
				board.setTitle(rs.getString("title"));
				board.setWdate(rs.getString("wdate"));
				board.setContent(rs.getString("content"));
				board.setHit(rs.getInt("hit"));
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
		return board;
	}
}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

class BoardDaoBack {
	private Connection conn = null;
	private PreparedStatement psmt = null;
	private ResultSet rs = null;

	public int total() throws Exception {
		int result = 0;
		DBConnector dbConn = new DBConnector();
		try {
			conn = dbConn.getConnection();
			String sql = "select count(*) from boardtb";
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

	public ArrayList<Board> boardList(Board board, PagingUtil pagingUtil) throws Exception {
		DBConnector dbConn = new DBConnector();
		ArrayList<Board> blist = new ArrayList<>();

		try {
			conn = dbConn.getConnection(); // 연결
			String sql = "              SELECT c.* " + "       FROM (SELECT a.*, ROWNUM r "
					+ "		                 from (select * " + "					from boardtb b "
					+ "					inner join usertb u " + "					on b.uidx = u.uidx "
					+ "					ORDER BY b.bidx desc) a " + "				WHERE ROWNUM <= ?) c "
					+ "	WHERE c.r >= ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, pagingUtil.getEnd());
			psmt.setInt(2, pagingUtil.getStart());

			rs = psmt.executeQuery();
			while (rs.next()) {
				Board boardR = new Board();
				boardR.setBidx(rs.getInt("bidx"));
				boardR.setTitle(rs.getString("title"));
				boardR.setName(rs.getString("name"));
				boardR.setWdate(rs.getString("wdate"));
				boardR.setHit(rs.getInt("hit"));
				blist.add(boardR);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbConn.connClose();
			if (psmt != null)
				psmt.close();
			if (rs != null)
				rs.close();
		}
		return blist;
	}

	/*
	 * public ArrayList<Board> boardList(Board board, String searchType, String
	 * searchValue) throws Exception { DBConnector dbConn = new DBConnector();
	 * ArrayList<Board> blist = new ArrayList<>(); //
	 * request.setCharacterEncoding("UTF-8"); // String searchType =
	 * request.getParameter("searchType"); // String searchValue =
	 * request.getParameter("searchValue"); try { conn = dbConn.getConnection(); //
	 * 연결 String sql =
	 * "select * from boardtb b inner join usertb u on b.uidx = u.uidx"; if
	 * (searchType != null) { // null이 아니면 검색할게 존재함 if (searchType.equals("title"))
	 * { // 제목으로 검색할 경우 sql += " where b.title like '%'||?||'%'"; // 맨 앞에 공백을 넣어야
	 * sql에서 붙어져 인식돼는 오류가 안 남 } else if (searchType.equals("writer")) { // 작성자로 검색할
	 * 경우 sql += " where u.name like '%'||?||'%'"; // sql 구문 콘캣기호 ||를 이용해서 문자열을 합쳐야함
	 * } } psmt = conn.prepareStatement(sql); if (searchType != null) {
	 * psmt.setString(1, searchValue); } rs = psmt.executeQuery(); while (rs.next())
	 * { Board boardR = new Board(); boardR.setBidx(rs.getInt("bidx"));
	 * boardR.setTitle(rs.getString("title")); boardR.setName(rs.getString("name"));
	 * boardR.setWdate(rs.getString("wdate")); boardR.setHit(rs.getInt("hit"));
	 * blist.add(boardR); } } catch (Exception e) { e.printStackTrace(); } finally {
	 * dbConn.connClose(); if (psmt != null) psmt.close(); if (rs != null)
	 * rs.close(); } return blist; }
	 */

	public int boardInsert(Board board) throws Exception {
		int result = 0;
		DBConnector dbConn = new DBConnector();
		try {
			conn = dbConn.getConnection();
			String sql = "insert into boardtb(bidx, title, content, uidx) VALUES (bidx_seq.nextval, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, board.getTitle()); // 쿼리문에 ?를 하나씩 채우기
			psmt.setString(2, board.getContent());
			psmt.setInt(3, board.getUidx());
			result = psmt.executeUpdate();
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

	public Board boardView(Board board) throws Exception {
		DBConnector dbConn = new DBConnector();
		try {
			conn = dbConn.getConnection();
			String sql = "UPDATE BOARDTB SET HIT = HIT+1 WHERE BIDX = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, board.getBidx());
			psmt.executeUpdate();
			psmt.close();

			sql = "select * from boardtb b inner join usertb u on b.uidx = u.uidx where bidx=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, board.getBidx());
			rs = psmt.executeQuery();
			if (rs.next()) {
				board.setBidx(rs.getInt("bidx"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setName(rs.getString("name"));
				board.setWdate(rs.getString("wdate"));
				board.setHit(rs.getInt("hit"));
				board.setUidx(rs.getInt("uidx"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbConn.connClose();
			if (psmt != null)
				psmt.close();
			if (rs != null)
				rs.close();
		}
		return board;
	}

	public Board boardModify(Board board) throws Exception {
		DBConnector dbConn = new DBConnector();
		try {
			conn = dbConn.getConnection();
			String sql = "select * from boardtb b inner join usertb u on b.uidx = u.uidx where bidx=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, board.getBidx());
			rs = psmt.executeQuery();
			if (rs.next()) {
				board.setBidx(rs.getInt("bidx"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setName(rs.getString("name"));
				board.setWdate(rs.getString("wdate"));
				board.setHit(rs.getInt("hit"));
				board.setUidx(rs.getInt("uidx"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbConn.connClose();
			if (psmt != null)
				psmt.close();
			if (rs != null)
				rs.close();
		}
		return board;
	}

	public int boardModifyAction(Board board) throws Exception {
		int result = 0;
		DBConnector dbConn = new DBConnector();
		try {
			conn = dbConn.getConnection();
			String sql = "UPDATE BOARDTB SET TITLE=?, CONTENT=? WHERE BIDX=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, board.getTitle());
			psmt.setString(2, board.getContent());
			psmt.setInt(3, board.getBidx());
			result = psmt.executeUpdate();
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

	public int deleteAction(int bidx) {
		int result = 0;
		return result;
	}
}
