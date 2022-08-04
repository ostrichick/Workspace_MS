// <⚠️ DONT DELETE THIS ⚠️>
// import "./styles.css";
const colors = ["#1abc9c", "#3498db", "#9b59b6", "#f39c12", "#e74c3c"];
// <⚠️ /DONT DELETE THIS ⚠️>

/*
✅ The text of the title should change when the mouse is on top of it.
✅ The text of the title should change when the mouse is leaves it.
✅ When the window is resized the title should change.
✅ On right click the title should also change.
✅ The colors of the title should come from a color from the colors array.
✅ DO NOT CHANGE .css, or .html files.
✅ ALL function handlers should be INSIDE of "superEventHandler"
    마우스가 title위로 올라가면 텍스트가 변경되어야 합니다.
    마우스가 title을 벗어나면 텍스트가 변경되어야 합니다.
    브라우저 창의 사이즈가 변하면 title이 바뀌어야 합니다.
    마우스를 우 클릭하면 title이 바뀌어야 합니다.
    title의 색상은 colors 배열에 있는 색을 사용해야 합니다.
    .css 와 .html 파일은 수정하지 마세요.
    모든 함수 핸들러는 superEventHandler내부에 작성해야 합니다.
    모든 조건이 충족되지 못하면 ❌를 받습니다.

*/
const superEventHandler = {
  textColorChanger(text, colorNum) {
    h2Text.innerText = text;
    h2Text.style.color = colors[colorNum];
  },
  mouseEnter: function () {
    h2Text.innerText = "The mouse is here!";
    h2Text.style.color = colors[0];
  },
  mouseLeave: function () {
    h2Text.innerText = "The mouse is gone!";
    h2Text.style.color = colors[1];
  },
  reSize: function () {
    h2Text.innerText = "You just resized!";
    h2Text.style.color = colors[2];
  },
  rClick: function () {
    h2Text.innerText = "That was a right click!";
    h2Text.style.color = colors[3];
  },
};
const h2Text = document.querySelector("h2");
h2Text.addEventListener("mouseenter", superEventHandler.mouseEnter);
h2Text.addEventListener("mouseleave", superEventHandler.mouseLeave);
window.addEventListener("resize", superEventHandler.reSize);
window.addEventListener("contextmenu", superEventHandler.rClick);
// h2Text.addEventListener("mouseenter", enter);
// h2Text.addEventListener("mouseleave", leave);
// window.addEventListener("resize", resize);
// window.addEventListener("contextmenu", rclick);

// function enter() {
//   h2Text.innerText = "The mouse is here!";
//   h2Text.style.color = colors[0];
// }
// function leave() {
//   h2Text.innerText = "The mouse is gone!";
//   h2Text.style.color = colors[1];
// }
// function resize() {
//   h2Text.innerText = "You just resized!";
//   h2Text.style.color = colors[2];
// }
// function rclick() {
//   h2Text.innerText = "That was a right click!";
//   h2Text.style.color = colors[3];
// }
