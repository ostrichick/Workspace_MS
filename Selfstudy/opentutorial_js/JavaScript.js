//function to calculate the difference between dates
function date_diff_indays(date1, date2) {
  dt1 = new Date(date1);
  dt2 = new Date(date2);
  return Math.floor((Date.UTC(dt2.getFullYear(), dt2.getMonth(), dt2.getDate()) - Date.UTC(dt1.getFullYear(), dt1.getMonth(), dt1.getDate())) / (1000 * 60 * 60 * 24));
}

//function to print the difference on a HTML page
function print_diff() {
  var date1 = document.getElementById("date1").value;
  var date2 = document.getElementById("date2").value;
  var diff = date_diff_indays(date1, date2);
  document.getElementById("result").innerHTML = diff;
}
