//c_backend.i
%module(directors="1") c_backend

    %{
#include "c_backend.h"
  %}

%feature("director") Person;
%feature("director") JobPool;

%include "c_backend.h"
