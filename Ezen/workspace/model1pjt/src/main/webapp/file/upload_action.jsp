<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String directory = "C:\\Users\\MYCOM\\Dropbox\\PC\\Music\\221025\\workspace\\model1pjt\\src\\main\\webapp\\upload";
// 경로 지정할 때 역슬러스 두개 \\ 사용하거나 슬러시 한개 / 사용

int sizeLimit = 100 * 1024 * 1024; // 100mb
MultipartRequest multi = new MultipartRequest(request, directory, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());

String param1 = multi.getParameter("param1");
String param2 = multi.getParameter("param2"); // 파라미터 가져올때 request 대신 multi 사용해야함

String realFileName = multi.getFilesystemName("uploadFile"); // 파일을 업로드한 form의 parameter 이름 - 실제 서버상의 파일이름
String originFileName = multi.getOriginalFileName("uploadFile"); // 유저가 업로드할 당시의 원래 파일이름

String realFileName2 = multi.getFilesystemName("uploadFile2");
String originFileName2 = multi.getOriginalFileName("uploadFile2");

String realFileName3 = multi.getFilesystemName("uploadFile3");
String originFileName3 = multi.getOriginalFileName("uploadFile3");
%>
<%=param1%>
<hr /><%=param2%>
<hr /><%=realFileName%>
<hr /><%=originFileName%>