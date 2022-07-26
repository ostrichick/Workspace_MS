// 웹브라우저에서 모든 요소가 준비되면 실행
window.onload = function () {
  // .open 버튼을 클릭하면 사라진다 (display:none;)
  // .btn_search 영역 너비(width) 값이 180px가 되어야함

  //   p[0].onclick = function () {
  //     this.style.display = "none";
  //   };
  let open_Btn = document.querySelector(".btn_search .open");
  open_Btn.addEventListener("click", function () {
    this.style.display = "none";
    this.parentElement.style.width = "180px";
    // let util = document.querySelector("#util");
    // util.style.right = "232px";
    document.getElementById("util").style.right = "232px";
  });

  // 내가 작성
  //   var state_open = false; // 기본적으로 닫힌상태
  //   let updown = document.querySelector("#updown");
  //   updown.addEventListener("click", function () {
  //     if (state_open) {
  //       document.getElementById("main_prom").style.height = "0px";
  //       updown.src = "images/btn_prom_down.png";
  //       state_open = false; //열려있으면 실행 후 닫음
  //     } else {
  //       document.getElementById("main_prom").style.height = "658px";
  //       updown.src = "images/btn_prom_up.png";
  //       state_open = true; // 닫혀있으면 else를 실행 후 열음
  //     }
  //   });

  // 카피
  let state_open = false;
  const prom = document.getElementById("main_prom");
  const prom_btn = document.querySelector("#notice .right a");
  const prom_img = document.querySelector("#notice .right img");

  prom_btn.addEventListener("click", function (e) {
    e.preventDefault();
    if (state_open) {
      prom.style.height = "0";
      //   prom_img.src = "images/btn_prom_down.png";
      prom_img.style.transform = "rotate(0deg)";
      state_open = false;
    } else {
      prom.style.height = "658px";
      prom_img.style.transform = "rotate(180deg)";
      state_open = true;
    }
  });
};
// util 왼쪽 232px = 415
// ! window.onload = function()

window.addEventListener("scroll", function () {
  scrollToGiveClass("#bean");
  scrollToGiveClass("#reserve");
  scrollToGiveClass("#favorite");
  scrollToGiveClass("#magazine");
  scrollToGiveClass("#store");
  // var window_h = this.outerHeight;
  // var doc = document.documentElement; // 문서 객체를 만든다
  // var scroll_y = doc.scrollTop; // 위에서부터 떨어진 거리를 측정한다
  // var target = document.querySelector("#bean"); // DOM 객체 생성 (target)
  // var target_y = target.offsetTop; // 위에서 부터 떨어진 거리를 측정
  // console.log(`스크롤 된 위치: ${scroll_y}, 대상의 위치 ${target_y}, 화면 높이: ${window_h}`);
  // if (scroll_y + window_h / 2 > target_y) {
  //   target.classList.add("active"); // target이라는 DOM(#bean)에 #active 클래스 추가
  //   // console.log("클래스 추가 완료");
  // } else {
  //   target.classList.remove("active"); // 클래스 제거
  //   // console.log("클래스 제거 완료");
  // }
});
function scrollToGiveClass(selector, classText = "active") {
  const window_h = this.outerHeight;
  const doc = document.documentElement;
  const scroll_y = doc.scrollTop;
  const target = document.querySelector(selector); // DOM 객체 생성 (target)
  const target_y = target.offsetTop;
  console.log(`스크롤 된 위치: ${scroll_y}, 대상의 위치 ${target_y}, 화면 높이: ${window_h}`);
  if (scroll_y + window_h / 2 > target_y) {
    // 화면의 절반만 오면 작동하게끔 window_h를 2로 나눔
    target.classList.add(classText);
  } else {
    target.classList.remove(classText);
  }
}
