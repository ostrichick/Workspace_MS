<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax02</title>
<script src="jquery-3.6.0.min.js"></script>
</head>
<body>
  <button onclick="callHTML()">html</button>
  <button onclick="callJSON()">json1</button>
  <button onclick="callJSON2()">json2</button>
  <button onclick="callXML()">xml</button>
  <button onclick="callXML2()">xml2</button>
  <button onclick="callJSP()">jsp</button>
  <hr />
  <div id="result"></div>
</body>
<script>
  function callHTML() {
    $.ajax({
      url : "data/data1.html",
      type : "get", // 기본값, get은 생략가능, post일때는 사용
      success : function(data) {
        $("#result").html(data);
      },
      error : function() {
        alert("ajax 통신 실패")
      }
    });
  }
  function callJSON() {
    $.ajax({
      url : "data/data1.json",
      success : function(data) {
        var html = "";
        for (var i = 0; i < data.length; i++) {
          html += "책 제목 : " + data[i].name + "<br>";
          html += "출판사 : " + data[i].publisher + "<br>";
          html += "저자 : " + data[i].author + "<br>";
          html += "가격 : " + data[i].price + "<br>";
        }
        $("#result").html(html);
      },
      error : function() {
        alert("ajax 통신 실패")
      }
    });
  }
  function callJSON2() {
    $.ajax({
      url : "data/data2.json",
      success : function(data) {
        var html = "<table border='2' style='border-collapse:collapse;'>";
        html += "<tr><th>제목</th><th>작성자</th><th>작성일</th></tr>";
        for (var i = 0; i < data.length; i++) {
          html += "<tr><td>" + data[i].title + "</td>";
          //           html += "<td>" + data[i].content + "</td>";
          html += "<td>" + data[i].writer + "</td>";
          html += "<td>" + data[i].wdate + "</td></tr>";
        }
        html += "</table>"
        $("#result").html(html);
      },
      error : function() {
        alert("ajax 통신 실패")
      }
    });
  }
  function callXML() {
    $.ajax({
      url : "data/data1.xml",
      success : function(data) {
        var jQueryData = $(data); // 응답 받은 xml 데이터를 jQuery객체로 변환. jQuery 문법 사용 가능
        var books = jQueryData.find("book");
        var html = "";
        books.each(function() {
          var name = $(this).find("name").text(); // 각 book에 하나씩 반복적으로 접근, 안에 name의 text를 변수에 저장
          var publisher = $(this).find("publisher").text();
          var author = $(this).find("author").text();
          var price = $(this).find("price").text();

          html += "책 이름 : " + name + "<br>";
          html += "책 이름 : " + publisher + "<br>";
          html += "책 이름 : " + author + "<br>";
          html += "책 이름 : " + price + "<hr>";
        });
        $("#result").html(html);
      },
      error : function() {
        alert("ajax 통신 실패")
      }
    });
  }
  function callXML2() {
    $.ajax({
      url : "data/data2.xml",
      success : function(data) {
        var jQueryData = $(data);
        var boards = jQueryData.find("board");
        var html = "<table border='2' style='border-collapse:collapse;'>";
        html += "<tr><th>제목</th><th>작성자</th><th>작성일</th></tr>";
        boards.each(function() {
          var title = $(this).find("title").text();
          var content = $(this).find("content").text();
          var writer = $(this).find("writer").text();
          var wdate = $(this).find("wdate").text();

          html += "<tr><td>" + title + "</td>";
          html += "<td>" + writer + "</td>";
          html += "<td>" + wdate + "</td></tr>";
        });
        html += "</table>";
        $("#result").html(html);
      },
      error : function() {
        alert("ajax 통신 실패")
      }
    });
  }
  function callJSP() {
    $.ajax({
      url : "data/data1.jsp",
      success : function(data) {
        console.log(data);
        console.log(data.result);
        //         var jQData = $(data);
        //         console.log(JQData);
        var html = "<table border='2' style='border-collapse:collapse;'>";
        html += "<tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th></tr>";
        for (var i = 0; i < data.length; i++) {
          html += "<tr>"
          html += "<td>" + data[i].bidx + "</td>";
          html += "<td>" + data[i].title + "</td>";
          //           html += "<td>" + data[i].content + "</td>";
          html += "<td>" + data[i].writer + "</td>";
          html += "<td>" + data[i].wdate + "</td></tr>";
        }
        html += "</table>"
        $("#result").html(html);
      },
      error : function() {
        alert("ajax 통신 실패")
      }
    });
  }
</script>
</html>