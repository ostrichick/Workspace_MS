<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="MaruContextPath" value="${pageContext.request.contextPath}" scope="application" />
<%@include file="/include/style.jsp"%>
<style>
.main-menu>li>a {
  font-size: 120%;
}

.menu-subcategory>li:hover {
  background: #e6e6e6;
}

/* div, ul, li { */
/*   outline: blue solid 1px; */
/* } */
</style>
<!-- Header 
    상단 메뉴바와 css를 담은 style.jsp, 최상단 topbar.jsp를 include함 -->
<c:choose>
  <c:when test="${empty indexHeader}">
    <header class="header-v4">
      <!-- Header desktop -->
      <div class="container-menu-desktop">
        <!-- Topbar -->

        <%--         <%@include file="/include/topbar.jsp"%> --%>

        <div class="wrap-menu-desktop how-shadow1">
          <nav class="limiter-menu-desktop container">
            <!-- Logo desktop -->
            <a href="${MaruContextPath}/#" class="logo"> <img src="${MaruContextPath}/resources/images/icons/logo-01.png" alt="logo" />
            </a>

            <!-- Menu desktop -->
            <div class="menu-desktop">
              <ul class="main-menu">
                <li class="fs-20"><a href="${MaruContextPath}/product/list">전체제품</a></li>
                <li><a href="${MaruContextPath}/product/list?category=livingroom">거실</a></li>
                <li><a href="${MaruContextPath}/product/list?category=bedroom">침실</a></li>
                <li><a href="${MaruContextPath}/product/list?category=library">서재</a></li>
                <li><a href="${MaruContextPath}/product/list?category=kitchen">주방</a></li>
                <li><a href="${MaruContextPath}/product/list?category=bathroom">욕실</a></li>
                <li><a href="${MaruContextPath}/product/list?category=etcproduct">기타</a></li>

                <%--                 <li><a href="${MaruContextPath}/about">임시</a></li> --%>
                <li><a href="${MaruContextPath}/contact">오시는 길</a></li>
              </ul>
            </div>
            <script>
                          const url = new URL(location);
                          const urlParams = url.searchParams;
                          const category = urlParams.get('category');

                          switch (category) {
                          case 'livingroom':
                            document.querySelector("ul.main-menu>li:nth-child(2)").classList.toggle('active-menu');
                            break;
                          case 'bedroom':
                            document.querySelector("ul.main-menu>li:nth-child(3)").classList.toggle('active-menu');
                            break;
                          case 'library':
                            document.querySelector("ul.main-menu>li:nth-child(4)").classList.toggle('active-menu');
                            break;
                          case 'kitchen':
                            document.querySelector("ul.main-menu>li:nth-child(5)").classList.toggle('active-menu');
                            break;
                          case 'bathroom':
                            document.querySelector("ul.main-menu>li:nth-child(6)").classList.toggle('active-menu');
                            break;
                          case 'etcproduct':
                            document.querySelector("ul.main-menu>li:nth-child(7)").classList.toggle('active-menu');
                            break;
                          /* case 'contact':
                            document.querySelector("ul.main-menu>li:nth-child(7)").classList.toggle('active-menu');
                            break; */
                          default:
                            break;
                          }

                          function getLastPath() {
                            var rLastPath = /\/([a-zA-Z0-9._]+)(?:\?.*)?$/;
                            return rLastPath.test(url) && RegExp.$1;
                          }

                          if (getLastPath() === "contact") {
                            document.querySelector("ul.main-menu>li:nth-child(8)").classList.toggle('active-menu');
                          }
                        </script>
            <!-- Icon header -->
            <div class="wrap-icon-header flex-w flex-r-m">
              <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
                <i class="zmdi zmdi-search"></i>
              </div>
              <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-cart" data-notify="0">
                <i class="zmdi zmdi-view-headline"></i>
              </div>
            </div>

          </nav>
        </div>

      </div>

      <!-- Header Mobile -->
      <div class="wrap-header-mobile">
        <!-- Logo moblie -->
        <div class="logo-mobile">
          <a href="${MaruContextPath}/index"><img src="${MaruContextPath}/resources/images/icons/logo-01.png" alt="IMG-LOGO" /></a>
        </div>

        <!-- Icon header -->
        <div class="wrap-icon-header flex-w flex-r-m m-r-15">
          <!--           <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search"> -->
          <!--             <i class="zmdi zmdi-search"></i> -->
          <!--           </div> -->

          <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10  js-show-cart" data-notify="2">
            <i class="zmdi zmdi-shopping-cart"></i>
          </div>


        </div>

        <!-- Button show menu -->
        <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
          <span class="hamburger-box"> <span class="hamburger-inner"></span>
          </span>
        </div>
      </div>

      <!-- Menu Mobile -->
      <div class="menu-mobile">
        <!--         <ul class="topbar-mobile"> -->
        <!--           <li> -->
        <!--             <div class="left-top-bar">Free shipping for standard order over $100</div> -->
        <!--           </li> -->

        <!--           <li> -->
        <!--             <div class="right-top-bar flex-w h-full"> -->
        <%--               <a href="${MaruContextPath}/#" class="flex-c-m p-lr-10 trans-04"> 1:1 문의 </a> <a href="${MaruContextPath}/#" class="flex-c-m p-lr-10 trans-04"> My Account </a> <a href="${MaruContextPath}/#" class="flex-c-m p-lr-10 trans-04"> EN </a> <a href="${MaruContextPath}/#" class="flex-c-m p-lr-10 trans-04"> USD </a> --%>
        <!--             </div> -->
        <!--           </li> -->
        <!--         </ul> -->


        <ul class="main-menu-m bg7">
          <li class="fs-20"><a href="${MaruContextPath}/product/list">전체제품</a></li>
          <li><a href="${MaruContextPath}/product/list?category=livingroom">거실</a></li>
          <li><a href="${MaruContextPath}/product/list?category=bedroom">침실</a></li>
          <li><a href="${MaruContextPath}/product/list?category=library">서재</a></li>
          <li><a href="${MaruContextPath}/product/list?category=kitchen">주방</a></li>
          <li><a href="${MaruContextPath}/product/list?category=bathroom">욕실</a></li>
          <li><a href="${MaruContextPath}/product/list?category=etcproduct">기타</a></li>
          <li><a href="${MaruContextPath}/contact">오시는 길</a></li>
        </ul>
      </div>

      <!-- Modal Search -->
      <div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
        <div class="container-search-header">
          <button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
            <img src="${MaruContextPath}/resources/images/icons/icon-close2.png" alt="CLOSE" />
          </button>

          <form class="wrap-search-header flex-w p-l-15">
            <button class="flex-c-m trans-04">
              <i class="zmdi zmdi-search"></i>
            </button>
            <input class="plh3" type="text" name="search" placeholder="Search..." />
          </form>
        </div>
      </div>
    </header>
  </c:when>
  <c:otherwise>

    <header>
      <!-- Header desktop -->
      <div class="container-menu-desktop">
        <!-- Topbar -->

        <%--         <%@include file="/include/topbar.jsp"%> --%>

        <div class="wrap-menu-desktop">
          <nav class="limiter-menu-desktop container">
            <!-- Logo desktop -->
            <a href="${MaruContextPath}/#" class="logo"> <img src="${MaruContextPath}/resources/images/icons/logo-01.png" alt="IMG-LOGO" />
            </a>

            <!-- Menu desktop -->
            <div class="menu-desktop">
              <ul class="main-menu">
                <li class="fs-20"><a href="${MaruContextPath}/product/list">전체제품</a></li>
                <li><a href="${MaruContextPath}/product/list?category=livingroom">거실</a></li>
                <li><a href="${MaruContextPath}/product/list?category=bedroom">침실</a></li>
                <li><a href="${MaruContextPath}/product/list?category=library">서재</a></li>
                <li><a href="${MaruContextPath}/product/list?category=kitchen">주방</a></li>
                <li><a href="${MaruContextPath}/product/list?category=bathroom">욕실</a></li>
                <li><a href="${MaruContextPath}/product/list?category=etcproduct">기타</a></li>
                <li><a href="${MaruContextPath}/contact">오시는 길</a></li>
              </ul>

            </div>

            <!-- Icon header -->
            <div class="wrap-icon-header flex-w flex-r-m">
              <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
                <i class="zmdi zmdi-search"></i>
              </div>
              <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-cart" data-notify="0">
                <i class="zmdi zmdi-view-headline"></i>
              </div>
            </div>

          </nav>
        </div>
      </div>

      <!-- Header Mobile -->
      <div class="wrap-header-mobile">
        <!-- Logo moblie -->
        <div class="logo-mobile">
          <a href="${MaruContextPath}/index"><img src="${MaruContextPath}/resources/images/icons/logo-01.png" alt="IMG-LOGO" /></a>
        </div>

        <!-- Icon header -->
        <div class="wrap-icon-header flex-w flex-r-m m-r-15">
          <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
            <i class="zmdi zmdi-search"></i>
          </div>

          <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="2">
            <i class="zmdi zmdi-shopping-cart"></i>
          </div>

          <a href="${MaruContextPath}/#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="0"> <i class="zmdi zmdi-favorite-outline"></i>
          </a>
        </div>

        <!-- Button show menu -->
        <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
          <span class="hamburger-box"> <span class="hamburger-inner"></span>
          </span>
        </div>
      </div>

      <!-- Menu Mobile -->
      <div class="menu-mobile">
        <ul class="topbar-mobile">
          <li>
            <div class="left-top-bar">Free shipping for standard order over $100</div>
          </li>

          <li>
            <div class="right-top-bar flex-w h-full">
              <a href="${MaruContextPath}/#" class="flex-c-m p-lr-10 trans-04"> 1:1 문의 </a> <a href="${MaruContextPath}/#" class="flex-c-m p-lr-10 trans-04"> My Account </a> <a href="${MaruContextPath}/#" class="flex-c-m p-lr-10 trans-04"> EN </a> <a href="${MaruContextPath}/#" class="flex-c-m p-lr-10 trans-04"> USD </a>
            </div>
          </li>
        </ul>

        <ul class="main-menu-m">
          <li class="fs-20"><a href="${MaruContextPath}/product/list">전체제품</a></li>
          <li><a href="${MaruContextPath}/product/list?category=livingroom">거실</a></li>
          <li><a href="${MaruContextPath}/product/list?category=bedroom">침실</a></li>
          <li><a href="${MaruContextPath}/product/list?category=library">서재</a></li>
          <li><a href="${MaruContextPath}/product/list?category=kitchen">주방</a></li>
          <li><a href="${MaruContextPath}/product/list?category=bathroom">욕실</a></li>
          <li><a href="${MaruContextPath}/product/list?category=etcproduct">기타</a></li>
          <li><a href="${MaruContextPath}/contact">오시는 길</a></li>
        </ul>
      </div>

      <!-- Modal Search -->
      <div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
        <div class="container-search-header">
          <button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
            <img src="${MaruContextPath}/resources/images/icons/icon-close2.png" alt="CLOSE" />
          </button>

          <form class="wrap-search-header flex-w p-l-15">
            <button class="flex-c-m trans-04">
              <i class="zmdi zmdi-search"></i>
            </button>
            <input class="plh3" type="text" name="search" placeholder="Search..." />
          </form>
        </div>
      </div>
    </header>
  </c:otherwise>
