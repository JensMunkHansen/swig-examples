%module example
%{
     #include "test.h"
%}

%include "numpy.i"

%init {
  import_array();
}

%apply (float* IN_ARRAY1, int DIM1) \
{(const float* data, const int nData)}

%apply (float* IN_ARRAY2, int DIM1, int DIM2) \
{(const float* pos, const int nPositions, const int nDim)};

%include "test.h"
