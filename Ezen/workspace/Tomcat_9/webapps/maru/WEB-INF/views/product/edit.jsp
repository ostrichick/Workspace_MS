<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="MaruContextPath" value="${pageContext.request.contextPath}" scope="application" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>상품 정보 수정</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="/include/summernote-head.jsp"%>

<link rel="icon" type="image/png" href="${MaruContextPath}/resources/images/icons/favicon.png" />
</head>
<body class="animsition">
  <%@include file="/include/header.jsp"%>
  <!-- 상품 상세 -->
  <section class="sec-product-detail bg0 p-t-65 p-b-60">
    <div class="container">
      <form action="${pageContext.request.contextPath}/product/edit_process" method="post" enctype="multipart/form-data">
        <div class="row">
          <div class="col-md-5 col-lg-6 p-b-30 m-l-auto">
            <div class="p-l-25 p-r-30 p-lr-0-lg" style="">
              <img class="img-fluid" src="https://place-hold.it/500x500.png" alt="" />
              <input type="file" class="form-control m-tb-5" name="uploadFile" required />
            </div>
          </div>

          <div class="col-md-6 col-lg-5 p-b-30">
            <div class="p-r-50 p-t-5 p-lr-0-lg">
              <h2 class="mtext-105 cl2 js-name-detail p-b-14">
                <input type="text" class="form-control" name="product_name" placeholder="제품명" value="${product.product_name}" />
              </h2>
              <div class="input-group">
                <input type="number" class="form-control txt-right" name="product_price" id="price" placeholder="가격" value="${product.product_price}" />
                <div class="input-group-text">₩</div>
              </div>

              <div class="input-group m-tb-10">
                <div class="input-group-text">
                  <input type="checkbox" class="" name="product_sale" id="product_sale" value="Y" />
                </div>
                <input type="number" class="form-control txt-right" name="product_sale_percent" id="product_sale_percent" placeholder="왼쪽 할인여부 체크 후 여기에 할인율 입력" value="${product.product_sale_percent}" />
                <div class="input-group-text">%</div>
              </div>
              (1~99 사이의 숫자만 가능하도록 정규식 추가)
              <div class="input-group">
                <input type="number" class="form-control txt-right" name="sale_price" id="sale_price" placeholder="할인율이 적용 된 가격" readonly />
                <div class="input-group-text">₩</div>
              </div>
              (입력한 가격과 할인율에 따라 할인된 가격이 계산되는 스크립트 추가, 100원단위 반올림)
              <p class="stext-102 cl3 p-t-23">
                규격
                <input type="text" class="form-control" name="product_size" placeholder="예시: '800x1500'" value="${product.product_size}" />
              </p>
              <p class="stext-102 cl3 p-t-23">
                분류
                <select id="product_major_category" class="form-control" name="product_major_category">
                  <option value="">분류 선택</option>
                  <option value="livingroom">거실</option>
                  <option value="bedroom">침실</option>
                  <option value="library">서재</option>
                  <option value="kitchen">주방</option>
                  <option value="bathroom">욕실</option>
                  <option value="etcproduct">기타</option>
                </select>
              </p>
            </div>
          </div>
          <div class="m-lr-auto">
            <textarea class="m-t-15" id="summernote" name="product_detail"></textarea>
            <div class="text-right">
              <button type="submit" id="btn_submit" class="btn btn-secondary m-tb-10">상품 정보 수정</button>
            </div>
          </div>
        </div>
        <input type="hidden" name="product_idx" value="${product.product_idx}"/>
      </form>
    </div>
  </section>
  <!-- Footer -->
  <script>
      $(function() {
        $("#summernote").summernote({
          placeholder : "${product.product_detail}",
          tabsize : 2,
          height : 300,
          lang : "ko-KR", // 한글 설정
          toolbar : [
          // [groupName, [list of button]]
          [ "fontname", [ "fontname" ] ], [ "fontsize", [ "fontsize" ] ], [ "style", [ "bold", "italic", "underline", "strikethrough", "clear" ] ], [ "color", [ "forecolor", "color" ] ], [ "table", [ "table" ] ], [ "para", [ "ul", "ol", "paragraph" ] ], [ "height", [ "height" ] ], [ "insert", [ "picture", "link", "video" ] ], [ "view", [ "fullscreen", "help" ] ], ],
          fontNames : [ "Arial", "Arial Black", "Comic Sans MS", "Courier New", "맑은 고딕", "궁서", "굴림체", "굴림", "돋움체", "바탕체" ],
          fontSizes : [ "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "28", "30", "36", "50", "72" ],
          callbacks : {
            onImageUpload : function(files, editor, welEditable) {
              // 파일 업로드(다중업로드를 위해 반복문 사용)
              for (var i = files.length - 1; i >= 0; i--) {
                uploadSummernoteImageFile(files[i], this);
              }
            },
          },
        });
        function uploadSummernoteImageFile(file, el) {
          data = new FormData();
          data.append("file", file);
          $.ajax({
            data : data,
            type : "POST",
            url : "uploadSummernoteImageFile",
            contentType : false,
            enctype : "multipart/form-data",
            processData : false,
            success : function(data) {
              $(el).summernote("editor.insertImage", data.url);
            },
          });
        }
      })
    </script>
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/detail.jsp"%>
  <%@include file="/include/script-wo-jqbs.jsp"%>
</body>
</html>