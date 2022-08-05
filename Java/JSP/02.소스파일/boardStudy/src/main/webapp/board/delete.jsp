<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="boardStudy.DBConnector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		1.파라미터 bidx 얻어오기
		2.DB연결
		3.delete sql 실행
		4.list.jsp 리다이렉트
	*/
	//1.파라미터 bidx 얻어오기
	String bidxStr = request.getParameter("bidx");
	int bidx =0;
	if(bidxStr != null){
		bidx = Integer.parseInt(bidxStr);
	}
	
	//2.DB연결 
	Connection conn = null;
	PreparedStatement psmt = null;
	
	DBConnector dbConn = new DBConnector();
	
	try{
		conn = dbConn.getConnection();
		
		//3.delete sql 실행
		String sql = "delete from boardtb where bidx=?";
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1,bidx);
		psmt.executeUpdate();
		
		//4.list.jsp 리다이렉트
		response.sendRedirect("list.jsp");
		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		dbConn.connClose();
		if(psmt != null) psmt.close();
	}
%>





