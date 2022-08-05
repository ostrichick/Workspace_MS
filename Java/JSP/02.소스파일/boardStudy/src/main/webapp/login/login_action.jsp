<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>   
<%@ page import="boardStudy.User" %> 
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	try{
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String dbname = "c##jsptest";
		String dbpass = "1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,dbname,dbpass);
		
		String sql = "select * from usertb where id=? and password=?";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1,id); //'test'
		psmt.setString(2,password);
		
		rs = psmt.executeQuery();
		
		if(rs.next()){ //rs.next()가 true이면 데이터가 존재한다.
			//데이터 존재
			User user = new User(); //session에 담길 loginUser 객체
			//때문에 세션에서 가지고 있으면 안되는 정보는 객체 필드에 채우지 않는다.
			user.setId(rs.getString("id"));
			user.setName(rs.getString("name"));
			user.setUidx(rs.getInt("uidx"));
			
			session.setAttribute("login",user);
			
			response.sendRedirect(request.getContextPath());
		}else{
			//데이터 존재 X
		%>
			<script>
				alert("아이디/비밀번호가 틀렸습니다.");
				location.href= "<%=request.getContextPath()%>/login/login.jsp";
			</script>
		<%
		
		}
		
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null){
			conn.close();
		}
		if(psmt != null){
			psmt.close();
		}
		if(rs != null){
			rs.close();
		}
	}
%>