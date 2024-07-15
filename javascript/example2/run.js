const Swigjs = require("./build/Release/SwigJS.node");

console.log("exports :", Swigjs); //show exports to see if we have a working library

die = Swigjs.getDie(5); //get the Class pointer

console.log("foo:" + die.foo(5));
