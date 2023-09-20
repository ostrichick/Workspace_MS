window.onload = function () {
  const main_view = new Swiper("#main_view", {
    // Optional parameters
    // direction: "horizontal",
    // loop: false,

    // If we need pagination
    pagination: {
      // 페이지 버튼 삽입
      el: ".pager", // 대상 선정
      //   type: "",
    },
    autoplay: {
      //5초에 한번 자동 슬라이드
      delay: 5000,
      disableOnInteraction: false, // 직접 조작 후 정지되는 설정 끄기
    },
    speed: 800, //움직이는 시간
    spaceBetween: 10,
    // Navigation arrows
    // navigation: {
    //   nextEl: ".swiper-button-next",
    //   prevEl: ".swiper-button-prev",
    // },

    // And if we need scrollbar
    // scrollbar: {
    //   el: ".swiper-scrollbar",
    // },
  });
};
const press = new Swiper("#press .swiper", {});
