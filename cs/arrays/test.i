%module test
%{
  #include "test.h"
%}

// Pinning
%include "arrays_csharp.i"
%apply int FIXED[] {int* sourceArray}
%csmethodmodifiers myArrayCopy "public unsafe";

// PInvoke
%apply int INPUT[]  { int* sourceArray2 }
%apply int OUTPUT[] { int* targetArray2 }
void myArrayCopy2( int* sourceArray2, int nitems0, int* targetArray2, int nitems1 );

%include "test.h"
