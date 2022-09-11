function calculateDaysBetweenDates(begin, end) {
  var beginDate = new Date(begin);
  var endDate = new Date(end);
  var diff = endDate.getTime() - beginDate.getTime();
  var days = diff / (1000 * 60 * 60 * 24);
  return days;
}
//시계를 출력할 수 있는 함수
function printClock() {
  var clock = document.getElementById("clock");
  var now = new Date();
  var hours = now.getHours();
  var minutes = now.getMinutes();
  var seconds = now.getSeconds();
  var ampm = hours >= 12 ? "PM" : "AM";
  hours = hours % 12;
  hours = hours ? hours : 12;
  hours = hours < 10 ? "0" + hours : hours;
  minutes = minutes < 10 ? "0" + minutes : minutes;
  seconds = seconds < 10 ? "0" + seconds : seconds;
  var strTime = hours + ":" + minutes + ":" + seconds + " " + ampm;
  clock.innerHTML = strTime;
}

//가위 바위 보 게임을 위한 함수
function rspGame(yourChoice) {
  var humanChoice, botChoice;
  humanChoice = yourChoice.id;
  botChoice = numberToChoice(randToRspInt());
  results = decideWinner(humanChoice, botChoice);
  message = finalMessage(results);
  rspFrontEnd(yourChoice.id, botChoice, message);
}
