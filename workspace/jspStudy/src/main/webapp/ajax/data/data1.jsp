<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String title = "첫번째 제목";
String content = "첫번재 내용";
String writer = "작성자1";
String wdate = "2022-08-11";
int bidx = 1;

JSONArray jArray = new JSONArray(); // [] 대괄호 역할
JSONObject jObj = new JSONObject(); // 맵 형태로 담음. {} 객체 역할
jObj.put("title", title);
jObj.put("content", content);
jObj.put("writer", writer);
jObj.put("wdate", wdate);
jObj.put("bidx", bidx);
jArray.add(jObj); // [{ "title" : "첫번째 제목", "content" : ....}]
jArray.add(jObj); // [{ },{ }]
response.setContentType("application/json"); // 응답시 json 타입이라는 걸 명시 ( 안해주면 json 타입으로 인식하지 못함 )
%>
<%=jArray.toJSONString()%>