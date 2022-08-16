const h1 = document.getElementById("h1");

let array = [1, 2, 3, 4];
function printArray() {
  h1.innerHTML = array;
}
let newArray = [];
let k = 1;
function sort1() {
  for (let i = 0; i < array.length; i++) {
    let cMax = 0;
    let mIdx = 0;
    let willbereplaced = 0;
    for (let j = k; j < array.length; j++) {
      cMax = array[i];
      mIdx = i;
      if (cMax >= array[j]) {
        console.log(`${cMax} > ${array[j]}`);
      } else {
        cMax = array[j];
        midx = j;
        console.log(`${cMax} < ${array[j]}`);
      }
      willbereplaced = array[i + 1];
    }
    console.log(" midx : " + midx);
    console.log(" i :" + i);
    console.log(" cMax : " + cMax);
    console.log(" wbr : " + willbereplaced);
    console.log();
    // array.splice(midx, 1, cMax, willbereplaced);
    k++;
  }
}
sort1();
printArray();
setInterval(printArray, 1000);
