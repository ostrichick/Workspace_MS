<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connector.DBConnector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
</head>
<body>
  <%@include file="/include/header.jsp"%>
  <section>
    <%
    //Connection conn = null;
    //PreparedStatement psmt = null;
    //    ResultSet rs = null;
    String sql = "SELECT MAX(custno) AS last_custno FROM member_tbl_02";
    int last_custno = 0;
    try (Connection conn = DBConnector.getConnection(); PreparedStatement psmt = conn.prepareStatement(sql);) {

    	try (ResultSet rs = psmt.executeQuery();) {
    		while (rs.next()) {
    	last_custno = rs.getInt("last_custno") + 1;
    		}
    	}
    } catch (Exception e) {
    	e.printStackTrace();
    }
    %>
    <h3 style="margin: auto; text-align: center;">홈쇼핑 회원 등록</h3>
    <form id="joinForm" action="join_process.jsp" method="post">
      <table style="margin: auto;">
        <tr>
          <td>회원번호(자동생성)</td>
          <td>
            <input type="text" placeholder="" id="custno" name="custno" value="<%=last_custno%>" readonly />
          </td>
        </tr>
        <tr>
          <td>회원성명</td>
          <td>
            <input type="text" placeholder="이름" id="custname" name="custname" required />
          </td>
        </tr>
        <tr>
          <td>회원전화</td>
          <td>
            <input type="text" placeholder="" name="phone" id="phone" required />
          </td>
        </tr>
        <tr>
          <td>회원주소</td>
          <td>
            <input type="TEXT" placeholder="" name="address" id="address" required />
          </td>
        </tr>
        <tr>
          <td>가입일자</td>
          <td>
            <input type="text" placeholder="" name="joindate" id="joindate" readonly />
          </td>
        </tr>
        <tr>
          <td>고객등급(A:VIP,B:일반,C:직원)</td>
          <td>
            <input type="text" placeholder="" name="grade" id="grade" required />
          </td>
        </tr>
        <tr>
          <td>도시코드</td>
          <td>
            <input type="text" placeholder="" name="city" id="city" required />
          </td>
        </tr>
        <tr>
          <td colspan="2" style="text-align: center">
            <input type="reset" value="등록" onclick="check()">
            <input type="button" value="조회" onclick="location.href='memberlist.jsp'" />
          </td>
        </tr>
      </table>
    </form>
  </section>
  <%@include file="include/footer.jsp"%>
  <script>
      function fillDate() {
        let joindate = document.querySelector("#joindate");
        let date = new Date();
        let today = date.getFullYear();
        today += "";
        today += date.getMonth() + 1;
        today += date.getDate();
        console.log(today);
        joindate.value = today;
      }
      fillDate();

      function check() {
        event.preventDefault();
        let custname = document.querySelector("#custname");
        let phone = document.querySelector("#phone");
        let address = document.querySelector("#address");
        let grade = document.querySelector("#grade");
        let city = document.querySelector("#city");
        console.log(phone.value.length);
        if (custname.value.length < 1) {
          alert("이름을 입력해주세요")
          custname.focus();
        } else if (phone.value.length < 13) {
          alert("전화번호를 입력해주세요")
          phone.focus();
        } else if (address.value.length < 1) {
          alert("주소를 입력해주세요")
          address.focus();
        } else if (grade.value.length < 1) {
          alert("등급 입력해주세요")
          grade.focus();
        } else if (city.value.length < 1) {
          alert("도시를 입력해주세요")
          city.focus();
        } else {
          alert("회원등록이 완료되었습니다!");
          document.querySelector("#joinForm").submit();
        }
      }
    </script>
</body>
</html>