<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
header {
  min-height: 20vh;
  background: blue;
  position: relative;
}

header, footer {
  background: blue;
  color: white;
}

nav {
  background: skyblue;
  position: absolute;
  bottom: 0;
  width: 100%;
}

nav li {
  display: inline-block;
  margin-left: 20px;
}

section {
  height: 50vh;
  min-height: 600px;
  background: lightgrey;
}

footer {
  min-height: 5vh;
  text-align: center;
}
</style>


</head>
<body>
  <header>
    <h1>쇼핑몰 회원관리</h1>
    <nav>
      <ul>
        <li><a href="join.jsp">회원등록</a></li>
        <li><a href="memberlist.jsp">회원목록조회</a></li>
        <li><a href="sales.jsp">회원매출조회</a></li>
        <li><a href="home.jsp">홈으로</a></li>
      </ul>
    </nav>
  </header>