const clockTitle = document.querySelector(".js-clock");

// let dbtn_day = dbtn / 60 / 60 / 24;
// console.log(dbtn_day);
// let dbtn_hour = dbtn % dbtn_day;
// console.log(dbtn_hour);
clock();
function clock() {
  let xmas = new Date("2022-12-25");
  let today = new Date();
  let dbtn = (xmas - today) / 1000;

  let dbtn_tsec = dbtn;
  let dbtn_tmin = dbtn_tsec / 60;
  let dbtn_thour = dbtn_tmin / 60;
  let dbtn_day = dbtn_thour / 24;

  let dbtn_hour = (dbtn_day - Math.floor(dbtn_day)) * 24;
  let dbtn_min = (dbtn_hour - Math.floor(dbtn_hour)) * 60;
  let dbtn_sec = (dbtn_min - Math.floor(dbtn_min)) * 60;
  clockTitle.innerHTML = `${Math.floor(dbtn_day)}일 
  ${Math.floor(dbtn_hour)}시간 
  ${Math.floor(dbtn_min)}분 
  ${Math.floor(dbtn_sec)}초`;
}
setInterval(clock, 1000);
