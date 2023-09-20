<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boardStudy.User" %>
<%@ page import="boardStudy.DBConnector" %>
<%@ page import="java.sql.*" %>
<%
	//사용자가 입력한 데이터 가져오기
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//현재 로그인한 유저 정보 가져오기
	User user = (User)session.getAttribute("login");
	
	Connection conn = null;
	PreparedStatement psmt = null;
	DBConnector dbConn = new DBConnector();
	
	try{
		conn = 	dbConn.getConnection();
		
		String sql = "INSERT INTO boardtb(bidx,title,content,uidx)VALUES(BIDX_SEQ.NEXTVAL,?,?,?)";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1,title);
		psmt.setString(2,content);
		psmt.setInt(3,user.getUidx());
		
		psmt.executeUpdate();
		
		response.sendRedirect("list.jsp");
		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		dbConn.connClose();
		if(psmt != null) psmt.close();
	}
%>    





