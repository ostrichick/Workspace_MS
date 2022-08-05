<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="boardStudy.DBConnector" %>
<%@ page import="boardStudy.Board" %>    
<%
	String bidxStr = request.getParameter("bidx");
	int bidx =0;
	if(bidxStr != null){
		bidx =Integer.parseInt(bidxStr);
	}
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	Board board = new Board();
	
	DBConnector dbConn = new DBConnector();
	try{
		
		conn = dbConn.getConnection();
		
		String sql = "select * from boardtb b inner join usertb u on b.uidx=u.uidx where b.bidx=?";
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1,bidx);
		
		rs = psmt.executeQuery();
		
		if(rs.next()){
			board.setBidx(rs.getInt("bidx"));
			board.setTitle(rs.getString("title"));
			board.setContent(rs.getString("content"));
			board.setName(rs.getString("name"));
			board.setWdate(rs.getString("wdate"));
			board.setHit(rs.getInt("hit"));
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
		<h2>게시글 수정 페이지입니다.</h2>
		<form action="modify_action.jsp" method="post">
		<input type="hidden" name="bidx" value="<%=board.getBidx()%>">
			<table border="1" width="500">
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" value="<%= board.getTitle() %>" size="30"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%= board.getName() %></td>
				</tr>
				<tr>
					<th>작성일</th>
					<td><%= board.getWdate() %></td>
				</tr>
				<tr>
					<th>조회수</th>
					<td><%= board.getHit() %></td>
				</tr>
				<tr height="80">
					<th>내용</th>
					<td><textarea rows="8" cols="40" name="content"><%= board.getContent() %></textarea></td>
				</tr>
			</table>
			<button>저장</button>
		</form>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>