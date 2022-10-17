<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="MaruContextPath" value="${pageContext.request.contextPath}" scope="application" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>상품 등록</title>
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
      <form class="needs-validation" novalidate action="${pageContext.request.contextPath}/product/add_process" method="post" enctype="multipart/form-data">
        <div class="row">
          <div class="col-md-5 col-lg-6 p-b-30 m-l-auto">
            <div class="p-l-25 p-r-30 p-lr-0-lg" style="">
              <img class="img-fluid" src="https://place-hold.it/500x500.png" alt="" />
              <input type="file" class="form-control m-tb-5" name="uploadFile" required />
            </div>
          </div>

          <div class="col-md-6 col-lg-5 p-b-30">
            <div class="p-r-50 p-t-5 p-lr-0-lg">
              <h2 class="mtext-105 cl2 js-name-detail p-b-14 txt-center">상품 등록</h2>
              <div class="input-group m-tb-10">
                <div class="input-group-text">제품명</div>
                <input type="text" class="form-control" name="product_name" placeholder="제품명" required />
              </div>
              <div class="input-group m-tb-10">
                <div class="input-group-text">가격</div>
                <input type="text" class="form-control txt-right" name="product_price" id="product_price" placeholder="가격" maxlength=8 onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required />
                <div class="input-group-text">₩</div>
              </div>

              <div class="input-group m-tb-10">
                <div class="input-group-text">
                  할인여부&nbsp;
                  <input type="checkbox" class="" name="product_sale" id="product_sale" value="Y" />

                </div>
                <input type="text" class="form-control txt-right" name="product_sale_percent" id="product_sale_percent" placeholder="" maxlength=2 onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
                <div class="input-group-text">%</div>
                <div class="input-group-text">할인율</div>
              </div>
              <div class="input-group m-tb-10">
                <div class="input-group-text">할인가</div>
                <input type="text" class="form-control txt-right" name="product_sale_price" id="product_sale_price" placeholder="할인율이 적용 된 가격" maxlength=8 onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
                <div class="input-group-text">₩</div>
              </div>
              <div class="input-group m-tb-10">
                <div class="input-group-text">규격</div>
                <input type="text" class="form-control" name="product_size" placeholder="예시: '800x1500'" />
                <div class="input-group-text">mm</div>
              </div>

              <div class="input-group m-tb-10">
                <div class="input-group-text">분류</div>
                <select id="product_major_category" class="form-control" name="product_major_category">
                  <option value="">선택</option>
                  <option value="livingroom">거실</option>
                  <option value="bedroom">침실</option>
                  <option value="library">서재</option>
                  <option value="kitchen">주방</option>
                  <option value="bathroom">욕실</option>
                  <option value="etcproduct">기타</option>
                </select>
              </div>
            </div>
          </div>
          <div class="m-lr-auto">
            <textarea class="m-t-15" id="summernote" name="product_detail" required></textarea>
            <div class="text-right">
              <button type="submit" id="btn_submit" class="btn btn-secondary m-tb-10" onclick="submitForm()">상품 등록</button>
            </div>
          </div>
        </div>
      </form>
    </div>
  </section>
  <!-- Footer -->
  <script>
      $(function() {
        $("#summernote").summernote({
          placeholder : "내용을 작성해주세요.",
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
  <script>
      /*
       let product_price = document.querySelector("#product_price");
       let product_sale = document.querySelector("product_sale");
       let product_sale_percent = document.querySelector("product_sale_percent");
       let product_sale_price = document.querySelector("sale_price");
       */
      $("#product_price").on("change keyup", function() {
        if ($("#product_sale").is(":checked") && $("#product_sale_percent").val().length > 0) {
          let product_price = $("#product_price").val();
          let product_sale_percent = $("#product_sale_percent").val();
          let product_sale_price = product_price - product_price * product_sale_percent / 100;
          $("#product_sale_price").val(Math.floor(product_sale_price / 100) * 100);
        }
      })

      $("#product_sale_percent").on("change keyup", function() {
        if ($("#product_sale").is(":checked") && $("#product_price").val().length > 0) {
          let product_price = $("#product_price").val();
          let product_sale_percent = $("#product_sale_percent").val();
          let product_sale_price = product_price - product_price * product_sale_percent / 100;
          $("#product_sale_price").val(Math.floor(product_sale_price / 100) * 100);
        }
      })

      $("#product_sale_price").on("change keyup", function() {

        console.log("원래 가격 " + $("#product_price").val());
        console.log("할인 가격 " + $("#product_sale_price").val());
        console.log("원래 가격이 할인 가격보다 높은가? = " + $("#product_price").val() <= $("#product_sale_price").val());
        console.log("원래 가격 length가 할인 가격보다 많은가? = " + $("#product_price").val().length <= $("#product_sale_price").val().length);
        if ($("#product_price").val().length < $("#product_sale_price").val().length) {

          Swal.fire("가격은 할인가보다 낮을 수 없습니다!");
          $("#product_sale_price").val($("#product_sale_price").val().slice(0, -1));
        }

        if ($("#product_sale").is(":checked") && $("#product_price").val().length > 0) {
          let product_price = $("#product_price").val(); // 10000
          let product_sale_price = $("#product_sale_price").val(); // 8000
          let product_sale_percent = (product_price - product_sale_price) / product_price * 100;
          $("#product_sale_percent").val(Math.floor(product_sale_percent * 10) / 10);
        }
      })

      function submitForm() {
        "use strict";

        $("input").each(function(index, item) {
          $(item).val($(item).val().trim())
        })

        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll(".needs-validation");

        // Loop over them and prevent submission
        Array.prototype.slice.call(forms).forEach(function(form) {
          form.addEventListener("submit", function(event) {
            if (!form.checkValidity()) {
              event.preventDefault();
              event.stopPropagation();
            }
            form.classList.add("was-validated");
          }, false);
        });
      }
    </script>
</body>
</html>