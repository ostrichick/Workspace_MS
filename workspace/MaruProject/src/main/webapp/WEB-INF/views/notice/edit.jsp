<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>공지사항 수정</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.png" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<!--===============================================================================================-->

<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/MagnificPopup/magnific-popup.css">
</head>
<body class="animsition">
  <%@include file="/include/header-wo-style.jsp"%>
  <div class="container" style="margin: 30px auto;">
    <form action="edit_process" method="post" enctype="multipart/form-data">
      <input type="text" name="title" class="form-control mt-4 mb-2" value="${boardVo.title}" required>
      <div class="form-group">
        <textarea id="summernote" name="editordata"></textarea>
        <textarea class="form-control" rows="3" name="content" id="content" required>${boardVo.content}</textarea>
      </div>
      <input type="file" name="uploadFile" class="btn btn-secondary mb-3" />
      <input type="hidden" name="idx" class="form-control mt-4 mb-2" value="${boardVo.idx}">
      <button type="submit" id="btn_submit" class="btn btn-secondary mb-3">수정하기</button>
    </form>
  </div>
  <script>
      $("#summernote").summernote({
        placeholder : "${boardVo.content}",
        tabsize : 2,
        height : 300,
        lang : "ko-KR", // 한글 설정
        toolbar : [
        // [groupName, [list of button]]
        [ 'fontname', [ 'fontname' ] ], [ 'fontsize', [ 'fontsize' ] ], [ 'style', [ 'bold', 'italic', 'underline', 'strikethrough', 'clear' ] ], [ 'color', [ 'forecolor', 'color' ] ], [ 'table', [ 'table' ] ], [ 'para', [ 'ul', 'ol', 'paragraph' ] ], [ 'height', [ 'height' ] ], [ 'insert', [ 'picture', 'link', 'video' ] ], [ 'view', [ 'fullscreen', 'help' ] ] ],
        fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체' ],
        fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72' ]
      });

      $("body").on("keyup", function() {
        let sn_val = $('#summernote').summernote('code');
        $("#content").val(sn_val);
      })
    </script>
  <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/detail.jsp"%>
  <%--   <%@include file="/include/script.jsp"%> --%>
  <!--===============================================================================================-->
  <script src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
  <!--===============================================================================================-->
  <script src="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.js"></script>
  <script>
      $(".js-select2").each(function() {
        $(this).select2({
          minimumResultsForSearch : 20,
          dropdownParent : $(this).next('.dropDownSelect2')
        });
      })
    </script>
  <!--===============================================================================================-->
  <script src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/moment.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.js"></script>
  <!--===============================================================================================-->
  <script src="${pageContext.request.contextPath}/resources/vendor/slick/slick.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/slick-custom.js"></script>
  <!--===============================================================================================-->
  <script src="${pageContext.request.contextPath}/resources/vendor/parallax100/parallax100.js"></script>
  <script>
      $('.parallax100').parallax100();
    </script>
  <!--===============================================================================================-->
  <script src="${pageContext.request.contextPath}/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
  <script>
      $('.gallery-lb').each(function() { // the containers for all your galleries
        $(this).magnificPopup({
          delegate : 'a', // the selector for gallery item
          type : 'image',
          gallery : {
            enabled : true
          },
          mainClass : 'mfp-fade'
        });
      });
    </script>
  <!--===============================================================================================-->
  <script src="${pageContext.request.contextPath}/resources/vendor/isotope/isotope.pkgd.min.js"></script>
  <!--===============================================================================================-->
  <script src="${pageContext.request.contextPath}/resources/vendor/sweetalert/sweetalert.min.js"></script>
  <script>
      $('.js-addwish-b2, .js-addwish-detail').on('click', function(e) {
        e.preventDefault();
      });

      $('.js-addwish-b2').each(function() {
        var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
        $(this).on('click', function() {
          swal(nameProduct, "is added to wishlist !", "success");

          $(this).addClass('js-addedwish-b2');
          $(this).off('click');
        });
      });

      $('.js-addwish-detail').each(function() {
        var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

        $(this).on('click', function() {
          swal(nameProduct, "is added to wishlist !", "success");

          $(this).addClass('js-addedwish-detail');
          $(this).off('click');
        });
      });

      /*---------------------------------------------*/

      $('.js-addcart-detail').each(function() {
        var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
        $(this).on('click', function() {
          swal(nameProduct, "is added to cart !", "success");
        });
      });
    </script>
  <!--===============================================================================================-->
  <script src="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
  <script>
      $('.js-pscroll').each(function() {
        $(this).css('position', 'relative');
        $(this).css('overflow', 'hidden');
        var ps = new PerfectScrollbar(this, {
          wheelSpeed : 1,
          scrollingThreshold : 1000,
          wheelPropagation : false,
        });

        $(window).on('resize', function() {
          ps.update();
        })
      });
    </script>
  <!--===============================================================================================-->
  <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>