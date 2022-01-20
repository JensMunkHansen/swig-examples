%module test

%{
#include "test.h"
%}

// Prove I'm not cheating here - we can't even instantiate this class
%nodefaultctor;

%include "test.h"
