#include "example.h"

int Shape::nshapes = 2;

void Shape::move(double dx, double dy) {}
double Circle::area() {return radius*radius*3.14;}
double Circle::perimeter() {return 2*radius*3.14;}

double Square::area(){return width * width;};
double Square::perimeter() {return 4*width;}
