// Write a script that prompt the user to enter base and height of the triangle and calculate an area of a triangle (area = 0.5 x b x h).
let base = prompt("밑변의 길이 입력");
let height = prompt("높이 입력");
console.log(`삼각형의 넓이는 ${(base * height) / 2}입니다`);
// Enter base: 20
// Enter height: 10
// The area of the triangle is 100

// Write a script that prompt the user to enter side a, side b, and side c of the triangle and and calculate the perimeter of triangle (perimeter = a + b + c)

// Enter side a: 5
// Enter side b: 4
// Enter side c: 3
// The perimeter of the triangle is 12
let sideA = prompt("A 변의 길이");
let sideB = prompt("B 변의 길이");
let sideC = prompt("C 변의 길이");
console.log(`삼각형의 둘레는 ${sideA + sideB + sideC}입니다`);

// Get length and width using prompt and calculate an area of rectangle (area = length x width and the perimeter of rectangle (perimeter = 2 x (length + width))
let baseRec = prompt("밑변의 길이 입력");
let heightRec = prompt("높이 입력");
console.log(`사각형의 넓이는 ${baseRec * heightRec}입니다`);
console.log(`사각형의 넓이는 ${(baseRec + heightRec) * 2}입니다`);

// Get radius using prompt and calculate the area of a circle (area = pi x r x r) and circumference of a circle(c = 2 x pi x r) where pi = 3.14.
let rCircle = prompt("원의 지름");
console.log(`원의 넓이는 ${Math.PI * rCircle * rCircle}입니다`);
console.log(`원의 지름은 ${Math.PI * rCircle * 2}입니다`);

// Calculate the slope, x-intercept and y-intercept of y = 2x -2

// Slope is m = (y2-y1)/(x2-x1). Find the slope between point (2, 2) and point(6,10)

// Compare the slope of above two questions.

// Calculate the value of y (y = x2 + 6x + 9). Try to use different x values and figure out at what x value y is 0.

// x*x + 6x + 9 = 0
// x + 9/x = -6
// x = -3

// Writ a script that prompt a user to enter hours and rate per hour. Calculate pay of the person?

// Enter hours: 40
// Enter rate per hour: 28
// Your weekly earning is 1120
let hours = prompt("일주일에 일 하는 시간");
let rph = prompt("시급");
console.log(`한 주에 ${hours * rph} 법니다`);

// If the length of your name is greater than 7 say, your name is long else say your name is short.
let name = prompt("이름이 뭐죠");
if (prompt.length > 7) {
  console.log("이름이 기네요");
} else {
  console.log("이름이 짧네요");
}

// Compare your first name length and your family name length and you should get this output.

// let firstName = 'Asabeneh'
// let lastName = 'Yetayeh'
// Your first name, Asabeneh is longer than your family name, Yetayeh
// Declare two variables myAge and yourAge and assign them initial values and myAge and yourAge.

// let myAge = 250
// let yourAge = 25
// I am 225 years older than you.
// Using prompt get the year the user was born and if the user is 18 or above allow the user to drive if not tell the user to wait a certain amount of years.

// Enter birth year: 1995
// You are 25. You are old enough to drive

// Enter birth year: 2005
// You are 15. You will be allowed to drive after 3 years.
// Write a script that prompt the user to enter number of years. Calculate the number of seconds a person can live. Assume some one lives just hundred years

// Enter number of years you live: 100
// You lived 3153600000 seconds.
// Create a human readable time format using the Date time object

// YYYY-MM-DD HH:mm
// DD-MM-YYYY HH:mm
// DD/MM/YYYY HH:mm
// Exercises: Level 3
// Create a human readable time format using the Date time object. The hour and the minute should be all the time two digits(7 hours should be 07 and 5 minutes should be 05 )
// YYY-MM-DD HH:mm eg. 20120-01-02 07:05
