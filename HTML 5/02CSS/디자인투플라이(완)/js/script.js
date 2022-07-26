window.addEventListener("scroll", function () {
  let scroll_y = document.documentElement.scrollTop;
  //   console.log(scroll_y);
  let header = document.querySelectorAll("header");
  if (scroll_y > 100) {
    header[0].classList.add("scrolled");
  } else {
    header[0].classList.remove("scrolled");
  }
});

// ! 슬라이더
const press = new Swiper("#press .inner", {
  wrapperClass: "slider", // 슬라이드 요소를 감싸는 요소의 클래스
  slideClass: "item", // 공통으로 작성된 슬라이드 요소들의 클래스
  slidesPerView: 5,
  autoplay: {
    // 자동으로 슬라이드.
    delay: 3000, //딜레이 3초
    disableOnInteraction: false, //수동 전환 후에도 다시 자동슬라이드
  },
  speed: 800, //슬라이드가 전환되는 시간
  spaceBetween: 30, // 슬라이드 사이 간격
  pagination: {
    // 페이지 버튼 삽입
    el: ".dot", // 대상 선정
    //   type: "",
    bulletActiveClass: "active", //활성화된 영역에 추가되는 클래스 이름
    clickable: true, //클릭시 해당 페이지 슬라이드 영역으로 이동
  },
});

//

// ! 전체메뉴버튼 열고 닫는 스크립트 (인라인 이벤트)
function menu_show(btn, e) {
  e.preventDefault(); // 태그가 가진 본래의 기능 비활성화

  // let menu = document.querySelector(".menu");
  // let state_menu = menu.classList.contains("show");
  // // let open_menu = document.querySelector(".open_menu");
  // if (state_menu) {
  //   menu.classList.remove("show");
  // } else {
  //   menu.classList.add("show");
  // }

  let menu = document.querySelector(".menu");
  let showState = menu.classList.contains("show");
  menu.classList.toggle("show"); // 있으면 추가, 없으면 지우는 토글기능

  // let open_menu = document.querySelector(".open_menu");
  btn.classList.toggle("show");

  // if (showState) {
  //   menu.classList.remove("show");
  // } else {
  //   menu.classList.add("show");
  // }
  // console.log("클릭");
}

// 브라우저와 문서가 모두 준비되면 호출됨. 스크립트가 문서 맨 아래에 있을 경우 굳이 onload는 필요 없음
window.onload = function () {
  const main_view = new Swiper("#main_view", {
    wrapperClass: "slider", // 슬라이드 요소를 감싸는 요소의 클래스
    slideClass: "view", // 공통으로 작성된 슬라이드 요소들의 클래스
    autoplay: {
      // 자동으로 슬라이드.
      delay: 3000, //딜레이 3초
      disableOnInteraction: false, //수동 전환 후에도 다시 자동슬라이드
    },
    speed: 800, //슬라이드가 전환되는 시간
    spaceBetween: 10, // 슬라이드 사이 간격
    pagination: {
      // 페이지 버튼 삽입
      el: ".pager", // 대상 선정
      //   type: "",
      bulletActiveClass: "active", //활성화된 영역에 추가되는 클래스 이름
      clickable: true, //클릭시 해당 페이지 슬라이드 영역으로 이동
    },
  });

  // ! 전체메뉴버튼 열고 닫는 스크립트 (이벤트리스너)
  /*
  let state_show_old = false;

  var menu = document.querySelector(".menu");
  let state_menu = menu.classList.contains("show");
  let open_menu = document.querySelector(".open_menu");
  open_menu.addEventListener("click", function () {
    if (state_menu) {
      menu.classList.remove("show");
      // state_show = false;
    } else {
      menu.classList.add("show");
      // state_show = true;
    }
  });
  */
  ////전체메뉴

  // ! 검색창 열고닫는 스크립트
  var search = document.getElementById("search");
  var open_search = document.querySelector(".open_search");
  open_search.addEventListener("click", function () {
    search.classList.add("show");
  });
  var close_search = document.querySelector(".close_search");
  close_search.addEventListener("click", function () {
    search.classList.remove("show");
  });
  //// 검색창
  //! esc 눌렀을 때 검색창 닫기 적용
  document.documentElement.addEventListener("keydown", function (e) {
    var state = search.classList.contains("show");
    var esc = e.keyCode; // * keycode는 웹표준이 아님
    var keyName = e.key;
    console.log("키보드를 누름" + esc + " / " + keyName + " / " + state);
    // if (state && esc === 27) {
    //   search.classList.remove("show");
    // }
    if (state && (keyName = "Escape")) {
      search.classList.remove("show");
    }
  });

  // let openSearch = document.querySelectorAll("a.open_search");
  // openSearch[0].addEventListener("click", function () {
  //   let search = document.querySelector("#search");
  //   search.style.visibility = "visible";
  //
  // });
  //

  // let closeButton = document.getElementsByClassName("close_search");
  // closeButton[0].addEventListener("click", function () {
  //   let search = document.querySelector("#search");
  //   search.removeAttribute("class");
  // });
  // function close(obj) {
  //   let search = document.querySelector("#search");
  //   search.removeAttribute("class");
  // }
  //
}; ////end:window.onload
// function show(obj) {
//   let search_onclick = document.querySelector("#search");
//   search_onclick.setAttribute("class", "show");
// }
// let closeButton = document.getElementsByClassName("close_search");
// closeButton[0].addEventListener("click", function () {
//   let search = document.querySelector("#search");
//   search.removeAttribute("class");
// });
// function close(obj) {
//   let search = document.querySelector("#search");
//   search.removeAttribute("class");
// }
