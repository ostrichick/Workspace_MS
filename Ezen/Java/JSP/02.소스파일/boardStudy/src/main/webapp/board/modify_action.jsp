<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="boardStudy.DBConnector" %>
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String bidxStr = request.getParameter("bidx");
	int bidx = 0;
	if(bidxStr != null){
		bidx = Integer.parseInt(bidxStr);
	}
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	DBConnector dbConn = new DBConnector();
	
	try{
		
		conn = dbConn.getConnection();
		
		String sql = "UPDATE BOARDTB SET title = ?, content=? WHERE bidx=?";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, title);
		psmt.setString(2, content);
		psmt.setInt(3, bidx);
		
		psmt.executeUpdate();
		
		response.sendRedirect("view.jsp?bidx="+bidx);
		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		dbConn.connClose();
		if(psmt != null) psmt.close();
		if(rs != null) rs.close();
	}
	
	
	
	
	
	
	
	
	
	
	


%>