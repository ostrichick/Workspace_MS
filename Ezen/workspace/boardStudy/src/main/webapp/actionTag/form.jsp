<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form</title>
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
    <h2>JSP 액션태그 Beans</h2>
    <form action="parameter.jsp">
      <p>
        name :
        <input type="text" name="name" />
      </p>
      <p>
        id :
        <input type="text" name="id" />
      </p>
      <p>
        password :
        <input type="password" name="password" />
      </p>
      <p>
        addr :
        <input type="text" name="addr" />
      </p>
      <p>
        test :
        <input type="text" name="test" />
      </p>
      <p>
        <input type="submit" />
      </p>
    </form>
  </section>
  <%@include file="/include/footer.jsp"%>
</body>
</html>