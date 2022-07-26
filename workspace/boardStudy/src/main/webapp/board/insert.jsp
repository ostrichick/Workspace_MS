<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ page import="boardStudy.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css" />
<style>
section {
  height: 500px;
}
</style>
</head>
<body>
  <%@include file="/include/header.jsp"%>
  <section>
    <form action="insert_action.jsp" method="post">
      <table border="1" >
        <tr>
          <th align="right">제목</th>
          <td>
            <input type="text" name="title" size="50" />
          </td>
        </tr>
        <tr>
          <th align="right">내용</th>
          <td>
            <textarea name="content" id="" cols="50" rows="10"></textarea>
          </td>
        </tr>
      </table>
      <input type="submit" value="저장" />
    </form>
  </section>
  <%@include file="/include/footer.jsp"%>
</body>
</html>