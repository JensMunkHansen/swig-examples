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

// Stupid: TODO: Make a map similar to those of numpy.i
%typemap(csout, excode=SWIGEXCODE) int *getVector {
  global::System.IntPtr cPtr = $imcall;$excode
  int[] tmp = new int[3];
  // I have no idea why Marshal.Copy does not seem to have any support for unsigned types...
  global::System.Runtime.InteropServices.Marshal.Copy(cPtr, tmp, 0, 3);
  // There is probably a better way to go from int[3] -> uint[3], but it is not obvious to me
  //return new $typemap(cstype, $*1_type)[3]{($typemap(cstype, $*1_type))tmp[0],($typemap(cstype, $*1_type))tmp[1],($typemap(cstype, $*1_type))tmp[2]};
  return tmp;
 }

%typemap(cstype) int *getVector "$typemap(cstype, $*1_type)[]"


%include "test.h"
