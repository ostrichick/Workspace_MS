// Using console.log() print out the following statement:
console.log("'There is no exercise better for the heart than reaching down and lifting people up.' by John Holmes teaches us to help one another.");

// Using console.log() print out the following quote by Mother Teresa:
console.log(
  "\"Love is not patronizing and charity isn't about pity, it is about love. Charity and love are the same -- with charity you give love, so don't just give money but reach out your hand instead.\""
);

// Check if typeof '10' is exactly equal to 10. If not make it exactly equal.
console.log(typeof "10"); // string
let istrue = parseInt("10") === 10;
console.log(istrue); //true

// Check if parseFloat('9.8') is equal to 10 if not make it exactly equal with 10.
console.log(Math.ceil(parseFloat("9.8"))); //10

// Check if 'on' is found in both python and jargon
let python = "python";
let jargon = "jargon";

console.log(python.includes("on")); //true
console.log(jargon.includes("on")); //true

// I hope this course is not full of jargon. Check if jargon is in the sentence.
let jargonSentence = "I hope this course is not full of jargon.";
console.log(jargonSentence.includes("jargon")); //true

// Generate a random number between 0 and 100 inclusively.
console.log(Math.floor(Math.random() * 101));

// Generate a random number between 50 and 100 inclusively.
console.log(Math.floor(Math.random() * 50 + 50));

// Generate a random number between 0 and 255 inclusively.
console.log(Math.floor(Math.random() * 256));

// Access the 'JavaScript' string characters using a random number.

// Use console.log() and escape characters to print the following pattern.
// 1 1 1 1 1
// 2 1 2 4 8
// 3 1 3 9 27
// 4 1 4 16 64
// 5 1 5 25 125
let n = 1;

console.log(n, 1, n, n * n, n * n * n);
n++;
console.log(n, 1, n, n * n, n * n * n);
n++;
console.log(n, 1, n, n * n, n * n * n);
n++;
console.log(n, 1, n, n * n, n * n * n);
n++;
console.log(n, 1, n, n * n, n * n * n);
n++;

// Use substr to slice out the phrase because because because from the following sentence:'You cannot end a sentence with because because because is a conjunction'
let because = "You cannot end a sentence with because because because is a conjunction";
console.log(because.substring(because.indexOf("because"), because.lastIndexOf("because") + 7));

//2-3

// 'Love is the best thing in this world. Some found their love and some are still looking for their love.' Count the number of word love in this sentence.
let loveis = "Love is the best thing in this world. Some found their love and some are still looking for their love.";
let love = /love/gi;
console.log(loveis.match(love).length); //3

// Use match() to count the number of all because in the following sentence:'You cannot end a sentence with because because because is a conjunction'
let bc = /because/gi;
console.log(because.match(bc).length); //3

// Clean the following text and find the most frequent word (hint, use replace and regular expressions).
const sentence =
  "%I $am@% a %tea@cher%, &and& I lo%#ve %te@a@ching%;. The@re $is no@th@ing; &as& mo@re rewarding as educa@ting &and& @emp%o@weri@ng peo@ple. ;I found tea@ching m%o@re interesting tha@n any ot#her %jo@bs. %Do@es thi%s mo@tiv#ate yo@u to be a tea@cher!? %Th#is 30#Days&OfJavaScript &is al@so $the $resu@lt of &love& of tea&ching";

console.log(sentence.replace(/"$"|%|@|#|&|;|$/gi, ""));
//     const sentence = '%I $am@% a %tea@cher%, &and& I lo%#ve %te@a@ching%;. The@re $is no@th@ing; &as& mo@re rewarding as educa@ting &and& @emp%o@weri@ng peo@ple. ;I found tea@ching m%o@re interesting tha@n any ot#her %jo@bs. %Do@es thi%s mo@tiv#ate yo@u to be a tea@cher!? %Th#is 30#Days&OfJavaScript &is al@so $the $resu@lt of &love& of tea&ching'
// Calculate the total annual income of the person by extracting the numbers from the following text. 'He earns 5000 euro from salary per month, 10000 euro annual bonus, 15000 euro online courses per month.'
let income = "He earns 5000 euro from salary per month, 10000 euro annual bonus, 15000 euro online courses per month.";
let income_numbers = income.match(/\d+/g);
console.log((parseInt(income_numbers[0]) + parseInt(income_numbers[2])) * 12 + parseInt(income_numbers[1]));