</c:choose>


<!-- Cart 기능을 메뉴바로 변경 -->
<div class="wrap-header-cart js-panel-cart">
  <div class="s-full js-hide-cart"></div>

  <div id="cart-opacity-body" class="header-cart flex-col-l p-l-65 p-r-25" style="background: rgba(255, 255, 255, 0.3)">
    <div class="header-cart-title flex-w flex-sb-m p-b-8">
      <span class="mtext-103 cl2"> 메뉴 </span>

      <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
        <i class="zmdi zmdi-close"></i>
      </div>
    </div>

    <div class="wrap-menu-category w-full txt-center">
      <ul class="">
        <c:choose>
          <c:when test="${not empty sessionScope.member_id }">
            <li class="m-tb-20 bg7 p-t-10 txt-center cl7">${member_name }님,환영합니다.
              <ul class="bg6 menu-subcategory">
                <li class="m-tb-5 p-tb-10 txt-center bg6"><a href="${MaruContextPath}/member/myinfo" class="flex-c-m trans-04 p-lr-25 cl2">내 정보</a></li>
                <li class="m-tb-5 p-tb-10 txt-center bg6"><a href="${MaruContextPath}/member/signout" class="flex-c-m trans-04 p-lr-25 cl2">로그아웃</a></li>
              </ul>
            </li>
          </c:when>
          <c:otherwise>
            <li class="m-tb-20 bg7 p-t-10 txt-center cl7">로그인/회원가입
              <ul class="bg6 menu-subcategory">
                <li class="m-tb-5 p-tb-10 txt-center bg6"><a href="${MaruContextPath}/member/signin" class="flex-c-m trans-04 p-lr-25 cl2">로그인</a></li>
                <li class="m-tb-5 p-tb-10 txt-center bg6"><a href="${MaruContextPath}/member/signup" class="flex-c-m trans-04 p-lr-25 cl2">회원가입</a></li>
              </ul>
            </li>
          </c:otherwise>
        </c:choose>

        <c:if test="${sessionScope.member_admin eq 'Y' }">
          <li class="m-tb-20 bg7 p-t-10 txt-center cl7">관리자 전용
            <ul class="bg6 menu-subcategory">
              <li class="m-tb-5 p-tb-10 txt-center bg6"><a href="${MaruContextPath}/admin/dashboard" class="flex-c-m trans-04 p-lr-25 cl2"> 관리자페이지</a></li>
              <li class="m-tb-5 p-tb-10 txt-center bg6"><a href="${MaruContextPath}/product/add" class="flex-c-m trans-04 p-lr-25 cl2"> 상품등록</a></li>
            </ul>
          </li>
        </c:if>

        <c:if test="${not empty sessionScope.member_id}">
          <li class="m-tb-20 p-tb-10 bg7"><a href="${MaruContextPath}/member/myinfo" class="flex-c-m trans-04 p-lr-25 cl7">마이페이지</a></li>
          <li class="m-tb-20 p-tb-10 bg7 cl7"><a href="${MaruContextPath}/cart/" class="flex-c-m trans-04 p-lr-25  cl7" data-label1="hot">장바구니</a></li>
        </c:if>

        <li class="m-tb-20 p-t-10 bg7 cl7">고객센터
          <ul class="bg6 menu-subcategory">
            <li class="m-tb-5 p-tb-10 bg6"><a href="${MaruContextPath}/notice/list" class="flex-c-m trans-04 p-lr-25 cl2">공지사항</a></li>
            <%--             <li class="m-tb-5 p-tb-10 bg6 cl2"><a href="${MaruContextPath}/faq" class="flex-c-m trans-04 p-lr-25 cl2">자주 묻는 질문(FAQ)</a></li> --%>
            <li class="m-tb-5 p-tb-10 bg6 cl2"><a href="${MaruContextPath}/qna/write" class="flex-c-m trans-04 p-lr-25 cl2">이메일 문의</a></li>
          </ul>
        </li>
      </ul>

    </div>
  </div>
</div>
