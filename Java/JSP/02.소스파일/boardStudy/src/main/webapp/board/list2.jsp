<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="boardStudy.DBConnector" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/header.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/footer.css" rel="stylesheet" type="text/css">
<style>
	section{
		height:400px;
	} 
</style> 
</head>
<body>
	<%@ include file="/include/header.jsp" %>
	<section>
		<h2>게시글 목록 페이지 입니다.</h2>
		
		<table border="1" width="400"> 
			<tr>
				<th width="50">글번호</th>
				<th>제목</th>
				<th width="80">작성자</th>
				<th width="80">작성일</th>
			</tr>
<%
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	DBConnector dbConn = new DBConnector();
	
	try{
		
		conn = dbConn.getConnection();
		
		String sql = "select * from boardtb b inner join usertb u on b.uidx = u.uidx";
		
		psmt = conn.prepareStatement(sql);
		
		rs = psmt.executeQuery();
		
		while(rs.next()){
	%>		
			<tr>
				<td><%=rs.getInt("bidx") %></td>
				<td><%=rs.getString("title") %></td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getString("wdate") %></td>
			</tr>
<%		
		}
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		dbConn.connClose();
		if(psmt != null) psmt.close();
		if(rs != null) rs.close();
	}
	

%>    
		</table>
		<button onclick="location.href='insert.jsp'">등록</button>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>