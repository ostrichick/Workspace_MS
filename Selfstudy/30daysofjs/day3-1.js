// Declare firstName, lastName, country, city, age, isMarried, year variable and assign value to it and use the typeof operator to check different data types.
let firstName = "FN",
  lastName = "LN",
  country = "North Korea",
  city = "Pyongyang",
  age = 82,
  isMarried = false,
  year = 2022;
console.log(typeof firstName);
console.log(typeof lastName);
console.log(typeof country);
console.log(typeof city);
console.log(typeof age);
console.log(typeof isMarried);
console.log(typeof year);

// Check if type of '10' is equal to 10

// Check if parseInt('9.8') is equal to 10

// Boolean value is either true or false.

// Write three JavaScript statement which provide truthy value.
console.log(3 > 0);
// Write three JavaScript statement which provide falsy value.
console.log("d" == null);
// Figure out the result of the following comparison expression first without using console.log(). After you decide the result confirm it using console.log()
let booleanList = [4 > 3, 4 >= 3, 4 < 3, 4 <= 3, 4 == 4, 4 === 4, 4 != 4, 4 !== 4, 4 != "4", 4 == "4", 4 === "4"];
console.log(booleanList);

// Find the length of python and jargon and make a falsy comparison statement.
let py = "python";
let jg = "jargon";
console.log(py.length === jg.length);
// Figure out the result of the following expressions first without using console.log(). After you decide the result confirm it by using console.log()

// 4 > 3 && 10 < 12 // T && T == T
// 4 > 3 && 10 > 12
// 4 > 3 || 10 < 12
// 4 > 3 || 10 > 12
// !(4 > 3)
// !(4 < 3)
// !(false)
// !(4 > 3 && 10 < 12)
// !(4 > 3 && 10 > 12)
// !(4 === '4')
// There is no 'on' in both dragon and python
// Use the Date object to do the following activities

const today = new Date();
// What is the year today?
console.log(today.getFullYear());
// What is the month today as a number?
console.log(today.getMonth());
// What is the date today?
console.log(today.getDate());
// What is the day today as a number?
console.log(today.getDay());
// What is the hours now?
console.log(today.getHours());
// What is the minutes now?
console.log(today.getMinutes());
// Find out the numbers of seconds elapsed from January 1, 1970 to now.
console.log(today.getTime());
