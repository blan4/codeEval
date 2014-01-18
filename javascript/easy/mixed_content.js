//author: Siganov Ilya
//date: 18.01.2014
/*
MIXED CONTENT
CHALLENGE DESCRIPTION: You have a string of words and digits divided by comma. Write a program which separates words with digits. You shouldn't change the order elements.

INPUT SAMPLE: Your program should accept as its first argument a path to a filename. Input example is the following
8,33,21,0,16,50,37,0,melon,7,apricot,peach,pineapple,17,21
24,13,14,43,41

OUTPUT SAMPLE:
melon,apricot,peach,pineapple|8,33,21,0,16,50,37,0,7,17,21
24,13,14,43,41

As you cas see you need to output the same input string if it has words only or digits only.
*/

var fs  = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line != "") {
        var words = [];
        var digits = [];
        line.split(',').forEach(function (str) {
          if (parseInt(str) == str) { // is it digit or not
            digits.push(str);
          } else {
            words.push(str);
          }
        });
        words = words.join(',');
        digits = digits.join(',');
        if (words.length == 0) {
          console.log(digits);
        } else {
          if (digits.length == 0) {
            console.log(words);
          } else {
            console.log( [words, digits].join('|') );
          }
        }
    }
});