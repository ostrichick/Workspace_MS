<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="boardStudy.DBConnector" %>
<%@ page import="boardStudy.User" %>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String addr = request.getParameter("addr");
	String uidxStr = request.getParameter("uidx");
	int uidx = 0;
	if(uidxStr != null){
		uidx = Integer.parseInt(uidxStr);
	}
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	DBConnector dbConnector = new DBConnector();
	
	try{
		conn =dbConnector.getConnection();
		
		String sql = "update usertb set name=?, password=?, addr =? where uidx=?";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setString(2, password);
		psmt.setString(3, addr);
		psmt.setInt(4, uidx);
		
		int result = psmt.executeUpdate();
		
		if(result>0){
			//잘 수정됨
			//세션 수정
			User login = (User)session.getAttribute("login");
			login.setName(name);
			
			session.setAttribute("login",login);
			
			response.sendRedirect(request.getContextPath()+"/login/mypage.jsp");
			
		}else{
			//수정 안됨
			%>
			<script>
				alert("수정에 실패했습니다.");
				location.href = "<%=request.getContextPath()%>/login/mypage.jsp";
			</script>
			<%
		}
	}catch(Exception e){
		
		e.printStackTrace();
		
	}finally{
		dbConnector.connClose();
		if(psmt != null) psmt.close();
	}
%>