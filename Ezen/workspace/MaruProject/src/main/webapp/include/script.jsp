<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- body 최하단에 삽입되는 각종 js 스크립트 -->
<!--===============================================================================================-->
<%-- <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script> --%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!--===============================================================================================-->
<%-- <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/popper.js"></script> --%>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script> --%>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
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