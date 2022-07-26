<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%
	request.setCharacterEncoding("UTF-8"); //파라미터 한글 인코딩
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");

	Connection conn = null; //DB 연결 객체
	PreparedStatement psmt = null; //동적 쿼리 실행 객체 
	
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="c##jsptest";
	String pass="1234";
	
	try{
		
		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		conn = DriverManager.getConnection(url,user,pass);
		
		String sql = "insert into usertb(uidx, id ,password, name, addr)values(uidx_seq.nextval,'"+id+"','"+password+"','"+name+"','"+addr+"')";
		System.out.println(sql);
		
		psmt = conn.prepareStatement(sql);
		int result = psmt.executeUpdate();
		
		response.sendRedirect(request.getContextPath());
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null){
			conn.close();
		}
		if(psmt != null){
			psmt.close();
		}
	}



%>