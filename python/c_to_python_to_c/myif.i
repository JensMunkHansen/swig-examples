%module(directors="1") module

// We need to include myif.h in the SWIG generated C++ file
%{
#include <iostream>
#include "myif.h"
%}

// Enable cross-language polymorphism in the SWIG wrapper. 
// It's pretty slow so not enable by default
%feature("director") myif;

// Tell swig to wrap everything in myif.h
%include "myif.h"
