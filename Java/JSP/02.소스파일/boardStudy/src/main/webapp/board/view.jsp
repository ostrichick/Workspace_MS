<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="boardStudy.Board" %>
<%@ page import="boardStudy.DBConnector" %>    
<%
	String bidxStr = request.getParameter("bidx");
	int bidx = 0;
	if(bidxStr != null){
		bidx = Integer.parseInt(bidxStr);
	}
	
	User login = (User)session.getAttribute("login");
	if(login == null){
		login = new User();
	}
	
	int loginUidx = login.getUidx();
	
	DBConnector dbConn = new DBConnector();
	
	Connection conn = null;
	PreparedStatement psmt = null;
	PreparedStatement psmt2 = null;
	ResultSet rs = null;
	
	Board board = new Board();
	try{
		
		conn = dbConn.getConnection();
		
		//조회수 증가 
		String sqlHit = "update boardtb set hit = hit+1 where bidx=?";
		psmt2 = conn.prepareStatement(sqlHit);
		psmt2.setInt(1,bidx);
		psmt2.executeUpdate();
		
		
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
			board.setUidx(rs.getInt("uidx"));
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		dbConn.connClose();
		if(psmt!= null) psmt.close();
		if(psmt2!= null) psmt2.close();
		if(rs!= null) rs.close();
		
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
		<h2>게시글 상세 페이지입니다.</h2>
		<table border="1" width="500">
			<tr>
				<th>제목</th>
				<td><%= board.getTitle() %></td>
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
				<td><%= board.getContent() %></td>
			</tr>
		</table>
		<% if(loginUidx == board.getUidx()){ %>
		<button onclick="location.href='modify.jsp?bidx=<%=board.getBidx()%>'">수정</button>
		<button onclick="deleteFn()">삭제</button>
		<form name="delFrm" action="delete.jsp" method="post">
			<input type="hidden" name="bidx" value="<%=board.getBidx() %>">
		</form>
		<%} %>
	</section>
	<%@ include file="/include/footer.jsp" %>
	<script>
		function deleteFn(){
			document.delFrm.submit();
		}
	</script>
</body>
</html>



