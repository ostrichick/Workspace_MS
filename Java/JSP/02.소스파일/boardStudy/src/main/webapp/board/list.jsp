<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="boardStudy.DBConnector" %>
<%@ page import="boardStudy.Board" %>
<%@ page import="java.util.ArrayList" %>      
<%
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	DBConnector dbConn = new DBConnector();
	
	ArrayList<Board> blist = new ArrayList<>();
	
	try{
		
		conn = dbConn.getConnection();
		
		String sql = "select * from boardtb b inner join usertb u on b.uidx = u.uidx";
		
		psmt = conn.prepareStatement(sql);
		
		rs = psmt.executeQuery();
		
		while(rs.next()){
			Board board = new Board();
			board.setBidx(rs.getInt("bidx"));
			board.setTitle(rs.getString("title"));
			board.setName(rs.getString("name"));
			board.setWdate(rs.getString("wdate"));
			
			blist.add(board);
		}
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		dbConn.connClose();
		if(psmt != null) psmt.close();
		if(rs != null) rs.close();
	}
	

%> 
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
		for(Board temp : blist){
	%>
			<tr>
				<td><%=temp.getBidx() %></td>
				<td><%=temp.getTitle() %></td>
				<td><%=temp.getName() %></td>
				<td><%=temp.getWdate() %></td>
			</tr>
   <%
		}
   %>
		</table>
		<button onclick="location.href='insert.jsp'">등록</button>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>