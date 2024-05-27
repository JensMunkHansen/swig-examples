var example = require("./build/Release/example");

// local aliases for convenience
var Shape = example.Shape;
var Circle = example.Circle;
var Square = example.Square;

// creating new instances using the 'new' operator
var c = new Circle(10);
var s = new Square(10);

// accessing a static member
Shape.nshapes;

// accessing member variables
c.x = 20;
c.y = 30;
s.x = -10;
s.y = 5;

// calling some methods
c.area();
c.perimeter();
s.area();
s.perimeter();

// instantiation of Shape is not permitted
new Shape();
