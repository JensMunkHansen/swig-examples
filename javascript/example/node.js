// import the extension via require
var example = require("./build/Release/example");

// calling the global method
var x = 42;
var y = 105;
var g = example.gcd(x, y);

// Accessing the global variable
var f = example.Foo;
example.Foo = 3.1415926;

console.log(g)

