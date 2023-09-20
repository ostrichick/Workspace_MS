<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="boardStudy.User" %>
<!-- 
	사용자가 입력한 비밀번호가 현재 로그인한 user의 비밀번호가 아니라면
	"비밀번호가 일치 하지 않습니다." 경고창 출력 후 index.jsp로 리다이렉트 시키세요.
	
	1.전달받은 파라미터 password 찾아오기
	2.로그인한 user 객체 찾아오기
	3. DB에서 로그인한 user객체의 uidx 값과 사용자가 입력한 password를 가진 user가 
	   존재하는지 조회
	4.존재한다면 상세데이터 출력
	5.존재하지 않는 다면 index.jsp로 리다이렉트

 --> 
 <%
 	String password = request.getParameter("password"); //사용자가 입력한값

 	User login =(User)session.getAttribute("login");
 	
 	Connection conn = null;
 	PreparedStatement psmt = null;
 	ResultSet rs = null;
 	
 	User user = new User();
 	
 	try{
 		
 		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbName = "c##jsptest";
		String dbPass = "1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,dbName,dbPass);
		
		String sql = "select * from usertb where uidx=? and password=?";
		
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, login.getUidx());
		psmt.setString(2, password);
		
		rs = psmt.executeQuery();
		
		if(rs.next()){
			//사용자가 입력한 비밀번호 일치
			user.setId(rs.getString("id"));
			user.setName(rs.getString("name"));
			user.setPassword(rs.getString("password"));
			user.setAddr(rs.getString("addr"));
			user.setUidx(rs.getInt("uidx"));
			
		}else{
			//사용자가 입력한 비밀번호 불일치
			%>
			<script>
				alert("입력한 비밀번호가 일치하지 않습니다.");
				location.href="<%=request.getContextPath()%>";
			</script>	
			<%
		}
		
 		
 	}catch(Exception e){
 		e.printStackTrace();
 	}finally{
 		if(conn != null) conn.close();
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
	<%@include file="/include/header.jsp" %>
	<section>
		<h2>회원정보 수정페이지 입니다.</h2>
		<form action="modify_action.jsp" method="post">
			<input type="hidden" name="uidx" value="<%=user.getUidx()%>">
			<table>
				<tr>
					<th align="right">아이디 : </th>
					<td><%= user.getName() %></td>
				</tr>
				<tr>
					<th align="right">이름 : </th>
					<td><input type="text" name="name" value="<%=user.getName()%>"></td>
				</tr>
				<tr>
					<th align="right">비밀번호 : </th>
					<td><input type="password" name="password" value="<%=user.getPassword()%>"></td>
				</tr>
				<tr>
					<th align="right">주소 : </th>
					<td><input type="text" name="addr" value="<%=user.getAddr()%>"></td>
				</tr>
				<!-- 
					위에서 조회된 데이터를 사용자가 수정할 수 있도록 입력양식의 값으로 출력
				 -->
			</table>
			<button>저장</button>
		</form>
	</section>
	<%@include file="/include/footer.jsp" %>
</body>
</html>