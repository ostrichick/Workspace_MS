//function to calculate the difference between two dates
function date_diff_indays(date1, date2) {
  //create new date objects from the input dates
  dt1 = new Date(date1);
  dt2 = new Date(date2);
  //calculate the difference in days between the two dates
  return Math.floor((Date.UTC(dt2.getFullYear(), dt2.getMonth(), dt2.getDate()) - Date.UTC(dt1.getFullYear(), dt1.getMonth(), dt1.getDate())) / (1000 * 60 * 60 * 24));
}

//function to print the difference on a HTML page
function print_diff() {
  //get the input dates from the HTML page
  var date1 = document.getElementById("date1").value;
  var date2 = document.getElementById("date2").value;
  //calculate the difference in days using the date_diff_indays function
  var diff = date_diff_indays(date1, date2);
  //display the difference in days on the HTML page
  document.getElementById("result").innerHTML = diff;
}
