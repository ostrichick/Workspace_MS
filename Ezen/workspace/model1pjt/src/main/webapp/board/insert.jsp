<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <form action="insert_action.jsp" method="post">
    <table border="2" style="border-collapse: collapse; margin: auto; width: 600px;">
      <tr>
        <th>제목</th>
        <td>
          <input type="text" name="title" />
        </td>
      </tr>
      <tr>
        <th>내용</th>
        <td>
          <textarea name="content" id="" cols="30" rows="10"></textarea>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="submit" value="글쓰기" />
        </td>
      </tr>
    </table>
  </form>
</body>
</html>