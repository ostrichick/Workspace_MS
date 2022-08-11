<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax01</title>
</head>
<body>
  <button onclick="callHTML()">html</button>
  <div id="result"></div>
  <script>
      function callHTML() {
        var request = new XMLHttpRequest();

        request.onreadystatechange = function() { // 함수 재정의
          if (request.readyState == 4 && request.status == 200) { // 요청에 응답을 받고, 결과가 성공적일 때 
            document.getElementById("result").innerHTML = request.responseText; //작업 진행 
          }
        }

        request.open("GET", "data/data1.html", false);
        // 연결 방식, 경로, 동기비동기 여부. 응답을 기다릴것인가? false
        request.send(); // 요청 보내기
        //         document.getElementById("result").innerHTML = request.responseText;
      }
    </script>
</body>
</html>