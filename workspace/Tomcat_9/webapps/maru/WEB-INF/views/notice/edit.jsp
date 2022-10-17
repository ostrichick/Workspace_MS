<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>공지사항 수정</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="/include/summernote-head.jsp"%>
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.png" />
</head>
<body class="animsition">
  <%@include file="/include/header.jsp"%>
  <div class="container" style="margin: 30px auto;">
    <form action="edit_process" method="post" enctype="multipart/form-data">
      <input type="text" name="title" class="form-control mt-4 mb-2" value="${boardVo.title}" required>
      <div class="form-group">
        <textarea id="summernote" name="content"></textarea>
      </div>
      <input type="hidden" name="idx" class="form-control mt-4 mb-2" value="${boardVo.idx}">
      <div class="text-right">
        <button type="submit" id="btn_submit" class="btn btn-secondary mb-3">수정하기</button>
      </div>
    </form> 
  </div>
  <script>
      $("#summernote").summernote({
        placeholder : 'content',
        tabsize : 2,
        height : 300,
        lang : "ko-KR", // 한글 설정
        toolbar : [
        // [groupName, [list of button]]
        [ 'fontname', [ 'fontname' ] ], [ 'fontsize', [ 'fontsize' ] ], [ 'style', [ 'bold', 'italic', 'underline', 'strikethrough', 'clear' ] ], [ 'color', [ 'forecolor', 'color' ] ], [ 'table', [ 'table' ] ], [ 'para', [ 'ul', 'ol', 'paragraph' ] ], [ 'height', [ 'height' ] ], [ 'insert', [ 'picture', 'link', 'video' ] ], [ 'view', [ 'fullscreen', 'help' ] ] ],
        fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체' ],
        fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72' ],
        callbacks : {
          onImageUpload : function(files, editor, welEditable) {
            // 파일 업로드(다중업로드를 위해 반복문 사용)
            for (var i = files.length - 1; i >= 0; i--) {
              uploadSummernoteImageFile(files[i], this);
            }
          }
        }
      });
      $("#summernote").summernote('code', '${boardVo.content}');

      function uploadSummernoteImageFile(file, el) {
        data = new FormData();
        data.append("file", file);
        $.ajax({
          data : data,
          type : "POST",
          url : "uploadSummernoteImageFile",
          contentType : false,
          enctype : 'multipart/form-data',
          processData : false,
          success : function(data) {
            $(el).summernote('editor.insertImage', data.url);
          }
        });
      }
    </script>
  <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/detail.jsp"%>
  <%@include file="/include/script-wo-jqbs.jsp"%>

</body>
</html>